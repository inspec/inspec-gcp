# frozen_string_literal: true

# GCP Inspec Backend Classes
#
# Based on the Azure Inspec classes by Russell Seymour
#

require 'json'
require 'net/http'
require 'googleauth'

# Base class for GCP resources - depends on train GCP transport for connection
#
# module Inspec::Resources
class GcpResourceBase < Inspec.resource(1)
  attr_reader :opts, :gcp

  def initialize(opts)
    @opts = opts
    # ensure we have a GCP connection, resources can choose which of the clients to instantiate
    @gcp = inspec.backend

    # Magic Modules generated resources use an alternate transport method
    # In the future this will be moved into the train-gcp plugin itself
    @connection = GcpApiConnection.new if opts[:use_http_transport]
  end

  def failed_resource?
    @failed_resource
  end

  # Intercept GCP exceptions
  def catch_gcp_errors
    yield
    # create custom messages as needed
  rescue Google::Apis::ClientError => e
    error = JSON.parse(e.body)
    fail_resource error['error']['message']
    @failed_resource = true
    nil
  end

  def create_resource_methods(object)
    dm = GcpResourceDynamicMethods.new
    dm.create_methods(self, object)
  end

  def name_from_self_link(property)
    property&.split('/')&.last
  end
end
# end

# Class to create methods on the calling object at run time.  Heavily based on the Azure Inspec resources.
#
class GcpResourceDynamicMethods
  # Given the calling object and its data, create the methods on the object according
  # to the data that has been retrieved. Various types of data can be returned so the method
  # checks the type to ensure that the necessary methods are configured correctly
  #
  # @param GcpResourceProbe|GcpResource object The object on which the methods should be craeted
  # @param variant data The data from which the methods should be created
  def create_methods(object, data)
    # Check the type of data as this affects the setup of the methods
    # If it is an Gcp Generic Resource then setup methods for each of
    # the instance variables
    case data.class.to_s
    when /Google::Apis::.*/
      # iterate around the instance variables
      data.instance_variables.each do |var|
        create_method(object, var.to_s.delete('@'), data.instance_variable_get(var))
      end
      # When the data is a Hash object iterate around each of the key value pairs and
      # craete a method for each one.
    when 'Hash'
      data.each do |key, value|
        create_method(object, key, value)
      end
    end
  end

  private

  # Method that is responsible for creating the method on the calling object. This is
  # because some nesting maybe required. For example of the value is a Hash then it will
  # need to have an GcpResourceProbe create for each key, whereas if it is a simple
  # string then the value just needs to be returned
  #
  def create_method(object, name, value)
    # Create the necessary method based on the var that has been passed
    # Test the value for its type so that the method can be setup correctly
    case value.class.to_s
    when 'String', 'Integer', 'TrueClass', 'FalseClass', 'Fixnum'
      object.define_singleton_method name do
        value
      end
    when 'Hash'
      value.count.zero? ? return_value = value : return_value = GcpResourceProbe.new(value)
      object.define_singleton_method name do
        return_value
      end
    # there are nested Google API classes throughout
    when /Google::Apis::.*/
      object.define_singleton_method name do
        if value.respond_to? :to_h
          value = value.to_h
        end
        GcpResourceProbe.new(value)
      end
    when 'Array'
      # Some things are just string or integer arrays
      # Check this by seeing if the first element is a string / integer / boolean or
      # a hashtable
      # This may not be the best method, but short of testing all elements in the array, this is
      # the quickest test
      # p value[0].class.to_s
      case value[0].class.to_s
      when 'String', 'Integer', 'TrueClass', 'FalseClass', 'Fixnum'
        probes = value
      else
        probes = []
        value.each do |value_item|
          # p value_item
          if value_item.respond_to? :to_h
            value_item = value_item.to_h
          end
          probes << GcpResourceProbe.new(value_item)
        end
      end
      object.define_singleton_method name do
        probes
      end
    end
  end
end

# Class object that is created for each element that is returned by GCP.
# This is what is interogated by Inspec. If they are nested hashes, then this results
# in nested GcpResourceProbe objects.
#
# The methods for each of the classes are dynamically defined at run time and will
# match the items that are retrieved from GCP. See the 'test/integration/verify/controls' for
# examples
#
class GcpResourceProbe
  attr_reader :name, :type, :location, :item, :count

  # Initialize method for the class. Accepts an item, be it a scalar value, hash or GCP object
  # It will then create the necessary dynamic methods so that they can be called in the tests
  # This is accomplished by call the GcpResourceDynamicMethods
  #
  # @param varaint The item from which the class will be initialized
  #
  # @return GcpResourceProbe
  def initialize(item)
    dm = GcpResourceDynamicMethods.new
    dm.create_methods(self, item)

    # Set the item as a property on the class
    # This is so that it is possible to interrogate what has been added to the class and isolate them from
    # the standard methods that a Ruby class has.
    # This used for checking Tags on a resource for example
    # It also allows direct access if so required
    @item = item

    # Set how many items have been set
    @count = item.length if item.respond_to? :length
  end

  # Allows resources to respond to the include test
  # This means that things like tags can be checked for and then their value tested
  #
  # @param [String] key Name of the item to look for in the @item property
  def include?(key)
    @item.key?(key)
  end

  # Give a sting like `computer_name` return the camelCase version, e.g.
  # computerName
  #
  # @param string data Data that needs to be converted from snake_case to camelCase
  #
  # @return string
  def camel_case(data)
    camel_case_data = data.split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join

    # Ensure that gb (as in gigabytes) is uppercased
    camel_case_data.gsub(/[gb]/, &:upcase)
  end
end

class GcpApiConnection
  def initialize
    @service_account_file = ENV['GOOGLE_APPLICATION_CREDENTIALS']
  end

  def fetch_auth
    unless @service_account_file.nil?
      return Network::Authorization.new.for!(
        [
          'https://www.googleapis.com/auth/cloud-platform',
        ],
      ).from_service_account_json!(
        @service_account_file,
      )
    end
    Network::Authorization.new.from_application_default!
  end

  def fetch(base_url, template, var_data)
    get_request = Network::Base.new(
      build_uri(base_url, template, var_data),
      fetch_auth,
    )
    return_if_object get_request.send
  end

  def fetch_all(base_url, template, var_data)
    next_page(build_uri(base_url, template, var_data))
  end

  def next_page(uri, token = nil)
    next_hash = {}
    next_hash['pageToken'] = token unless token.nil?
    current_params = Hash[URI.decode_www_form(uri.query || '')].merge(next_hash)
    uri.query = URI.encode_www_form(current_params)
    get_request = Network::Base.new(
      uri,
      fetch_auth,
    )
    result = JSON.parse(get_request.send.body)
    next_page_token = result['nextPageToken']
    return [result] if next_page_token.nil?

    [result] + next_page(uri, next_page_token)
  end

  def return_if_object(response)
    raise "Bad response: #{response.body}" \
      if response.is_a?(Net::HTTPBadRequest)
    raise "Bad response: #{response}" \
      unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w{error errors}, 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    result
  end

  def raise_if_errors(response, err_path, msg_field)
    errors = self.class.navigate(response, err_path)
    raise_error(errors, msg_field) unless errors.nil?
  end

  def raise_error(errors, msg_field)
    raise IOError, ['Operation failed:',
                    errors.map { |e| e[msg_field] }.join(', ')].join(' ')
  end

  def build_uri(base_url, template, var_data)
    URI.join(
      base_url,
      expand_variables(template, var_data),
    )
  end

  # Allows fetching objects within a tree path.
  def self.navigate(source, path, default = nil)
    key = path.take(1)[0]
    path = path.drop(1)
    return default unless source.key?(key)
    result = source.fetch(key)
    return navigate(result, path, default) unless path.empty?
    return result if path.empty?
  end

  def extract_variables(template)
    template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
            .map(&:to_sym)
  end

  def expand_variables(template, var_data)
    extract_variables(template).each do |v|
      unless var_data.key?(v)
        raise "Missing variable :#{v} in #{var_data} on #{caller.join("\n")}}"
      end
      template.gsub!(/{{#{v}}}/, var_data[v].to_s)
    end
    template
  end
end

# A handler for authenticated network request
module Network
  class Base
    def initialize(link, cred)
      @link = link
      @cred = cred
    end

    def builder
      Net::HTTP.const_get('Get')
    end

    def send
      request = @cred.authorize(builder.new(@link))
      request['User-Agent'] = generate_user_agent
      response = transport(request).request(request)
      unless ENV['GOOGLE_HTTP_VERBOSE'].nil?
        puts ["network(#{request}: [#{response.code}]",
              response.body.split("\n").map(&:strip).join(' ')].join(' ')
      end
      response
    end

    def transport(request)
      uri = request.uri
      puts "network(#{request}: #{uri})" \
        unless ENV['GOOGLE_HTTP_VERBOSE'].nil?
      transport = Net::HTTP.new(uri.host, uri.port)
      transport.use_ssl = uri.is_a?(URI::HTTPS)
      transport.verify_mode = OpenSSL::SSL::VERIFY_PEER
      transport.set_debug_output $stderr \
        unless ENV['GOOGLE_HTTP_DEBUG'].nil?
      transport
    end

    private

    def generate_user_agent
      'inspec-google/1.0.0'
    end
  end

  # A class to aquire credentials and authorize Google API calls.
  class Authorization
    def initialize
      @authorization = nil
      @scopes = []
    end

    def authorize(obj)
      raise ArgumentError, 'A from_* method needs to be called before' \
        unless @authorization

      if obj.class <= URI::HTTPS || obj.class <= URI::HTTP
        authorize_uri obj
      elsif obj.class < Net::HTTPRequest
        authorize_http obj
      else
        obj.authorization = @authorization
        obj
      end
    end

    def for!(*scopes)
      @scopes = scopes
      self
    end

    def from_service_account_json!(service_account_file)
      raise 'Missing argument for scopes' if @scopes.empty?
      @authorization = ::Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: File.open(service_account_file),
        scope: @scopes,
      )
      self
    end

    def from_application_default!
      @authorization = ::Google::Auth.get_application_default
      self
    end

    private

    def authorize_uri(obj)
      http = Net::HTTP.new(obj.host, obj.port)
      http.use_ssl = obj.instance_of?(URI::HTTPS)
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      [http, authorize_http(Net::HTTP::Get.new(obj.request_uri))]
    end

    def authorize_http(req)
      req.extend TokenProperty
      auth = {}
      @authorization.apply!(auth)
      req['Authorization'] = auth[:authorization]
      req.token = auth[:authorization].split(' ')[1]
      req
    end
  end
  # Extension methods to enable retrieving the authentication token.
  module TokenProperty
    attr_reader :token
    attr_writer :token
  end
end
