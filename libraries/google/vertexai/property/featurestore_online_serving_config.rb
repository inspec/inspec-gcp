

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
require "google/vertexai/property/featurestore_online_serving_config_scaling"
module GoogleInSpec
  module VertexAI
    module Property
      class FeaturestoreOnlineServingConfig
        attr_reader :fixed_node_count

        attr_reader :scaling

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @fixed_node_count = args["fixedNodeCount"]
          @scaling = GoogleInSpec::VertexAI::Property::FeaturestoreOnlineServingConfigScaling.new(args["scaling"], to_s)
        end

        def to_s
          "#{@parent_identifier} FeaturestoreOnlineServingConfig"
        end
      end
    end
  end
end
