

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
require "google/composer/property/projectlocationenvironment_config_private_environment_config_networking_config"
require "google/composer/property/projectlocationenvironment_config_private_environment_config_private_cluster_config"
module GoogleInSpec
  module Composer
    module Property
      class ProjectLocationEnvironmentConfigPrivateEnvironmentConfig
        attr_reader :enable_private_environment

        attr_reader :private_cluster_config

        attr_reader :web_server_ipv4_cidr_block

        attr_reader :cloud_sql_ipv4_cidr_block

        attr_reader :web_server_ipv4_reserved_range

        attr_reader :cloud_composer_network_ipv4_cidr_block

        attr_reader :cloud_composer_network_ipv4_reserved_range

        attr_reader :enable_privately_used_public_ips

        attr_reader :cloud_composer_connection_subnetwork

        attr_reader :networking_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enable_private_environment = args["enablePrivateEnvironment"]
          @private_cluster_config = GoogleInSpec::Composer::Property::ProjectLocationEnvironmentConfigPrivateEnvironmentConfigPrivateClusterConfig.new(args["privateClusterConfig"], to_s)
          @web_server_ipv4_cidr_block = args["webServerIpv4CidrBlock"]
          @cloud_sql_ipv4_cidr_block = args["cloudSqlIpv4CidrBlock"]
          @web_server_ipv4_reserved_range = args["webServerIpv4ReservedRange"]
          @cloud_composer_network_ipv4_cidr_block = args["cloudComposerNetworkIpv4CidrBlock"]
          @cloud_composer_network_ipv4_reserved_range = args["cloudComposerNetworkIpv4ReservedRange"]
          @enable_privately_used_public_ips = args["enablePrivatelyUsedPublicIps"]
          @cloud_composer_connection_subnetwork = args["cloudComposerConnectionSubnetwork"]
          @networking_config = GoogleInSpec::Composer::Property::ProjectLocationEnvironmentConfigPrivateEnvironmentConfigNetworkingConfig.new(args["networkingConfig"], to_s)
        end

        def to_s
          "#{@parent_identifier} ProjectLocationEnvironmentConfigPrivateEnvironmentConfig"
        end
      end
    end
  end
end
