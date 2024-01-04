

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
require "google/vertexai/property/nasjob_nas_job_spec_multi_trial_algorithm_spec_train_trial_spec_train_trial_job_spec_worker_pool_specs_container_spec_env"
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpecTrainTrialJobSpecWorkerPoolSpecsContainerSpec
        attr_reader :env

        attr_reader :args

        attr_reader :command

        attr_reader :image_uri

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @env = GoogleInSpec::VertexAI::Property::NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpecTrainTrialJobSpecWorkerPoolSpecsContainerSpecEnvArray.parse(args["env"], to_s)
          @args = args["args"]
          @command = args["command"]
          @image_uri = args["imageUri"]
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobSpecMultiTrialAlgorithmSpecTrainTrialSpecTrainTrialJobSpecWorkerPoolSpecsContainerSpec"
        end
      end
    end
  end
end
