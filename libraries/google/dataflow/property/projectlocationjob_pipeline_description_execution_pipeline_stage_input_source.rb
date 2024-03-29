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
      class ProjectLocationJobPipelineDescriptionExecutionPipelineStageInputSource
        attr_reader :user_name

        attr_reader :name

        attr_reader :original_transform_or_collection

        attr_reader :size_bytes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @user_name = args['userName']
          @name = args['name']
          @original_transform_or_collection = args['originalTransformOrCollection']
          @size_bytes = args['sizeBytes']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationJobPipelineDescriptionExecutionPipelineStageInputSource"
        end
      end

      class ProjectLocationJobPipelineDescriptionExecutionPipelineStageInputSourceArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationJobPipelineDescriptionExecutionPipelineStageInputSource.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationJobPipelineDescriptionExecutionPipelineStageInputSource.new(v, parent_identifier) }
        end
      end
    end
  end
end
