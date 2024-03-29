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
require 'google/vertexai/property/endpoint_deployed_models_dedicated_resources_autoscaling_metric_specs'
require 'google/vertexai/property/endpoint_deployed_models_dedicated_resources_machine_spec'
module GoogleInSpec
  module VertexAI
    module Property
      class EndpointDeployedModelsDedicatedResources
        attr_reader :machine_spec

        attr_reader :max_replica_count

        attr_reader :autoscaling_metric_specs

        attr_reader :min_replica_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @machine_spec = GoogleInSpec::VertexAI::Property::EndpointDeployedModelsDedicatedResourcesMachineSpec.new(args['machineSpec'], to_s)
          @max_replica_count = args['maxReplicaCount']
          @autoscaling_metric_specs = GoogleInSpec::VertexAI::Property::EndpointDeployedModelsDedicatedResourcesAutoscalingMetricSpecsArray.parse(args['autoscalingMetricSpecs'], to_s)
          @min_replica_count = args['minReplicaCount']
        end

        def to_s
          "#{@parent_identifier} EndpointDeployedModelsDedicatedResources"
        end
      end
    end
  end
end
