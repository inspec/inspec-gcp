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
require 'google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_bigquery_source'
require 'google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_gcs_source'
require 'google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_logging_sampling_strategy'
require 'google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_logging_sampling_strategy_random_sample_config'
module GoogleInSpec
  module VertexAI
    module Property
      class ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigTrainingDataset
        attr_reader :logging_sampling_strategy

        attr_reader :dataset

        attr_reader :gcs_source

        attr_reader :target_field

        attr_reader :bigquery_source

        attr_reader :data_format

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @logging_sampling_strategy = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigTrainingDatasetLoggingSamplingStrategy.new(args['loggingSamplingStrategy'], to_s)
          @dataset = args['dataset']
          @gcs_source = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigTrainingDatasetGcsSource.new(args['gcsSource'], to_s)
          @target_field = args['targetField']
          @bigquery_source = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigTrainingDatasetBigquerySource.new(args['bigquerySource'], to_s)
          @data_format = args['dataFormat']
        end

        def to_s
          "#{@parent_identifier} ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigTrainingDataset"
        end
      end
    end
  end
end