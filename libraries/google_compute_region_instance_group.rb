

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
require "google/compute/property/regioninstancegroup_named_ports"

# A provider to manage Compute Engine resources.
class ComputeRegionInstanceGroup < GcpResourceBase
  name "google_compute_region_instance_group"
  desc "RegionInstanceGroup"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :fingerprint
  attr_reader :network
  attr_reader :zone
  attr_reader :size
  attr_reader :region
  attr_reader :named_ports

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
    @fingerprint = @fetched["fingerprint"]
    @network = @fetched["network"]
    @zone = @fetched["zone"]
    @size = @fetched["size"]
    @region = @fetched["region"]
    @named_ports = GoogleInSpec::Compute::Property::RegionInstanceGroupNamedPortsArray.parse(@fetched["namedPorts"], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionInstanceGroup #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://compute.googleapis.com/compute/v1/"
  end

  def resource_base_url
    "projects/{{project}}/regions/{{region}}/instanceGroups/{{name}}"
  end
end
