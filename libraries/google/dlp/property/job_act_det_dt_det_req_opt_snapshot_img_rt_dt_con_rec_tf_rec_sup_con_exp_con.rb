

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
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf_rec_sup_con_exp_con_con"
module GoogleInSpec
  module DLP
    module Property
      class JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupConExpCon
        attr_reader :con

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @con = GoogleInSpec::DLP::Property::JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupConExpConConArray.parse(args["con"], to_s)
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupConExpCon"
        end
      end
    end
  end
end
