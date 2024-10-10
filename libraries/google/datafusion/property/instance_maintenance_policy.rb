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
require 'google/datafusion/property/instance_maintenance_policy_maintenance_exclusion_window'
require 'google/datafusion/property/instance_maintenance_policy_maintenance_window'
require 'google/datafusion/property/instance_maintenance_policy_maintenance_window_recurring_time_window'
require 'google/datafusion/property/instance_maintenance_policy_maintenance_window_recurring_time_window_window'
module GoogleInSpec
  module DataFusion
    module Property
      class InstanceMaintenancePolicy
        attr_reader :maintenance_window

        attr_reader :maintenance_exclusion_window

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @maintenance_window = GoogleInSpec::DataFusion::Property::InstanceMaintenancePolicyMaintenanceWindow.new(args['maintenanceWindow'], to_s)
          @maintenance_exclusion_window = GoogleInSpec::DataFusion::Property::InstanceMaintenancePolicyMaintenanceExclusionWindow.new(args['maintenanceExclusionWindow'], to_s)
        end

        def to_s
          "#{@parent_identifier} InstanceMaintenancePolicy"
        end
      end
    end
  end
end