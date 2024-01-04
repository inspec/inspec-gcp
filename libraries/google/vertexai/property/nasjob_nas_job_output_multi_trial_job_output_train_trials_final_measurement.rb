

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
require "google/vertexai/property/nasjob_nas_job_output_multi_trial_job_output_train_trials_final_measurement_metrics"
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobOutputMultiTrialJobOutputTrainTrialsFinalMeasurement
        attr_reader :metrics

        attr_reader :elapsed_duration

        attr_reader :step_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @metrics = GoogleInSpec::VertexAI::Property::NasJobNasJobOutputMultiTrialJobOutputTrainTrialsFinalMeasurementMetricsArray.parse(args["metrics"], to_s)
          @elapsed_duration = args["elapsedDuration"]
          @step_count = args["stepCount"]
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobOutputMultiTrialJobOutputTrainTrialsFinalMeasurement"
        end
      end
    end
  end
end
