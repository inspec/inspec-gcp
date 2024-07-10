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
  module DataprocMetastore
    module Property
      class ProjectLocationServiceMetadataManagementActivityRestores
        attr_reader :start_time

        attr_reader :end_time

        attr_reader :state

        attr_reader :backup

        attr_reader :type

        attr_reader :details

        attr_reader :backup_location

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @start_time = args['startTime']
          @end_time = args['endTime']
          @state = args['state']
          @backup = args['backup']
          @type = args['type']
          @details = args['details']
          @backup_location = args['backupLocation']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceMetadataManagementActivityRestores"
        end
      end

      class ProjectLocationServiceMetadataManagementActivityRestoresArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationServiceMetadataManagementActivityRestores.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationServiceMetadataManagementActivityRestores.new(v, parent_identifier) }
        end
      end
    end
  end
end
