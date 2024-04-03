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
require 'google/compute/property/regionsslpolicy_tls_settings'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_certificate_paths'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config_grpc_service_config'
require 'google/compute/property/regionsslpolicy_tsptcccscgscc_credentials'
require 'google/compute/property/regionsslpolicy_tsptcccscgscccf_plugin'
require 'google/compute/property/regionsslpolicy_tsptcccscgsccc_certificates'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_validation_context'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_validation_context_sds_config'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_validation_context_sds_config_grpc_service_config'
require 'google/compute/property/regionsslpolicy_tsptcvcscgscc_credentials'
require 'google/compute/property/regionsslpolicy_tsptcvcscgscccf_plugin'
require 'google/compute/property/regionsslpolicy_tsptcvcscgsccc_certificates'
require 'google/compute/property/regionsslpolicy_warnings'

# A provider to manage Compute Engine resources.
class ComputeRegionSslPolicy < GcpResourceBase
  name 'google_compute_region_ssl_policy'
  desc 'RegionSslPolicy'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :kind
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :self_link
  attr_reader :self_link_with_id
  attr_reader :name
  attr_reader :description
  attr_reader :profile
  attr_reader :min_tls_version
  attr_reader :enabled_features
  attr_reader :custom_features
  attr_reader :fingerprint
  attr_reader :warnings
  attr_reader :tls_settings
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @kind = @fetched['kind']
    @id = @fetched['id']
    @creation_timestamp = @fetched['creationTimestamp']
    @self_link = @fetched['selfLink']
    @self_link_with_id = @fetched['selfLinkWithId']
    @name = @fetched['name']
    @description = @fetched['description']
    @profile = @fetched['profile']
    @min_tls_version = @fetched['minTlsVersion']
    @enabled_features = @fetched['enabledFeatures']
    @custom_features = @fetched['customFeatures']
    @fingerprint = @fetched['fingerprint']
    @warnings = GoogleInSpec::Compute::Property::RegionSslPolicyWarningsArray.parse(@fetched['warnings'], to_s)
    @tls_settings = GoogleInSpec::Compute::Property::RegionSslPolicyTlsSettings.new(@fetched['tlsSettings'], to_s)
    @region = @fetched['region']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionSslPolicy #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/sslPolicies/{{name}}'
  end
end