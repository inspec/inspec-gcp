

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
class BigQueryTables < GcpResourceBase
  name "google_bigquery_tables"
  desc "Table plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:table_references, field: :table_reference)
  filter_table_config.add(:clusterings, field: :clustering)
  filter_table_config.add(:creation_times, field: :creation_time)
  filter_table_config.add(:friendly_names, field: :friendly_name)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:last_modified_times, field: :last_modified_time)
  filter_table_config.add(:locations, field: :location)
  filter_table_config.add(:num_bytes, field: :num_bytes)
  filter_table_config.add(:num_long_term_bytes, field: :num_long_term_bytes)
  filter_table_config.add(:num_rows, field: :num_rows)
  filter_table_config.add(:require_partition_filters, field: :require_partition_filter)
  filter_table_config.add(:types, field: :type)
  filter_table_config.add(:views, field: :view)
  filter_table_config.add(:time_partitionings, field: :time_partitioning)
  filter_table_config.add(:streaming_buffers, field: :streaming_buffer)
  filter_table_config.add(:schemas, field: :schema)
  filter_table_config.add(:encryption_configurations, field: :encryption_configuration)
  filter_table_config.add(:expiration_times, field: :expiration_time)
  filter_table_config.add(:external_data_configurations, field: :external_data_configuration)
  filter_table_config.add(:datasets, field: :dataset)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource("tables")
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
      "tableReference" => ->(obj) { [:table_reference, GoogleInSpec::BigQuery::Property::TableTableReference.new(obj["tableReference"], to_s)] },
      "clustering" => ->(obj) { [:clustering, obj["clustering"]] },
      "creationTime" => ->(obj) { [:creation_time, obj["creationTime"]] },
      "friendlyName" => ->(obj) { [:friendly_name, obj["friendlyName"]] },
      "id" => ->(obj) { [:id, obj["id"]] },
      "labels" => ->(obj) { [:labels, obj["labels"]] },
      "lastModifiedTime" => ->(obj) { [:last_modified_time, obj["lastModifiedTime"]] },
      "location" => ->(obj) { [:location, obj["location"]] },
      "numBytes" => ->(obj) { [:num_bytes, obj["numBytes"]] },
      "numLongTermBytes" => ->(obj) { [:num_long_term_bytes, obj["numLongTermBytes"]] },
      "numRows" => ->(obj) { [:num_rows, obj["numRows"]] },
      "requirePartitionFilter" => ->(obj) { [:require_partition_filter, obj["requirePartitionFilter"]] },
      "type" => ->(obj) { [:type, obj["type"]] },
      "view" => ->(obj) { [:view, GoogleInSpec::BigQuery::Property::TableView.new(obj["view"], to_s)] },
      "timePartitioning" => ->(obj) { [:time_partitioning, GoogleInSpec::BigQuery::Property::TableTimePartitioning.new(obj["timePartitioning"], to_s)] },
      "streamingBuffer" => ->(obj) { [:streaming_buffer, GoogleInSpec::BigQuery::Property::TableStreamingBuffer.new(obj["streamingBuffer"], to_s)] },
      "schema" => ->(obj) { [:schema, GoogleInSpec::BigQuery::Property::TableSchema.new(obj["schema"], to_s)] },
      "encryptionConfiguration" => ->(obj) { [:encryption_configuration, GoogleInSpec::BigQuery::Property::TableEncryptionConfiguration.new(obj["encryptionConfiguration"], to_s)] },
      "expirationTime" => ->(obj) { [:expiration_time, obj["expirationTime"]] },
      "externalDataConfiguration" => ->(obj) { [:external_data_configuration, GoogleInSpec::BigQuery::Property::TableExternalDataConfiguration.new(obj["externalDataConfiguration"], to_s)] },
      "dataset" => ->(obj) { [:dataset, obj["dataset"]] },
    }
  end

  private

  def product_url(_ = nil)
    "https://bigquery.googleapis.com/bigquery/v2/"
  end

  def resource_base_url
    "projects/{{project}}/datasets/{{dataset}}/tables"
  end
end
