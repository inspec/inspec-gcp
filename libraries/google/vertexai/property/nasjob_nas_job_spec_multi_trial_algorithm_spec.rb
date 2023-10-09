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
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobSpecMultiTrialAlgorithmSpec
        attr_reader :search_trial_spec

        attr_reader :multi_trial_algorithm

        attr_reader :train_trial_spec

        attr_reader :metric

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @search_trial_spec = GoogleInSpec::VertexAI::Property::NasJobNasJobSpecMultiTrialAlgorithmSpecSearchTrialSpec.new(args['searchTrialSpec'], to_s)
          @multi_trial_algorithm = args['multiTrialAlgorithm']
          @train_trial_spec = GoogleInSpec::VertexAI::Property::NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpec.new(args['trainTrialSpec'], to_s)
          @metric = GoogleInSpec::VertexAI::Property::NasJobNasJobSpecMultiTrialAlgorithmSpecMetric.new(args['metric'], to_s)
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobSpecMultiTrialAlgorithmSpec"
        end
      end
    end
  end
end
