

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
require "google/dlp/property/job_act_det_dt_det_de_stats"
require "google/dlp/property/job_act_det_dt_det_req_opt"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_dt"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_dt_config"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_image_tf"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_image_tf_all_info_types"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_image_tf_all_text"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_image_tf_redaction_color"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_image_tf_selected_info_types"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_info_type_tf"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_info_type_tf_tf"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf_field_tf"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_img_rt_dt_con_rec_tf_rec_sup"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_structured_dt"
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_structured_dt_deidentify_config"
module GoogleInSpec
  module DLP
    module Property
      class JobActDetDtDet
        attr_reader :de_stats

        attr_reader :req_opt

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @de_stats = GoogleInSpec::DLP::Property::JobActDetDtDetDeStats.new(args["deStats"], to_s)
          @req_opt = GoogleInSpec::DLP::Property::JobActDetDtDetReqOpt.new(args["req_Opt"], to_s)
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDet"
        end
      end
    end
  end
end
