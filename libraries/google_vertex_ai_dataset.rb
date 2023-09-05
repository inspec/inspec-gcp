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
require 'google/vertexai/property/dataset_encryption_spec'
require 'google/vertexai/property/dataset_labels'
require 'google/vertexai/property/dataset_saved_queries'

# A provider to manage Vertex AI resources.
class VertexAIDataset < GcpResourceBase
  name 'google_vertex_ai_dataset'
  desc 'Dataset'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :saved_queries
  attr_reader :create_time
  attr_reader :encryption_spec
  attr_reader :name
  attr_reader :metadata
  attr_reader :etag
  attr_reader :description
  attr_reader :labels
  attr_reader :metadata_schema_uri
  attr_reader :metadata_artifact
  attr_reader :update_time
  attr_reader :data_item_count
  attr_reader :display_name

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @saved_queries = GoogleInSpec::VertexAI::Property::DatasetSavedQueriesArray.parse(@fetched['savedQueries'], to_s)
    @create_time = @fetched['createTime']
    @encryption_spec = GoogleInSpec::VertexAI::Property::DatasetEncryptionSpec.new(@fetched['encryptionSpec'], to_s)
    @name = @fetched['name']
    @metadata = @fetched['metadata']
    @etag = @fetched['etag']
    @description = @fetched['description']
    @labels = GoogleInSpec::VertexAI::Property::DatasetLabels.new(@fetched['labels'], to_s)
    @metadata_schema_uri = @fetched['metadataSchemaUri']
    @metadata_artifact = @fetched['metadataArtifact']
    @update_time = @fetched['updateTime']
    @data_item_count = @fetched['dataItemCount']
    @display_name = @fetched['displayName']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Dataset #{@params[:locationsId]}"
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{projects_id}}/locations/{{locations_id}}/datasets'
  end
end
