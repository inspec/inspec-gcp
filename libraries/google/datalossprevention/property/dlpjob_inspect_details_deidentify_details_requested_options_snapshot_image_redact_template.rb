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
require 'google/datalossprevention/property/dlpjob_inspect_details_deidentify_details_requested_options_snapshot_image_redact_template_deidentify_config'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class DlpJobInspectDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplate
        attr_reader :name

        attr_reader :display_name

        attr_reader :description

        attr_reader :create_time

        attr_reader :update_time

        attr_reader :deidentify_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
          @display_name = args['displayName']
          @description = args['description']
          @create_time = args['createTime']
          @update_time = args['updateTime']
          @deidentify_config = GoogleInSpec::DataLossPrevention::Property::DlpJobInspectDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplateDeidentifyConfig.new(args['deidentifyConfig'], to_s)
        end

        def to_s
          "#{@parent_identifier} DlpJobInspectDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplate"
        end
      end
    end
  end
end