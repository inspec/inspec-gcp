# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
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

# A provider to manage Compute Engine resources.
class ComputeGlobalOperation < GcpResourceBase
  name 'google_compute_global_operation'
  desc 'GlobalOperation'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :zone
  attr_reader :client_operation_id
  attr_reader :operation_type
  attr_reader :user
  attr_reader :progress
  attr_reader :insert_time
  attr_reader :start_time
  attr_reader :end_time
  attr_reader :status
  attr_reader :status_message

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @zone = @fetched['zone']
    @client_operation_id = @fetched['clientOperationId']
    @operation_type = @fetched['operationType']
    @user = @fetched['user']
    @progress = @fetched['progress']
    @insert_time = parse_time_string(@fetched['insertTime'])
    @start_time = parse_time_string(@fetched['startTime'])
    @end_time = parse_time_string(@fetched['endTime'])
    @status = @fetched['status']
    @status_message = @fetched['statusMessage']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "GlobalOperation #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/operations/{{name}}'
  end
end
