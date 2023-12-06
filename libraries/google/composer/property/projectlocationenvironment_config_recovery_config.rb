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
require 'google/composer/property/projectlocationenvironment_config_recovery_config_scheduled_snapshots_config'
module GoogleInSpec
  module Composer
    module Property
      class ProjectLocationEnvironmentConfigRecoveryConfig
        attr_reader :scheduled_snapshots_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @scheduled_snapshots_config = GoogleInSpec::Composer::Property::ProjectLocationEnvironmentConfigRecoveryConfigScheduledSnapshotsConfig.new(args['scheduledSnapshotsConfig'], to_s)
        end

        def to_s
          "#{@parent_identifier} ProjectLocationEnvironmentConfigRecoveryConfig"
        end
      end
    end
  end
end