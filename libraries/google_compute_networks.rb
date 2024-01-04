

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
class ComputeNetworks < GcpResourceBase
  name "google_compute_networks"
  desc "Network plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:gateway_ipv4s, field: :gateway_ipv4)
  filter_table_config.add(:network_ids, field: :network_id)
  filter_table_config.add(:network_names, field: :network_name)
  filter_table_config.add(:subnetworks, field: :subnetworks)
  filter_table_config.add(:auto_create_subnetworks, field: :auto_create_subnetworks)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:routing_configs, field: :routing_config)
  filter_table_config.add(:peerings, field: :peerings)
  filter_table_config.add(:mtus, field: :mtu)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource("items")
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, "Get")
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
      "description" => ->(obj) { [:description, obj["description"]] },
      "gatewayIPv4" => ->(obj) { [:gateway_ipv4, obj["gatewayIPv4"]] },
      "id" => ->(obj) { [:network_id, obj["id"]] },
      "name" => ->(obj) { [:network_name, obj["name"]] },
      "subnetworks" => ->(obj) { [:subnetworks, obj["subnetworks"]] },
      "autoCreateSubnetworks" => ->(obj) { [:auto_create_subnetworks, obj["autoCreateSubnetworks"]] },
      "creationTimestamp" => ->(obj) { [:creation_timestamp, parse_time_string(obj["creationTimestamp"])] },
      "routingConfig" => ->(obj) { [:routing_config, GoogleInSpec::Compute::Property::NetworkRoutingConfig.new(obj["routingConfig"], to_s)] },
      "peerings" => ->(obj) { [:peerings, GoogleInSpec::Compute::Property::NetworkPeeringsArray.parse(obj["peerings"], to_s)] },
      "mtu" => ->(obj) { [:mtu, obj["mtu"]] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
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
    "projects/{{project}}/global/networks"
  end
end
