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
require 'google/vertexai/property/nasjob_encryption_spec'
require 'google/vertexai/property/nasjob_error'
require 'google/vertexai/property/nasjob_labels'
require 'google/vertexai/property/nasjob_nas_job_output'
require 'google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output'
require 'google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output_search_trials'
require 'google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output_train_trials'
require 'google/vertexai/property/nasjob_nas_job_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_metric'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec_search_trial_job_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec_search_trial_job_spec_base_output_directory'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec_search_trial_job_spec_scheduling'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec_search_trial_job_spec_worker_pool_specs'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_base_output_directory'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_scheduling'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_worker_pool_specs'

# A provider to manage Vertex AI resources.
class VertexAINasJob < GcpResourceBase
  name 'google_vertex_ai_nas_job'
  desc 'NasJob'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :nas_job_output
  attr_reader :name
  attr_reader :end_time
  attr_reader :error
  attr_reader :state
  attr_reader :create_time
  attr_reader :display_name
  attr_reader :nas_job_spec
  attr_reader :enable_restricted_image_training
  attr_reader :start_time
  attr_reader :encryption_spec
  attr_reader :labels
  attr_reader :update_time

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @nas_job_output = GoogleInSpec::VertexAI::Property::NasJobNasJobOutput.new(@fetched['nasJobOutput'], to_s)
    @name = @fetched['name']
    @end_time = @fetched['endTime']
    @error = GoogleInSpec::VertexAI::Property::NasJobError.new(@fetched['error'], to_s)
    @state = @fetched['state']
    @create_time = @fetched['createTime']
    @display_name = @fetched['displayName']
    @nas_job_spec = GoogleInSpec::VertexAI::Property::NasJobNasJobSpec.new(@fetched['nasJobSpec'], to_s)
    @enable_restricted_image_training = @fetched['enableRestrictedImageTraining']
    @start_time = @fetched['startTime']
    @encryption_spec = GoogleInSpec::VertexAI::Property::NasJobEncryptionSpec.new(@fetched['encryptionSpec'], to_s)
    @labels = GoogleInSpec::VertexAI::Property::NasJobLabels.new(@fetched['labels'], to_s)
    @update_time = @fetched['updateTime']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "NasJob #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{name}}'
  end
end
