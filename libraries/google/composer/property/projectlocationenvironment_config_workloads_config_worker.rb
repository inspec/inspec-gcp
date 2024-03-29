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
      class ProjectLocationEnvironmentConfigWorkloadsConfigWorker
        attr_reader :cpu

        attr_reader :memory_gb

        attr_reader :storage_gb

        attr_reader :min_count

        attr_reader :max_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @cpu = args['cpu']
          @memory_gb = args['memoryGb']
          @storage_gb = args['storageGb']
          @min_count = args['minCount']
          @max_count = args['maxCount']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationEnvironmentConfigWorkloadsConfigWorker"
        end
      end
    end
  end
end
