

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
require "gcp_backend"
require "google/compute/property/regionbackendservice_backends"
require "google/compute/property/regionbackendservice_cdn_policy"
require "google/compute/property/regionbackendservice_cdn_policy_cache_key_policy"
require "google/compute/property/regionbackendservice_cdn_policy_negative_caching_policy"
require "google/compute/property/regionbackendservice_circuit_breakers"
require "google/compute/property/regionbackendservice_circuit_breakers_connect_timeout"
require "google/compute/property/regionbackendservice_connection_draining"
require "google/compute/property/regionbackendservice_consistent_hash"
require "google/compute/property/regionbackendservice_consistent_hash_http_cookie"
require "google/compute/property/regionbackendservice_consistent_hash_http_cookie_ttl"
require "google/compute/property/regionbackendservice_failover_policy"
require "google/compute/property/regionbackendservice_log_config"
require "google/compute/property/regionbackendservice_outlier_detection"
require "google/compute/property/regionbackendservice_outlier_detection_base_ejection_time"
require "google/compute/property/regionbackendservice_outlier_detection_interval"

# A provider to manage Compute Engine resources.
class ComputeRegionBackendService < GcpResourceBase
  name "google_compute_region_backend_service"
  desc "RegionBackendService"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :affinity_cookie_ttl_sec
  attr_reader :backends
  attr_reader :circuit_breakers
  attr_reader :consistent_hash
  attr_reader :cdn_policy
  attr_reader :connection_draining
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :failover_policy
  attr_reader :enable_cdn
  attr_reader :fingerprint
  attr_reader :health_checks
  attr_reader :id
  attr_reader :load_balancing_scheme
  attr_reader :locality_lb_policy
  attr_reader :name
  attr_reader :outlier_detection
  attr_reader :port_name
  attr_reader :protocol
  attr_reader :session_affinity
  attr_reader :timeout_sec
  attr_reader :log_config
  attr_reader :network
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @affinity_cookie_ttl_sec = @fetched["affinityCookieTtlSec"]
    @backends = GoogleInSpec::Compute::Property::RegionBackendServiceBackendsArray.parse(@fetched["backends"], to_s)
    @circuit_breakers = GoogleInSpec::Compute::Property::RegionBackendServiceCircuitBreakers.new(@fetched["circuitBreakers"], to_s)
    @consistent_hash = GoogleInSpec::Compute::Property::RegionBackendServiceConsistentHash.new(@fetched["consistentHash"], to_s)
    @cdn_policy = GoogleInSpec::Compute::Property::RegionBackendServiceCdnPolicy.new(@fetched["cdnPolicy"], to_s)
    @connection_draining = GoogleInSpec::Compute::Property::RegionBackendServiceConnectionDraining.new(@fetched["connectionDraining"], to_s)
    @creation_timestamp = parse_time_string(@fetched["creationTimestamp"])
    @description = @fetched["description"]
    @failover_policy = GoogleInSpec::Compute::Property::RegionBackendServiceFailoverPolicy.new(@fetched["failoverPolicy"], to_s)
    @enable_cdn = @fetched["enableCDN"]
    @fingerprint = @fetched["fingerprint"]
    @health_checks = @fetched["healthChecks"]
    @id = @fetched["id"]
    @load_balancing_scheme = @fetched["loadBalancingScheme"]
    @locality_lb_policy = @fetched["localityLbPolicy"]
    @name = @fetched["name"]
    @outlier_detection = GoogleInSpec::Compute::Property::RegionBackendServiceOutlierDetection.new(@fetched["outlierDetection"], to_s)
    @port_name = @fetched["portName"]
    @protocol = @fetched["protocol"]
    @session_affinity = @fetched["sessionAffinity"]
    @timeout_sec = @fetched["timeoutSec"]
    @log_config = GoogleInSpec::Compute::Property::RegionBackendServiceLogConfig.new(@fetched["logConfig"], to_s)
    @network = @fetched["network"]
    @region = @fetched["region"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionBackendService #{@params[:name]}"
  end

  private

  def product_url(beta = false)
    if beta
      "https://compute.googleapis.com/compute/beta/"
    else
      "https://compute.googleapis.com/compute/v1/"
    end
  end

  def resource_base_url
    "projects/{{project}}/regions/{{region}}/backendServices/{{name}}"
  end
end
