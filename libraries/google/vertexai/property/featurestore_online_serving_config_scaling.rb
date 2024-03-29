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
  module VertexAI
    module Property
      class FeaturestoreOnlineServingConfigScaling
        attr_reader :max_node_count

        attr_reader :min_node_count

        attr_reader :cpu_utilization_target

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @max_node_count = args['maxNodeCount']
          @min_node_count = args['minNodeCount']
          @cpu_utilization_target = args['cpuUtilizationTarget']
        end

        def to_s
          "#{@parent_identifier} FeaturestoreOnlineServingConfigScaling"
        end
      end
    end
  end
end
