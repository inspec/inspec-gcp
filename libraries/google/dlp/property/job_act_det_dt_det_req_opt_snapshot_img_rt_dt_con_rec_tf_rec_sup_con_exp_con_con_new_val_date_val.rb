

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
      class JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupConExpConConNewValDateVal
        attr_reader :year

        attr_reader :month

        attr_reader :day

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @year = args["year"]
          @month = args["month"]
          @day = args["day"]
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupConExpConConNewValDateVal"
        end
      end
    end
  end
end
