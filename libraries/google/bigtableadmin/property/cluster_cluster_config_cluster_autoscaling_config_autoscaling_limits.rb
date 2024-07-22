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
  module Bigtableadmin
    module Property
      class ClusterClusterConfigClusterAutoscalingConfigAutoscalingLimits
        attr_reader :min_serve_nodes

        attr_reader :max_serve_nodes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @min_serve_nodes = args['minServeNodes']
          @max_serve_nodes = args['maxServeNodes']
        end

        def to_s
          "#{@parent_identifier} ClusterClusterConfigClusterAutoscalingConfigAutoscalingLimits"
        end
      end
    end
  end
end