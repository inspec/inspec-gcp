# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
  module Compute
    module Property
      class AutoscalerAutoscalingPolicyScalingSchedules
        attr_reader :min_required_replicas

        attr_reader :schedule

        attr_reader :time_zone

        attr_reader :duration_sec

        attr_reader :disabled

        attr_reader :description

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @min_required_replicas = args['minRequiredReplicas']
          @schedule = args['schedule']
          @time_zone = args['timeZone']
          @duration_sec = args['durationSec']
          @disabled = args['disabled']
          @description = args['description']
        end

        def to_s
          "#{@parent_identifier} AutoscalerAutoscalingPolicyScalingSchedules"
        end
      end
    end
  end
end