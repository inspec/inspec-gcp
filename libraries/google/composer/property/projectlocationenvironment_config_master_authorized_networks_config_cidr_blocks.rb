

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
module GoogleInSpec
  module Composer
    module Property
      class ProjectLocationEnvironmentConfigMasterAuthorizedNetworksConfigCidrBlocks
        attr_reader :display_name

        attr_reader :cidr_block

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @display_name = args["displayName"]
          @cidr_block = args["cidrBlock"]
        end

        def to_s
          "#{@parent_identifier} ProjectLocationEnvironmentConfigMasterAuthorizedNetworksConfigCidrBlocks"
        end
      end

      class ProjectLocationEnvironmentConfigMasterAuthorizedNetworksConfigCidrBlocksArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationEnvironmentConfigMasterAuthorizedNetworksConfigCidrBlocks.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationEnvironmentConfigMasterAuthorizedNetworksConfigCidrBlocks.new(v, parent_identifier) }
        end
      end
    end
  end
end
