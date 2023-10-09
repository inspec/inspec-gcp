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
require 'google/vertexai/property/pipelinejob_encryption_spec'
require 'google/vertexai/property/pipelinejob_error'
require 'google/vertexai/property/pipelinejob_job_detail'
require 'google/vertexai/property/pipelinejob_job_detail_pipeline_context'
require 'google/vertexai/property/pipelinejob_job_detail_pipeline_context_labels'
require 'google/vertexai/property/pipelinejob_job_detail_pipeline_context_metadata'
require 'google/vertexai/property/pipelinejob_job_detail_pipeline_run_context'
require 'google/vertexai/property/pipelinejob_job_detail_pipeline_run_context_labels'
require 'google/vertexai/property/pipelinejob_job_detail_pipeline_run_context_metadata'
require 'google/vertexai/property/pipelinejob_job_detail_task_details'
require 'google/vertexai/property/pipelinejob_labels'
require 'google/vertexai/property/pipelinejob_pipeline_spec'
require 'google/vertexai/property/pipelinejob_runtime_config'
require 'google/vertexai/property/pipelinejob_runtime_config_input_artifacts'
require 'google/vertexai/property/pipelinejob_runtime_config_parameter_values'
require 'google/vertexai/property/pipelinejob_runtime_config_parameters'
require 'google/vertexai/property/pipelinejob_template_metadata'

# A provider to manage Vertex AI resources.
class VertexAIPipelineJob < GcpResourceBase
  name 'google_vertex_ai_pipeline_job'
  desc 'PipelineJob'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :encryption_spec
  attr_reader :end_time
  attr_reader :error
  attr_reader :update_time
  attr_reader :job_detail
  attr_reader :template_metadata
  attr_reader :state
  attr_reader :create_time
  attr_reader :name
  attr_reader :schedule_name
  attr_reader :reserved_ip_ranges
  attr_reader :start_time
  attr_reader :service_account
  attr_reader :display_name
  attr_reader :template_uri
  attr_reader :pipeline_spec
  attr_reader :network
  attr_reader :labels
  attr_reader :runtime_config

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @encryption_spec = GoogleInSpec::VertexAI::Property::PipelineJobEncryptionSpec.new(@fetched['encryptionSpec'], to_s)
    @end_time = @fetched['endTime']
    @error = GoogleInSpec::VertexAI::Property::PipelineJobError.new(@fetched['error'], to_s)
    @update_time = @fetched['updateTime']
    @job_detail = GoogleInSpec::VertexAI::Property::PipelineJobJobDetail.new(@fetched['jobDetail'], to_s)
    @template_metadata = GoogleInSpec::VertexAI::Property::PipelineJobTemplateMetadata.new(@fetched['templateMetadata'], to_s)
    @state = @fetched['state']
    @create_time = @fetched['createTime']
    @name = @fetched['name']
    @schedule_name = @fetched['scheduleName']
    @reserved_ip_ranges = @fetched['reservedIpRanges']
    @start_time = @fetched['startTime']
    @service_account = @fetched['serviceAccount']
    @display_name = @fetched['displayName']
    @template_uri = @fetched['templateUri']
    @pipeline_spec = GoogleInSpec::VertexAI::Property::PipelineJobPipelineSpec.new(@fetched['pipelineSpec'], to_s)
    @network = @fetched['network']
    @labels = GoogleInSpec::VertexAI::Property::PipelineJobLabels.new(@fetched['labels'], to_s)
    @runtime_config = GoogleInSpec::VertexAI::Property::PipelineJobRuntimeConfig.new(@fetched['runtimeConfig'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "PipelineJob #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{name}}'
  end
end
