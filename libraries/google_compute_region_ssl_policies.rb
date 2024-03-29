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
class ComputeRegionSslPolicys < GcpResourceBase
  name 'google_compute_region_ssl_policies'
  desc 'RegionSslPolicy plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:kinds, field: :kind)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:self_links, field: :self_link)
  filter_table_config.add(:self_link_with_ids, field: :self_link_with_id)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:profiles, field: :profile)
  filter_table_config.add(:min_tls_versions, field: :min_tls_version)
  filter_table_config.add(:enabled_features, field: :enabled_features)
  filter_table_config.add(:custom_features, field: :custom_features)
  filter_table_config.add(:fingerprints, field: :fingerprint)
  filter_table_config.add(:warnings, field: :warnings)
  filter_table_config.add(:tls_settings, field: :tls_settings)
  filter_table_config.add(:regions, field: :region)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('regionSslPolicies')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'kind' => ->(obj) { [:kind, obj['kind']] },
      'id' => ->(obj) { [:id, obj['id']] },
      'creationTimestamp' => ->(obj) { [:creation_timestamp, obj['creationTimestamp']] },
      'selfLink' => ->(obj) { [:self_link, obj['selfLink']] },
      'selfLinkWithId' => ->(obj) { [:self_link_with_id, obj['selfLinkWithId']] },
      'name' => ->(obj) { [:name, obj['name']] },
      'description' => ->(obj) { [:description, obj['description']] },
      'profile' => ->(obj) { [:profile, obj['profile']] },
      'minTlsVersion' => ->(obj) { [:min_tls_version, obj['minTlsVersion']] },
      'enabledFeatures' => ->(obj) { [:enabled_features, obj['enabledFeatures']] },
      'customFeatures' => ->(obj) { [:custom_features, obj['customFeatures']] },
      'fingerprint' => ->(obj) { [:fingerprint, obj['fingerprint']] },
      'warnings' => ->(obj) { [:warnings, GoogleInSpec::Compute::Property::RegionSslPolicyWarningsArray.parse(obj['warnings'], to_s)] },
      'tlsSettings' => ->(obj) { [:tls_settings, GoogleInSpec::Compute::Property::RegionSslPolicyTlsSettings.new(obj['tlsSettings'], to_s)] },
      'region' => ->(obj) { [:region, obj['region']] },
    }
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/sslPolicies'
  end
end
