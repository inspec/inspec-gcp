

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
require "google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma"
require "google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma_noise_sigma"
module GoogleInSpec
  module VertexAI
    module Property
      class BatchPredictionJobExplanationSpecParametersIntegratedGradientsAttributionSmoothGradConfig
        attr_reader :feature_noise_sigma

        attr_reader :noise_sigma

        attr_reader :noisy_sample_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @feature_noise_sigma = GoogleInSpec::VertexAI::Property::BatchPredictionJobExplanationSpecParametersIntegratedGradientsAttributionSmoothGradConfigFeatureNoiseSigma.new(args["featureNoiseSigma"], to_s)
          @noise_sigma = args["noiseSigma"]
          @noisy_sample_count = args["noisySampleCount"]
        end

        def to_s
          "#{@parent_identifier} BatchPredictionJobExplanationSpecParametersIntegratedGradientsAttributionSmoothGradConfig"
        end
      end
    end
  end
end
