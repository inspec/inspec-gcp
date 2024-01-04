

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
  module DLP
    module Property
      class JobActDetDtDetDeStats
        attr_reader :transformed_bytes

        attr_reader :transformation_count

        attr_reader :transformation_error_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @transformed_bytes = args["transformedBytes"]
          @transformation_count = args["transformationCount"]
          @transformation_error_count = args["transformationErrorCount"]
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetDeStats"
        end
      end
    end
  end
end
