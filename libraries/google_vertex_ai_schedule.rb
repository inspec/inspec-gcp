

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
require "google/vertexai/property/schedule_create_pipeline_job_request"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_encryption_spec"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_error"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context_labels"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context_metadata"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_run_context"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_run_context_labels"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_run_context_metadata"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_task_details"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_labels"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_pipeline_spec"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config_input_artifacts"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config_parameter_values"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config_parameters"
require "google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_template_metadata"
require "google/vertexai/property/schedule_last_scheduled_run_response"

# A provider to manage Vertex AI resources.
class VertexAISchedule < GcpResourceBase
  name "google_vertex_ai_schedule"
  desc "Schedule"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :started_run_count
  attr_reader :allow_queueing
  attr_reader :name
  attr_reader :cron
  attr_reader :last_pause_time
  attr_reader :create_time
  attr_reader :start_time
  attr_reader :max_run_count
  attr_reader :next_run_time
  attr_reader :update_time
  attr_reader :last_scheduled_run_response
  attr_reader :last_resume_time
  attr_reader :max_concurrent_run_count
  attr_reader :state
  attr_reader :create_pipeline_job_request
  attr_reader :display_name
  attr_reader :catch_up
  attr_reader :end_time

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @started_run_count = @fetched["startedRunCount"]
    @allow_queueing = @fetched["allowQueueing"]
    @name = @fetched["name"]
    @cron = @fetched["cron"]
    @last_pause_time = @fetched["lastPauseTime"]
    @create_time = @fetched["createTime"]
    @start_time = @fetched["startTime"]
    @max_run_count = @fetched["maxRunCount"]
    @next_run_time = @fetched["nextRunTime"]
    @update_time = @fetched["updateTime"]
    @last_scheduled_run_response = GoogleInSpec::VertexAI::Property::ScheduleLastScheduledRunResponse.new(@fetched["lastScheduledRunResponse"], to_s)
    @last_resume_time = @fetched["lastResumeTime"]
    @max_concurrent_run_count = @fetched["maxConcurrentRunCount"]
    @state = @fetched["state"]
    @create_pipeline_job_request = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequest.new(@fetched["createPipelineJobRequest"], to_s)
    @display_name = @fetched["displayName"]
    @catch_up = @fetched["catchUp"]
    @end_time = @fetched["endTime"]
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Schedule #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://{{region}}-aiplatform.googleapis.com/v1/"
  end

  def resource_base_url
    "{{name}}"
  end
end
