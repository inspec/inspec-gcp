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
require 'google/vertexai/property/trainingpipeline_model_to_upload_explanation_spec_parameters_integrated_gradients_attribution_blur_baseline_config'
require 'google/vertexai/property/trainingpipeline_model_to_upload_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config'
require 'google/vertexai/property/trainingpipeline_model_to_upload_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma'
require 'google/vertexai/property/trainingpipeline_model_to_upload_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma_noise_sigma'
module GoogleInSpec
  module VertexAI
    module Property
      class TrainingPipelineModelToUploadExplanationSpecParametersIntegratedGradientsAttribution
        attr_reader :step_count

        attr_reader :smooth_grad_config

        attr_reader :blur_baseline_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @step_count = args['stepCount']
          @smooth_grad_config = GoogleInSpec::VertexAI::Property::TrainingPipelineModelToUploadExplanationSpecParametersIntegratedGradientsAttributionSmoothGradConfig.new(args['smoothGradConfig'], to_s)
          @blur_baseline_config = GoogleInSpec::VertexAI::Property::TrainingPipelineModelToUploadExplanationSpecParametersIntegratedGradientsAttributionBlurBaselineConfig.new(args['blurBaselineConfig'], to_s)
        end

        def to_s
          "#{@parent_identifier} TrainingPipelineModelToUploadExplanationSpecParametersIntegratedGradientsAttribution"
        end
      end
    end
  end
end
