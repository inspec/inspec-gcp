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
class DataprocClusters < GcpResourceBase
  name 'google_dataproc_clusters'
  desc 'Cluster plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:cluster_names, field: :cluster_name)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:configs, field: :config)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:project_ids, field: :project_id)
  filter_table_config.add(:virtual_cluster_configs, field: :virtual_cluster_config)
  filter_table_config.add(:statuses, field: :status)
  filter_table_config.add(:status_histories, field: :status_history)
  filter_table_config.add(:cluster_uuids, field: :cluster_uuid)
  filter_table_config.add(:metrics, field: :metrics)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('clusters')
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
      'clusterName' => ->(obj) { [:cluster_name, obj['clusterName']] },
      'labels' => ->(obj) { [:labels, obj['labels']] },
      'config' => ->(obj) { [:config, GoogleInSpec::Dataproc::Property::ClusterConfig.new(obj['config'], to_s)] },
      'region' => ->(obj) { [:region, obj['region']] },
      'projectId' => ->(obj) { [:project_id, obj['projectId']] },
      'virtualClusterConfig' => ->(obj) { [:virtual_cluster_config, obj['virtualClusterConfig']] },
      'status' => ->(obj) { [:status, obj['status']] },
      'statusHistory' => ->(obj) { [:status_history, obj['statusHistory']] },
      'clusterUuid' => ->(obj) { [:cluster_uuid, obj['clusterUuid']] },
      'metrics' => ->(obj) { [:metrics, obj['metrics']] },
    }
  end

  private

  def product_url(beta = false)
    if beta
      'https://dataproc.googleapis.com/v1beta2/'
    else
      'https://dataproc.googleapis.com/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/clusters'
  end
end
