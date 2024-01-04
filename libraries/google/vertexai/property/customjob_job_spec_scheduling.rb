

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
module GoogleInSpec
  module VertexAI
    module Property
      class CustomJobJobSpecScheduling
        attr_reader :disable_retries

        attr_reader :timeout

        attr_reader :restart_job_on_worker_restart

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @disable_retries = args["disableRetries"]
          @timeout = args["timeout"]
          @restart_job_on_worker_restart = args["restartJobOnWorkerRestart"]
        end

        def to_s
          "#{@parent_identifier} CustomJobJobSpecScheduling"
        end
      end
    end
  end
end
