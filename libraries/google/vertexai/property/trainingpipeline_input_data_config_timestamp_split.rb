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
      class TrainingPipelineInputDataConfigTimestampSplit
        attr_reader :test_fraction

        attr_reader :training_fraction

        attr_reader :validation_fraction

        attr_reader :key

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @test_fraction = args['testFraction']
          @training_fraction = args['trainingFraction']
          @validation_fraction = args['validationFraction']
          @key = args['key']
        end

        def to_s
          "#{@parent_identifier} TrainingPipelineInputDataConfigTimestampSplit"
        end
      end
    end
  end
end