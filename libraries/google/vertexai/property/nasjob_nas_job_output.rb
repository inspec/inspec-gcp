

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
require "google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output"
require "google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output_search_trials"
require "google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output_train_trials"
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobOutput
        attr_reader :multi_trial_job_output

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @multi_trial_job_output = GoogleInSpec::VertexAI::Property::NasJobNasJobOutputMultiTrialJobOutput.new(args["multiTrialJobOutput"], to_s)
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobOutput"
        end
      end
    end
  end
end
