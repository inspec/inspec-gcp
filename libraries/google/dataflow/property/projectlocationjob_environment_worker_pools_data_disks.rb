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
  module Dataflow
    module Property
      class ProjectLocationJobEnvironmentWorkerPoolsDataDisks
        attr_reader :size_gb

        attr_reader :disk_type

        attr_reader :mount_point

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @size_gb = args['sizeGb']
          @disk_type = args['diskType']
          @mount_point = args['mountPoint']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationJobEnvironmentWorkerPoolsDataDisks"
        end
      end

      class ProjectLocationJobEnvironmentWorkerPoolsDataDisksArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationJobEnvironmentWorkerPoolsDataDisks.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationJobEnvironmentWorkerPoolsDataDisks.new(v, parent_identifier) }
        end
      end
    end
  end
end
