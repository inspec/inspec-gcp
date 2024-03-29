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
      class InterconnectAttachmentPartnerMetadata
        attr_reader :partner_name

        attr_reader :interconnect_name

        attr_reader :portal_url

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @partner_name = args['partnerName']
          @interconnect_name = args['interconnectName']
          @portal_url = args['portalUrl']
        end

        def to_s
          "#{@parent_identifier} InterconnectAttachmentPartnerMetadata"
        end
      end
    end
  end
end
