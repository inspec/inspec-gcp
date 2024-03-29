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
module GoogleInSpec
  module Container
    module Property
      class ClusterPrivateClusterConfig
        attr_reader :enable_private_nodes

        attr_reader :enable_private_endpoint

        attr_reader :master_ipv4_cidr_block

        attr_reader :private_endpoint

        attr_reader :public_endpoint

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enable_private_nodes = args['enablePrivateNodes']
          @enable_private_endpoint = args['enablePrivateEndpoint']
          @master_ipv4_cidr_block = args['masterIpv4CidrBlock']
          @private_endpoint = args['privateEndpoint']
          @public_endpoint = args['publicEndpoint']
        end

        def to_s
          "#{@parent_identifier} ClusterPrivateClusterConfig"
        end
      end
    end
  end
end
