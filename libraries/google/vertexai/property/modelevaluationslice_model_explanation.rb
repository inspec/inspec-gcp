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
require 'google/vertexai/property/modelevaluationslice_model_explanation_mean_attributions'
module GoogleInSpec
  module VertexAI
    module Property
      class ModelEvaluationSliceModelExplanation
        attr_reader :mean_attributions

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @mean_attributions = GoogleInSpec::VertexAI::Property::ModelEvaluationSliceModelExplanationMeanAttributionsArray.parse(args['meanAttributions'], to_s)
        end

        def to_s
          "#{@parent_identifier} ModelEvaluationSliceModelExplanation"
        end
      end
    end
  end
end
