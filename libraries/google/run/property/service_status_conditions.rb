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
module GoogleInSpec
  module Run
    module Property
      class ServiceStatusConditions
        attr_reader :type

        attr_reader :status

        attr_reader :reason

        attr_reader :message

        attr_reader :last_transition_time

        attr_reader :severity

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @type = args['type']
          @status = args['status']
          @reason = args['reason']
          @message = args['message']
          @last_transition_time = args['lastTransitionTime']
          @severity = args['severity']
        end

        def to_s
          "#{@parent_identifier} ServiceStatusConditions"
        end
      end

      class ServiceStatusConditionsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServiceStatusConditions.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServiceStatusConditions.new(v, parent_identifier) }
        end
      end
    end
  end
end
