

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
require "google/vertexai/property/customjob_encryption_spec"
require "google/vertexai/property/customjob_error"
require "google/vertexai/property/customjob_job_spec"
require "google/vertexai/property/customjob_job_spec_base_output_directory"
require "google/vertexai/property/customjob_job_spec_scheduling"
require "google/vertexai/property/customjob_job_spec_worker_pool_specs"
require "google/vertexai/property/customjob_labels"
require "google/vertexai/property/customjob_web_access_uris"

# A provider to manage Vertex AI resources.
class VertexAICustomJob < GcpResourceBase
  name "google_vertex_ai_custom_job"
  desc "CustomJob"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :error
  attr_reader :web_access_uris
  attr_reader :job_spec
  attr_reader :start_time
  attr_reader :labels
  attr_reader :encryption_spec
  attr_reader :create_time
  attr_reader :update_time
  attr_reader :end_time
  attr_reader :state
  attr_reader :display_name
  attr_reader :name

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @error = GoogleInSpec::VertexAI::Property::CustomJobError.new(@fetched["error"], to_s)
    @web_access_uris = GoogleInSpec::VertexAI::Property::CustomJobWebAccessUris.new(@fetched["webAccessUris"], to_s)
    @job_spec = GoogleInSpec::VertexAI::Property::CustomJobJobSpec.new(@fetched["jobSpec"], to_s)
    @start_time = @fetched["startTime"]
    @labels = GoogleInSpec::VertexAI::Property::CustomJobLabels.new(@fetched["labels"], to_s)
    @encryption_spec = GoogleInSpec::VertexAI::Property::CustomJobEncryptionSpec.new(@fetched["encryptionSpec"], to_s)
    @create_time = @fetched["createTime"]
    @update_time = @fetched["updateTime"]
    @end_time = @fetched["endTime"]
    @state = @fetched["state"]
    @display_name = @fetched["displayName"]
    @name = @fetched["name"]
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "CustomJob #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://{{region}}-aiplatform.googleapis.com/v1/"
  end

  def resource_base_url
    "{{name}}"
  end
end
