# frozen_string_literal: false

require 'gcp_backend'
require 'google/parametermanager/property/payload'

class ParameterManagerParameterVersion < GcpResourceBase
  name 'google_parameter_manager_parameter_version'
  desc 'ParameterVersion'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :payload
  attr_reader :rendered_payload
  attr_reader :create_time
  attr_reader :update_time
  attr_reader :disabled
  attr_reader :kms_key_version

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @payload = GoogleInSpec::ParameterManager::Property::Payload.new(@fetched['payload'], to_s)

    # Conditionally set if they exist
    if @params[:render_secret] == true
      @rendered_payload = @fetched['renderedPayload']
      @name = @fetched['parameterVersion']
    else
      @name = @fetched['name']
      @create_time = @fetched['createTime'] if @fetched.key?('createTime')
      @update_time = @fetched['updateTime'] if @fetched.key?('updateTime')
    end
    @disabled = @fetched['disabled'] if @fetched.key?('disabled')
    @kms_key_version = @fetched['kmsKeyVersion'] if @fetched.key?('kmsKeyVersion')
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "ParameterVersion #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    if @params[:region] && @params[:region] != 'global'
      "https://parametermanager.#{@params[:region]}.rep.googleapis.com/v1/"
    else
      'https://parametermanager.googleapis.com/v1/'
    end
  end

  def resource_base_url
    if @params[:render_secret] == true
      '{{name}}:render'
    else
      '{{name}}'
    end
  end
end
