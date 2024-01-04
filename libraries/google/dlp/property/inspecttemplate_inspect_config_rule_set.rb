

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
require "google/dlp/property/inspecttemplate_inspect_config_rule_set_info_types"
require "google/dlp/property/inspecttemplate_inspect_config_rule_set_rules"
module GoogleInSpec
  module DLP
    module Property
      class InspectTemplateInspectConfigRuleSet
        attr_reader :info_types

        attr_reader :rules

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @info_types = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigRuleSetInfoTypesArray.parse(args["infoTypes"], to_s)
          @rules = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigRuleSetRulesArray.parse(args["rules"], to_s)
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigRuleSet"
        end
      end

      class InspectTemplateInspectConfigRuleSetArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InspectTemplateInspectConfigRuleSet.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InspectTemplateInspectConfigRuleSet.new(v, parent_identifier) }
        end
      end
    end
  end
end
