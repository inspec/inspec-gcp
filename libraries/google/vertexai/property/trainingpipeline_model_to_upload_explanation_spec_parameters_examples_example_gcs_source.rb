

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
require "google/vertexai/property/trainingpipeline_model_to_upload_explanation_spec_parameters_examples_example_gcs_source_gcs_source"
module GoogleInSpec
  module VertexAI
    module Property
      class TrainingPipelineModelToUploadExplanationSpecParametersExamplesExampleGcsSource
        attr_reader :gcs_source

        attr_reader :data_format

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @gcs_source = GoogleInSpec::VertexAI::Property::TrainingPipelineModelToUploadExplanationSpecParametersExamplesExampleGcsSourceGcsSource.new(args["gcsSource"], to_s)
          @data_format = args["dataFormat"]
        end

        def to_s
          "#{@parent_identifier} TrainingPipelineModelToUploadExplanationSpecParametersExamplesExampleGcsSource"
        end
      end
    end
  end
end
