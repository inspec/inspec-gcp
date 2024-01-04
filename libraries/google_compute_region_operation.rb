

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
require "gcp_backend"

# A provider to manage Compute Engine resources.
class ComputeRegionOperation < GcpResourceBase
  name "google_compute_region_operation"
  desc "RegionOperation"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :target_id
  attr_reader :status
  attr_reader :user
  attr_reader :insert_time
  attr_reader :start_time
  attr_reader :end_time
  attr_reader :progress
  attr_reader :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched["creationTimestamp"])
    @description = @fetched["description"]
    @id = @fetched["id"]
    @name = @fetched["name"]
    @target_id = @fetched["targetId"]
    @status = @fetched["status"]
    @user = @fetched["user"]
    @insert_time = @fetched["insertTime"]
    @start_time = @fetched["startTime"]
    @end_time = @fetched["endTime"]
    @progress = @fetched["progress"]
    @zone = @fetched["zone"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionOperation #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://compute.googleapis.com/compute/v1/"
  end

  def resource_base_url
    "projects/{{project}}/regions/{{region}}/operations/{{name}}"
  end
end
