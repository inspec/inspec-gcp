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
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec_search_trial_job_spec'
require 'google/vertexai/property/nasjob_njsmtasstsstjsbo_directory'
require 'google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_search_trial_spec_search_trial_job_spec_scheduling'
require 'google/vertexai/property/nasjob_njsmtasstsstjswp_specs'
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobSpecMultiTrialAlgorithmSpecSearchTrialSpec
        attr_reader :max_failed_trial_count

        attr_reader :max_parallel_trial_count

        attr_reader :search_trial_job_spec

        attr_reader :max_trial_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @max_failed_trial_count = args['maxFailedTrialCount']
          @max_parallel_trial_count = args['maxParallelTrialCount']
          @search_trial_job_spec = GoogleInSpec::VertexAI::Property::NasJobNasJobSpecMultiTrialAlgorithmSpecSearchTrialSpecSearchTrialJobSpec.new(args['searchTrialJobSpec'], to_s)
          @max_trial_count = args['maxTrialCount']
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobSpecMultiTrialAlgorithmSpecSearchTrialSpec"
        end
      end
    end
  end
end
