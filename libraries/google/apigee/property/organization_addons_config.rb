

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
require "google/apigee/property/organization_addons_config_advanced_api_ops_config"
require "google/apigee/property/organization_addons_config_analytics_config"
require "google/apigee/property/organization_addons_config_api_security_config"
require "google/apigee/property/organization_addons_config_connectors_platform_config"
require "google/apigee/property/organization_addons_config_integration_config"
require "google/apigee/property/organization_addons_config_monetization_config"
module GoogleInSpec
  module Apigee
    module Property
      class OrganizationAddonsConfig
        attr_reader :integration_config

        attr_reader :api_security_config

        attr_reader :monetization_config

        attr_reader :connectors_platform_config

        attr_reader :analytics_config

        attr_reader :advanced_api_ops_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @integration_config = GoogleInSpec::Apigee::Property::OrganizationAddonsConfigIntegrationConfig.new(args["integrationConfig"], to_s)
          @api_security_config = GoogleInSpec::Apigee::Property::OrganizationAddonsConfigApiSecurityConfig.new(args["apiSecurityConfig"], to_s)
          @monetization_config = GoogleInSpec::Apigee::Property::OrganizationAddonsConfigMonetizationConfig.new(args["monetizationConfig"], to_s)
          @connectors_platform_config = GoogleInSpec::Apigee::Property::OrganizationAddonsConfigConnectorsPlatformConfig.new(args["connectorsPlatformConfig"], to_s)
          @analytics_config = GoogleInSpec::Apigee::Property::OrganizationAddonsConfigAnalyticsConfig.new(args["analyticsConfig"], to_s)
          @advanced_api_ops_config = GoogleInSpec::Apigee::Property::OrganizationAddonsConfigAdvancedApiOpsConfig.new(args["advancedApiOpsConfig"], to_s)
        end

        def to_s
          "#{@parent_identifier} OrganizationAddonsConfig"
        end
      end
    end
  end
end
