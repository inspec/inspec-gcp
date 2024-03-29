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
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_dictionary'
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_dictionary_cloud_storage_path'
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_dictionary_word_list'
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_exclude_info_types'
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_exclude_info_types_info_types'
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_regex'
module GoogleInSpec
  module DLP
    module Property
      class InspectTemplateInspectConfigRuleSetRulesExclusionRule
        attr_reader :matching_type

        attr_reader :dictionary

        attr_reader :regex

        attr_reader :exclude_info_types

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @matching_type = args['matchingType']
          @dictionary = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigRuleSetRulesExclusionRuleDictionary.new(args['dictionary'], to_s)
          @regex = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigRuleSetRulesExclusionRuleRegex.new(args['regex'], to_s)
          @exclude_info_types = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigRuleSetRulesExclusionRuleExcludeInfoTypes.new(args['excludeInfoTypes'], to_s)
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigRuleSetRulesExclusionRule"
        end
      end
    end
  end
end
