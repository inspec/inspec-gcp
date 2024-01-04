

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
require "google/pubsub/property/subscription_push_config_oidc_token"
module GoogleInSpec
  module Pubsub
    module Property
      class SubscriptionPushConfig
        attr_reader :oidc_token

        attr_reader :push_endpoint

        attr_reader :attributes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @oidc_token = GoogleInSpec::Pubsub::Property::SubscriptionPushConfigOidcToken.new(args["oidcToken"], to_s)
          @push_endpoint = args["pushEndpoint"]
          @attributes = args["attributes"]
        end

        def to_s
          "#{@parent_identifier} SubscriptionPushConfig"
        end
      end
    end
  end
end
