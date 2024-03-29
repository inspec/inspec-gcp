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
      class ClusterIpAllocationPolicy
        attr_reader :use_ip_aliases

        attr_reader :create_subnetwork

        attr_reader :subnetwork_name

        attr_reader :cluster_secondary_range_name

        attr_reader :services_secondary_range_name

        attr_reader :cluster_ipv4_cidr_block

        attr_reader :node_ipv4_cidr_block

        attr_reader :services_ipv4_cidr_block

        attr_reader :tpu_ipv4_cidr_block

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @use_ip_aliases = args['useIpAliases']
          @create_subnetwork = args['createSubnetwork']
          @subnetwork_name = args['subnetworkName']
          @cluster_secondary_range_name = args['clusterSecondaryRangeName']
          @services_secondary_range_name = args['servicesSecondaryRangeName']
          @cluster_ipv4_cidr_block = args['clusterIpv4CidrBlock']
          @node_ipv4_cidr_block = args['nodeIpv4CidrBlock']
          @services_ipv4_cidr_block = args['servicesIpv4CidrBlock']
          @tpu_ipv4_cidr_block = args['tpuIpv4CidrBlock']
        end

        def to_s
          "#{@parent_identifier} ClusterIpAllocationPolicy"
        end
      end
    end
  end
end
