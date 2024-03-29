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
      class ServiceAttachmentConsumerAcceptLists
        attr_reader :project_id_or_num

        attr_reader :network_url

        attr_reader :connection_limit

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @project_id_or_num = args['projectIdOrNum']
          @network_url = args['networkUrl']
          @connection_limit = args['connectionLimit']
        end

        def to_s
          "#{@parent_identifier} ServiceAttachmentConsumerAcceptLists"
        end
      end

      class ServiceAttachmentConsumerAcceptListsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServiceAttachmentConsumerAcceptLists.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServiceAttachmentConsumerAcceptLists.new(v, parent_identifier) }
        end
      end
    end
  end
end
