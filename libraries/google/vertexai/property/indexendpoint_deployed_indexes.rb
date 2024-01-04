

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
require "google/vertexai/property/indexendpoint_deployed_indexes_automatic_resources"
require "google/vertexai/property/indexendpoint_deployed_indexes_dedicated_resources"
require "google/vertexai/property/indexendpoint_deployed_indexes_dedicated_resources_autoscaling_metric_specs"
require "google/vertexai/property/indexendpoint_deployed_indexes_dedicated_resources_machine_spec"
require "google/vertexai/property/indexendpoint_deployed_indexes_deployed_index_auth_config"
require "google/vertexai/property/indexendpoint_deployed_indexes_deployed_index_auth_config_auth_provider"
require "google/vertexai/property/indexendpoint_deployed_indexes_private_endpoints"
module GoogleInSpec
  module VertexAI
    module Property
      class IndexEndpointDeployedIndexes
        attr_reader :private_endpoints

        attr_reader :deployment_group

        attr_reader :dedicated_resources

        attr_reader :deployed_index_auth_config

        attr_reader :id

        attr_reader :index_sync_time

        attr_reader :automatic_resources

        attr_reader :enable_access_logging

        attr_reader :create_time

        attr_reader :reserved_ip_ranges

        attr_reader :index

        attr_reader :display_name

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @private_endpoints = GoogleInSpec::VertexAI::Property::IndexEndpointDeployedIndexesPrivateEndpoints.new(args["privateEndpoints"], to_s)
          @deployment_group = args["deploymentGroup"]
          @dedicated_resources = GoogleInSpec::VertexAI::Property::IndexEndpointDeployedIndexesDedicatedResources.new(args["dedicatedResources"], to_s)
          @deployed_index_auth_config = GoogleInSpec::VertexAI::Property::IndexEndpointDeployedIndexesDeployedIndexAuthConfig.new(args["deployedIndexAuthConfig"], to_s)
          @id = args["id"]
          @index_sync_time = args["indexSyncTime"]
          @automatic_resources = GoogleInSpec::VertexAI::Property::IndexEndpointDeployedIndexesAutomaticResources.new(args["automaticResources"], to_s)
          @enable_access_logging = args["enableAccessLogging"]
          @create_time = args["createTime"]
          @reserved_ip_ranges = args["reservedIpRanges"]
          @index = args["index"]
          @display_name = args["displayName"]
        end

        def to_s
          "#{@parent_identifier} IndexEndpointDeployedIndexes"
        end
      end

      class IndexEndpointDeployedIndexesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return IndexEndpointDeployedIndexes.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| IndexEndpointDeployedIndexes.new(v, parent_identifier) }
        end
      end
    end
  end
end
