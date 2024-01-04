

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
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_explanation_config"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_explanation_config_explanation_baseline"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_explanation_config_explanation_baseline_bigquery"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_explanation_config_explanation_baseline_gcs"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_prediction_drift_detection_config"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_prediction_drift_detection_config_attribution_score_drift_thresholds"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_prediction_drift_detection_config_default_drift_threshold"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_prediction_drift_detection_config_drift_thresholds"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_bigquery_source"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_gcs_source"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_logging_sampling_strategy"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_dataset_logging_sampling_strategy_random_sample_config"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_prediction_skew_detection_config"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_prediction_skew_detection_config_attribution_score_skew_thresholds"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_prediction_skew_detection_config_default_skew_threshold"
require "google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config_training_prediction_skew_detection_config_skew_thresholds"
module GoogleInSpec
  module VertexAI
    module Property
      class ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigs
        attr_reader :objective_config

        attr_reader :deployed_model_id

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @objective_config = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfig.new(args["objectiveConfig"], to_s)
          @deployed_model_id = args["deployedModelId"]
        end

        def to_s
          "#{@parent_identifier} ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigs"
        end
      end

      class ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigs.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigs.new(v, parent_identifier) }
        end
      end
    end
  end
end
