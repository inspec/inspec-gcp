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
class ApigeeOrganizationEnvgroups < GcpResourceBase
  name 'google_apigee_organization_envgroups'
  desc 'OrganizationEnvgroup plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:last_modified_ats, field: :last_modified_at)
  filter_table_config.add(:hostnames, field: :hostnames)
  filter_table_config.add(:states, field: :state)
  filter_table_config.add(:created_ats, field: :created_at)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('environmentGroups')
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
      'lastModifiedAt' => ->(obj) { [:last_modified_at, obj['lastModifiedAt']] },
      'hostnames' => ->(obj) { [:hostnames, obj['hostnames']] },
      'state' => ->(obj) { [:state, obj['state']] },
      'createdAt' => ->(obj) { [:created_at, obj['createdAt']] },
    }
  end

  private

  def product_url(_ = nil)
    'https://apigee.googleapis.com/v1/'
  end

  def resource_base_url
    '{{parent}}/envgroups'
  end
end
