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
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_base_output_directory'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_scheduling'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_worker_pool_specs'
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpec
        attr_reader :frequency

        attr_reader :max_parallel_trial_count

        attr_reader :train_trial_job_spec

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @frequency = args['frequency']
          @max_parallel_trial_count = args['maxParallelTrialCount']
          @train_trial_job_spec = GoogleInSpec::VertexAI::Property::NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpecTrainTrialJobSpec.new(args['trainTrialJobSpec'], to_s)
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpec"
        end
      end
    end
  end
end