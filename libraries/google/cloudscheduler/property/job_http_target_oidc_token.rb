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
  module CloudScheduler
    module Property
      class JobHttpTargetOidcToken
        attr_reader :service_account_email

        attr_reader :audience

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @service_account_email = args['serviceAccountEmail']
          @audience = args['audience']
        end

        def to_s
          "#{@parent_identifier} JobHttpTargetOidcToken"
        end
      end
    end
  end
end
