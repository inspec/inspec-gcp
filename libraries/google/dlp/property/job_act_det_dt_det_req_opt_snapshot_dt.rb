

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
require "google/dlp/property/job_act_det_dt_det_req_opt_snapshot_dt_config"
module GoogleInSpec
  module DLP
    module Property
      class JobActDetDtDetReqOptSnapshotDt
        attr_reader :name

        attr_reader :display_name

        attr_reader :description

        attr_reader :create_time

        attr_reader :update_time

        attr_reader :config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args["name"]
          @display_name = args["displayName"]
          @description = args["description"]
          @create_time = args["createTime"]
          @update_time = args["updateTime"]
          @config = GoogleInSpec::DLP::Property::JobActDetDtDetReqOptSnapshotDtConfig.new(args["config"], to_s)
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetReqOptSnapshotDt"
        end
      end
    end
  end
end
