

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
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf_rec_sup_con_exp"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf_rec_sup_con_exp_con"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf_rec_sup_con_exp_con_con"
module GoogleInSpec
  module DLP
    module Property
      class JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupCon
        attr_reader :exp

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @exp = GoogleInSpec::DLP::Property::JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupConExp.new(args["exp"], to_s)
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetReqOptSnapshotImgRtDtConRecTfRecSupCon"
        end
      end
    end
  end
end
