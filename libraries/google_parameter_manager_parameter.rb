# frozen_string_literal: false

require 'gcp_backend'
require 'google/parametermanager/property/policy_member'

# A provider to manage Parameter Manager resources.
class ParameterManagerParameter < GcpResourceBase
  name 'google_parameter_manager_parameter'
  desc 'Parameter'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :create_time
  attr_reader :update_time
  attr_reader :format
  attr_reader :labels
  attr_reader :policy_member
  attr_reader :kms_key

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @create_time = @fetched['createTime']
    @labels = @fetched['labels']
    @update_time = @fetched['updateTime']
    @format = @fetched['format']
    @policy_member = GoogleInSpec::ParameterManager::Property::PolicyMember.new(@fetched['policyMember'], to_s)
    @kms_key = @fetched['kmsKey']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Parameter #{@params[:name]}"
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
    '{{name}}'
  end
end
