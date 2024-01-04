

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
      class ScheduleLastScheduledRunResponse
        attr_reader :run_response

        attr_reader :scheduled_run_time

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @run_response = args["runResponse"]
          @scheduled_run_time = args["scheduledRunTime"]
        end

        def to_s
          "#{@parent_identifier} ScheduleLastScheduledRunResponse"
        end
      end
    end
  end
end
