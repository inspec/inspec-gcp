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
      class RegionSecurityPolicyRecaptchaOptionsConfig
        attr_reader :redirect_site_key

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @redirect_site_key = args['redirectSiteKey']
        end

        def to_s
          "#{@parent_identifier} RegionSecurityPolicyRecaptchaOptionsConfig"
        end
      end
    end
  end
end
