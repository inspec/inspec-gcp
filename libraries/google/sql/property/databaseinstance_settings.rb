

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
require "google/sql/property/databaseinstance_settings_backup_configuration"
require "google/sql/property/databaseinstance_settings_database_flags"
require "google/sql/property/databaseinstance_settings_ip_configuration"
require "google/sql/property/databaseinstance_settings_ip_configuration_authorized_networks"
module GoogleInSpec
  module SQL
    module Property
      class DatabaseInstanceSettings
        attr_reader :kind

        attr_reader :database_flags

        attr_reader :ip_configuration

        attr_reader :tier

        attr_reader :availability_type

        attr_reader :backup_configuration

        attr_reader :settings_version

        attr_reader :user_labels

        attr_reader :activation_policy

        attr_reader :data_disk_size_gb

        attr_reader :data_disk_type

        attr_reader :pricing_plan

        attr_reader :replication_type

        attr_reader :storage_auto_resize

        attr_reader :storage_auto_resize_limit

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @kind = args["kind"]
          @database_flags = GoogleInSpec::SQL::Property::DatabaseInstanceSettingsDatabaseFlagsArray.parse(args["databaseFlags"], to_s)
          @ip_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceSettingsIpConfiguration.new(args["ipConfiguration"], to_s)
          @tier = args["tier"]
          @availability_type = args["availabilityType"]
          @backup_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceSettingsBackupConfiguration.new(args["backupConfiguration"], to_s)
          @settings_version = args["settingsVersion"]
          @user_labels = args["userLabels"]
          @activation_policy = args["activationPolicy"]
          @data_disk_size_gb = args["dataDiskSizeGb"]
          @data_disk_type = args["dataDiskType"]
          @pricing_plan = args["pricingPlan"]
          @replication_type = args["replicationType"]
          @storage_auto_resize = args["storageAutoResize"]
          @storage_auto_resize_limit = args["storageAutoResizeLimit"]
        end

        def to_s
          "#{@parent_identifier} DatabaseInstanceSettings"
        end
      end
    end
  end
end
