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
class ComputeGlobalAddresss < GcpResourceBase
  name 'google_compute_global_addresses'
  desc 'GlobalAddress plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:addresses, field: :address)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:label_fingerprints, field: :label_fingerprint)
  filter_table_config.add(:ip_versions, field: :ip_version)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:prefix_lengths, field: :prefix_length)
  filter_table_config.add(:address_types, field: :address_type)
  filter_table_config.add(:purposes, field: :purpose)
  filter_table_config.add(:networks, field: :network)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('items')
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
      'address' => ->(obj) { [:address, obj['address']] },
      'creationTimestamp' => ->(obj) { [:creation_timestamp, parse_time_string(obj['creationTimestamp'])] },
      'description' => ->(obj) { [:description, obj['description']] },
      'id' => ->(obj) { [:id, obj['id']] },
      'name' => ->(obj) { [:name, obj['name']] },
      'labels' => ->(obj) { [:labels, obj['labels']] },
      'labelFingerprint' => ->(obj) { [:label_fingerprint, obj['labelFingerprint']] },
      'ipVersion' => ->(obj) { [:ip_version, obj['ipVersion']] },
      'region' => ->(obj) { [:region, obj['region']] },
      'prefixLength' => ->(obj) { [:prefix_length, obj['prefixLength']] },
      'addressType' => ->(obj) { [:address_type, obj['addressType']] },
      'purpose' => ->(obj) { [:purpose, obj['purpose']] },
      'network' => ->(obj) { [:network, obj['network']] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url(beta = false)
    if beta
      'https://compute.googleapis.com/compute/beta/'
    else
      'https://compute.googleapis.com/compute/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/global/addresses'
  end
end
