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
  module Composer
    module Property
      class ProjectLocationEnvironmentConfigRecoveryConfigScheduledSnapshotsConfig
        attr_reader :enabled

        attr_reader :snapshot_location

        attr_reader :snapshot_creation_schedule

        attr_reader :time_zone

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enabled = args['enabled']
          @snapshot_location = args['snapshotLocation']
          @snapshot_creation_schedule = args['snapshotCreationSchedule']
          @time_zone = args['timeZone']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationEnvironmentConfigRecoveryConfigScheduledSnapshotsConfig"
        end
      end
    end
  end
end
