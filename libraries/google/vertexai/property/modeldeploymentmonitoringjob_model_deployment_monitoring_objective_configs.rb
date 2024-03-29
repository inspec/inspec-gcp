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
require 'google/vertexai/property/modeldeploymentmonitoringjob_model_deployment_monitoring_objective_configs_objective_config'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococe_config'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococece_baseline'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococeceb_bigquery'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococeceb_gcs'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpdd_config'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpddcasd_thresholds'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpddcdd_threshold'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpddcd_thresholds'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococt_dataset'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtdb_source'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtdg_source'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtdls_strategy'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtdlssrs_config'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtpsd_config'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtpsdcass_thresholds'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtpsdcds_threshold'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococtpsdcs_thresholds'
module GoogleInSpec
  module VertexAI
    module Property
      class ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigs
        attr_reader :objective_config

        attr_reader :deployed_model_id

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @objective_config = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfig.new(args['objectiveConfig'], to_s)
          @deployed_model_id = args['deployedModelId']
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
