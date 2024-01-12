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
class AppEngineStandardAppVersions < GcpResourceBase
  name 'google_appengine_standard_app_versions'
  desc 'StandardAppVersion plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:version_ids, field: :version_id)
  filter_table_config.add(:runtimes, field: :runtime)
  filter_table_config.add(:threadsaves, field: :threadsafe)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('versions')
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
      'id' => ->(obj) { [:version_id, obj['id']] },
      'runtime' => ->(obj) { [:runtime, obj['runtime']] },
      'threadsafe' => ->(obj) { [:threadsafe, obj['threadsafe']] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def identifiers
    params = %w{project service version_id}

    result = []
    @table.each do |item|
      combo = item.merge(@params)
      item_identifiers = {}
      params.each do |param|
        item_identifiers[param.to_sym] = combo[param.to_sym]
      end
      result.push(item_identifiers)
    end
    result
  end

  private

  def product_url
    'https://appengine.googleapis.com/v1/'
  end

  def resource_base_url
    'apps/{{project}}/services/{{service}}/versions'
  end
end
