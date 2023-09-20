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
  module VertexAI
    module Property
      class TrainingPipelineModelToUploadModelSourceInfo
        attr_reader :copy

        attr_reader :source_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @copy = args['copy']
          @source_type = args['sourceType']
        end

        def to_s
          "#{@parent_identifier} TrainingPipelineModelToUploadModelSourceInfo"
        end
      end
    end
  end
end
