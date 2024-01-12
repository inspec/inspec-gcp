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
class DLPDTs < GcpResourceBase
  name 'google_dlp_dts'
  desc 'DT plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:display_names, field: :display_name)
  filter_table_config.add(:configs, field: :config)
  filter_table_config.add(:parents, field: :parent)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('dTs')
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
      'description' => ->(obj) { [:description, obj['description']] },
      'displayName' => ->(obj) { [:display_name, obj['displayName']] },
      'config' => ->(obj) { [:config, GoogleInSpec::DLP::Property::DTConfig.new(obj['config'], to_s)] },
      'parent' => ->(obj) { [:parent, obj['parent']] },
    }
  end

  private

  def product_url(_ = nil)
    'https://dlp.googleapis.com/v2/'
  end

  def resource_base_url
    '{{parent}}/deidentifyTemplates'
  end
end
