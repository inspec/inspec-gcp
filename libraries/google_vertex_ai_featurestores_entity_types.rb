

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
require "gcp_backend"
class VertexAIFeaturestoresEntityTypes < GcpResourceBase
  name "google_vertex_ai_featurestores_entity_types"
  desc "FeaturestoresEntityType plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:monitoring_configs, field: :monitoring_config)
  filter_table_config.add(:etags, field: :etag)
  filter_table_config.add(:update_times, field: :update_time)
  filter_table_config.add(:offline_storage_ttl_days, field: :offline_storage_ttl_days)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource("entityTypes")
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
      "labels" => ->(obj) { [:labels, GoogleInSpec::VertexAI::Property::FeaturestoresEntityTypeLabels.new(obj["labels"], to_s)] },
      "description" => ->(obj) { [:description, obj["description"]] },
      "name" => ->(obj) { [:name, obj["name"]] },
      "createTime" => ->(obj) { [:create_time, obj["createTime"]] },
      "monitoringConfig" => ->(obj) { [:monitoring_config, GoogleInSpec::VertexAI::Property::FeaturestoresEntityTypeMonitoringConfig.new(obj["monitoringConfig"], to_s)] },
      "etag" => ->(obj) { [:etag, obj["etag"]] },
      "updateTime" => ->(obj) { [:update_time, obj["updateTime"]] },
      "offlineStorageTtlDays" => ->(obj) { [:offline_storage_ttl_days, obj["offlineStorageTtlDays"]] },
    }
  end

  private

  def product_url(_ = nil)
    "https://{{region}}-aiplatform.googleapis.com/v1/"
  end

  def resource_base_url
    "{{parent}}/entityTypes"
  end
end
