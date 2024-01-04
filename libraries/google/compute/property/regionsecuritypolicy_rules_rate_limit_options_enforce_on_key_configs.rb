

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
      class RegionSecurityPolicyRulesRateLimitOptionsEnforceOnKeyConfigs
        attr_reader :enforce_on_key_type

        attr_reader :enforce_on_key_name

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enforce_on_key_type = args["enforceOnKeyType"]
          @enforce_on_key_name = args["enforceOnKeyName"]
        end

        def to_s
          "#{@parent_identifier} RegionSecurityPolicyRulesRateLimitOptionsEnforceOnKeyConfigs"
        end
      end

      class RegionSecurityPolicyRulesRateLimitOptionsEnforceOnKeyConfigsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionSecurityPolicyRulesRateLimitOptionsEnforceOnKeyConfigs.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionSecurityPolicyRulesRateLimitOptionsEnforceOnKeyConfigs.new(v, parent_identifier) }
        end
      end
    end
  end
end
