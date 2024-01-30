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
      class PublicAdvertisedPrefixPublicDelegatedPrefixs
        attr_reader :name

        attr_reader :region

        attr_reader :project

        attr_reader :status

        attr_reader :ip_range

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
          @region = args['region']
          @project = args['project']
          @status = args['status']
          @ip_range = args['ipRange']
        end

        def to_s
          "#{@parent_identifier} PublicAdvertisedPrefixPublicDelegatedPrefixs"
        end
      end

      class PublicAdvertisedPrefixPublicDelegatedPrefixsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return PublicAdvertisedPrefixPublicDelegatedPrefixs.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| PublicAdvertisedPrefixPublicDelegatedPrefixs.new(v, parent_identifier) }
        end
      end
    end
  end
end
