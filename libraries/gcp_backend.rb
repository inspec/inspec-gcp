# frozen_string_literal: true

# GCP Inspec Backend Classes
#
# Based on the Azure Inspec classes by Russell Seymour
#

require 'google/apis'
require 'google/apis/cloudresourcemanager_v1'
require 'google/apis/compute_v1'
require 'google/apis/storage_v1'
require 'google/apis/iam_v1'
require 'googleauth'
require 'JSON'

# Class to manage the GCP connection, instantiates all required clients for Inspec resources
#
class GcpConnection
  def initialize
    scopes = ['https://www.googleapis.com/auth/cloud-platform',
              'https://www.googleapis.com/auth/compute']
    authorization = Google::Auth.get_application_default(scopes)
    Google::Apis::RequestOptions.default.authorization = authorization
  end

  def compute_client
    @compute_client ||= Google::Apis::ComputeV1::ComputeService.new
  end

  def iam_client
    @iam_client ||= Google::Apis::IamV1::IamService.new
  end

  def project_client
    @project_client ||= Google::Apis::CloudresourcemanagerV1::CloudResourceManagerService.new
  end

  def storage_client
    @storage_client ||= Google::Apis::StorageV1::StorageService.new
  end
end

# Base class for GCP resources
#
# module Inspec::Resources
class GcpResourceBase < Inspec.resource(1)
  attr_reader :opts, :gcp

  def initialize(opts)
    @opts = opts
    # ensure we have a GCP connection, resources can choose which of the clients to instantiate
    @gcp = GcpConnection.new
  end

  def failed_resource?
    @failed_resource
  end

  # Intercept GCP exceptions
  def catch_gcp_errors
    yield
    # TODO: create custom messages as needed
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
