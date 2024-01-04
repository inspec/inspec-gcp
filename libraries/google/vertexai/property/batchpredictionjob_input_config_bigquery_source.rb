

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
      class BatchPredictionJobInputConfigBigquerySource
        attr_reader :input_uri

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @input_uri = args["inputUri"]
        end

        def to_s
          "#{@parent_identifier} BatchPredictionJobInputConfigBigquerySource"
        end
      end
    end
  end
end
