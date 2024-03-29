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
require 'google/vertexai/property/modelsevaluation_esespigabb_config'
require 'google/vertexai/property/modelsevaluation_esespigasg_config'
require 'google/vertexai/property/modelsevaluation_esespigasgcfn_sigma'
require 'google/vertexai/property/modelsevaluation_esespigasgcfnsn_sigma'
module GoogleInSpec
  module VertexAI
    module Property
      class ModelsEvaluationExplanationSpecsExplanationSpecParametersIntegratedGradientsAttribution
        attr_reader :step_count

        attr_reader :smooth_grad_config

        attr_reader :blur_baseline_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @step_count = args['stepCount']
          @smooth_grad_config = GoogleInSpec::VertexAI::Property::ModelsEvaluationExplanationSpecsExplanationSpecParametersIntegratedGradientsAttributionSmoothGradConfig.new(args['smoothGradConfig'], to_s)
          @blur_baseline_config = GoogleInSpec::VertexAI::Property::ModelsEvaluationExplanationSpecsExplanationSpecParametersIntegratedGradientsAttributionBlurBaselineConfig.new(args['blurBaselineConfig'], to_s)
        end

        def to_s
          "#{@parent_identifier} ModelsEvaluationExplanationSpecsExplanationSpecParametersIntegratedGradientsAttribution"
        end
      end
    end
  end
end
