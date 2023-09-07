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
class ComputePublicDelegatedPrefixs < GcpResourceBase
  name 'google_compute_public_delegated_prefixes'
  desc 'PublicDelegatedPrefix plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:kinds, field: :kind)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:self_links, field: :self_link)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:ip_cidr_ranges, field: :ip_cidr_range)
  filter_table_config.add(:statuses, field: :status)
  filter_table_config.add(:parent_prefixes, field: :parent_prefix)
  filter_table_config.add(:public_delegated_sub_prefixs, field: :public_delegated_sub_prefixs)
  filter_table_config.add(:is_live_migrations, field: :is_live_migration)
  filter_table_config.add(:fingerprints, field: :fingerprint)

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
      'kind' => ->(obj) { return :kind, obj['kind'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'creationTimestamp' => ->(obj) { return :creation_timestamp, obj['creationTimestamp'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'selfLink' => ->(obj) { return :self_link, obj['selfLink'] },
      'region' => ->(obj) { return :region, obj['region'] },
      'ipCidrRange' => ->(obj) { return :ip_cidr_range, obj['ipCidrRange'] },
      'status' => ->(obj) { return :status, obj['status'] },
      'parentPrefix' => ->(obj) { return :parent_prefix, obj['parentPrefix'] },
      'publicDelegatedSubPrefixs' => ->(obj) { return :public_delegated_sub_prefixs, GoogleInSpec::Compute::Property::PublicDelegatedPrefixPublicDelegatedSubPrefixsArray.parse(obj['publicDelegatedSubPrefixs'], to_s) },
      'isLiveMigration' => ->(obj) { return :is_live_migration, obj['isLiveMigration'] },
      'fingerprint' => ->(obj) { return :fingerprint, obj['fingerprint'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/publicDelegatedPrefixes/{{publicDelegatedPrefix}}'
  end
end
