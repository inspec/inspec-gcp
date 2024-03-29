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
module GoogleInSpec
  module Compute
    module Property
      class RegionSecurityPolicyRulesPreconfiguredWafConfigExclusionsRequestQueryParamsToExclude
        attr_reader :val

        attr_reader :op

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @val = args['val']
          @op = args['op']
        end

        def to_s
          "#{@parent_identifier} RegionSecurityPolicyRulesPreconfiguredWafConfigExclusionsRequestQueryParamsToExclude"
        end
      end

      class RegionSecurityPolicyRulesPreconfiguredWafConfigExclusionsRequestQueryParamsToExcludeArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionSecurityPolicyRulesPreconfiguredWafConfigExclusionsRequestQueryParamsToExclude.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionSecurityPolicyRulesPreconfiguredWafConfigExclusionsRequestQueryParamsToExclude.new(v, parent_identifier) }
        end
      end
    end
  end
end
