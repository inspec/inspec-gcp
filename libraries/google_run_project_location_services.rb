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
class RunProjectLocationServices < GcpResourceBase
  name 'google_run_services'
  desc 'ProjectLocationService plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:api_versions, field: :api_version)
  filter_table_config.add(:kinds, field: :kind)
  filter_table_config.add(:metadata, field: :metadata)
  filter_table_config.add(:specs, field: :spec)
  filter_table_config.add(:statuses, field: :status)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('projectLocationServices')
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
      'apiVersion' => ->(obj) { [:api_version, obj['apiVersion']] },
      'kind' => ->(obj) { [:kind, obj['kind']] },
      'metadata' => ->(obj) { [:metadata, GoogleInSpec::Run::Property::ProjectLocationServiceMetadata.new(obj['metadata'], to_s)] },
      'spec' => ->(obj) { [:spec, GoogleInSpec::Run::Property::ProjectLocationServiceSpec.new(obj['spec'], to_s)] },
      'status' => ->(obj) { [:status, GoogleInSpec::Run::Property::ProjectLocationServiceStatus.new(obj['status'], to_s)] },
    }
  end

  private

  def product_url(_ = nil)
    'https://run.googleapis.com//v2/'
  end

  def resource_base_url
    '{{+parent}}/services'
  end
end
