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
require 'google/dlp/property/inspecttemplate_inspect_config_limits_max_findings_per_info_type_info_type'
module GoogleInSpec
  module DLP
    module Property
      class InspectTemplateInspectConfigLimitsMaxFindingsPerInfoType
        attr_reader :info_type

        attr_reader :max_findings

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @info_type = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigLimitsMaxFindingsPerInfoTypeInfoType.new(args['infoType'], to_s)
          @max_findings = args['maxFindings']
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigLimitsMaxFindingsPerInfoType"
        end
      end

      class InspectTemplateInspectConfigLimitsMaxFindingsPerInfoTypeArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InspectTemplateInspectConfigLimitsMaxFindingsPerInfoType.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InspectTemplateInspectConfigLimitsMaxFindingsPerInfoType.new(v, parent_identifier) }
        end
      end
    end
  end
end
