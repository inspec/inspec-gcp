

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
      class BatchPredictionJobUnmanagedContainerModelPredictSchemata
        attr_reader :instance_schema_uri

        attr_reader :parameters_schema_uri

        attr_reader :prediction_schema_uri

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @instance_schema_uri = args["instanceSchemaUri"]
          @parameters_schema_uri = args["parametersSchemaUri"]
          @prediction_schema_uri = args["predictionSchemaUri"]
        end

        def to_s
          "#{@parent_identifier} BatchPredictionJobUnmanagedContainerModelPredictSchemata"
        end
      end
    end
  end
end
