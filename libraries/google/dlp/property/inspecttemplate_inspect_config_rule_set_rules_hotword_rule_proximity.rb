

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
      class InspectTemplateInspectConfigRuleSetRulesHotwordRuleProximity
        attr_reader :window_before

        attr_reader :window_after

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @window_before = args["windowBefore"]
          @window_after = args["windowAfter"]
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigRuleSetRulesHotwordRuleProximity"
        end
      end
    end
  end
end
