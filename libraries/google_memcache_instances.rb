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
class MemcacheInstances < GcpResourceBase
  name 'google_memcache_instances'
  desc 'Instance plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:display_names, field: :display_name)
  filter_table_config.add(:memcache_nodes, field: :memcache_nodes)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:discovery_endpoints, field: :discovery_endpoint)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:memcache_full_versions, field: :memcache_full_version)
  filter_table_config.add(:zones, field: :zones)
  filter_table_config.add(:authorized_networks, field: :authorized_network)
  filter_table_config.add(:node_counts, field: :node_count)
  filter_table_config.add(:memcache_versions, field: :memcache_version)
  filter_table_config.add(:node_configs, field: :node_config)
  filter_table_config.add(:parameters, field: :parameters)
  filter_table_config.add(:regions, field: :region)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('resources')
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
      'name' => ->(obj) { [:name, obj['name']] },
      'displayName' => ->(obj) { [:display_name, obj['displayName']] },
      'memcacheNodes' => ->(obj) { [:memcache_nodes, GoogleInSpec::Memcache::Property::InstanceMemcacheNodesArray.parse(obj['memcacheNodes'], to_s)] },
      'createTime' => ->(obj) { [:create_time, parse_time_string(obj['createTime'])] },
      'discoveryEndpoint' => ->(obj) { [:discovery_endpoint, obj['discoveryEndpoint']] },
      'labels' => ->(obj) { [:labels, obj['labels']] },
      'memcacheFullVersion' => ->(obj) { [:memcache_full_version, obj['memcacheFullVersion']] },
      'zones' => ->(obj) { [:zones, obj['zones']] },
      'authorizedNetwork' => ->(obj) { [:authorized_network, obj['authorizedNetwork']] },
      'nodeCount' => ->(obj) { [:node_count, obj['nodeCount']] },
      'memcacheVersion' => ->(obj) { [:memcache_version, obj['memcacheVersion']] },
      'nodeConfig' => ->(obj) { [:node_config, GoogleInSpec::Memcache::Property::InstanceNodeConfig.new(obj['nodeConfig'], to_s)] },
      'parameters' => ->(obj) { [:parameters, GoogleInSpec::Memcache::Property::InstanceParameters.new(obj['parameters'], to_s)] },
      'region' => ->(obj) { [:region, obj['region']] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url(_ = nil)
    'https://memcache.googleapis.com/v1beta2/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{region}}/instances'
  end
end
