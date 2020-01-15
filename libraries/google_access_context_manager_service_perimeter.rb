# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
require 'google/accesscontextmanager/property/serviceperimeter_status'

# A provider to manage Access Context Manager resources.
class AccessContextManagerServicePerimeter < GcpResourceBase
  name 'google_access_context_manager_service_perimeter'
  desc 'ServicePerimeter'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :title
  attr_reader :description
  attr_reader :create_time
  attr_reader :update_time
  attr_reader :perimeter_type
  attr_reader :status
  attr_reader :parent
  attr_reader :name

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @title = @fetched['title']
    @description = @fetched['description']
    @create_time = parse_time_string(@fetched['createTime'])
    @update_time = parse_time_string(@fetched['updateTime'])
    @perimeter_type = @fetched['perimeterType']
    @status = GoogleInSpec::AccessContextManager::Property::ServicePerimeterStatus.new(@fetched['status'], to_s)
    @parent = @fetched['parent']
    @name = name_from_self_link(@fetched['name'])
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "ServicePerimeter #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://accesscontextmanager.googleapis.com/v1/'
  end

  def resource_base_url
    'accessPolicies/{{policy_name}}/servicePerimeters/{{name}}'
  end
end
