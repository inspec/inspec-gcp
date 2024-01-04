

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
require "google/vertexai/property/trainingpipeline_input_data_config_bigquery_destination"
require "google/vertexai/property/trainingpipeline_input_data_config_filter_split"
require "google/vertexai/property/trainingpipeline_input_data_config_fraction_split"
require "google/vertexai/property/trainingpipeline_input_data_config_gcs_destination"
require "google/vertexai/property/trainingpipeline_input_data_config_predefined_split"
require "google/vertexai/property/trainingpipeline_input_data_config_stratified_split"
require "google/vertexai/property/trainingpipeline_input_data_config_timestamp_split"
module GoogleInSpec
  module VertexAI
    module Property
      class TrainingPipelineInputDataConfig
        attr_reader :fraction_split

        attr_reader :persist_ml_use_assignment

        attr_reader :saved_query_id

        attr_reader :annotations_filter

        attr_reader :gcs_destination

        attr_reader :bigquery_destination

        attr_reader :stratified_split

        attr_reader :annotation_schema_uri

        attr_reader :predefined_split

        attr_reader :filter_split

        attr_reader :timestamp_split

        attr_reader :dataset_id

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @fraction_split = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigFractionSplit.new(args["fractionSplit"], to_s)
          @persist_ml_use_assignment = args["persistMlUseAssignment"]
          @saved_query_id = args["savedQueryId"]
          @annotations_filter = args["annotationsFilter"]
          @gcs_destination = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigGcsDestination.new(args["gcsDestination"], to_s)
          @bigquery_destination = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigBigqueryDestination.new(args["bigqueryDestination"], to_s)
          @stratified_split = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigStratifiedSplit.new(args["stratifiedSplit"], to_s)
          @annotation_schema_uri = args["annotationSchemaUri"]
          @predefined_split = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigPredefinedSplit.new(args["predefinedSplit"], to_s)
          @filter_split = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigFilterSplit.new(args["filterSplit"], to_s)
          @timestamp_split = GoogleInSpec::VertexAI::Property::TrainingPipelineInputDataConfigTimestampSplit.new(args["timestampSplit"], to_s)
          @dataset_id = args["datasetId"]
        end

        def to_s
          "#{@parent_identifier} TrainingPipelineInputDataConfig"
        end
      end
    end
  end
end
