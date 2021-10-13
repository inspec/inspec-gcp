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
      class InstanceTemplatePropertiesScheduling
        attr_reader :automatic_restart, :on_host_maintenance, :preemptible

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @automatic_restart = args['automaticRestart']
          @on_host_maintenance = args['onHostMaintenance']
          @preemptible = args['preemptible']
        end

        def to_s
          "#{@parent_identifier} InstanceTemplatePropertiesScheduling"
        end
      end
    end
  end
end
