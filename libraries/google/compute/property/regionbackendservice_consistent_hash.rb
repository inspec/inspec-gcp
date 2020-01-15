# frozen_string_literal: false

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
require 'google/compute/property/regionbackendservice_consistent_hash_http_cookie'
require 'google/compute/property/regionbackendservice_consistent_hash_http_cookie_ttl'
module GoogleInSpec
  module Compute
    module Property
      class RegionBackendServiceConsistentHash
        attr_reader :http_cookie

        attr_reader :http_header_name

        attr_reader :minimum_ring_size

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @http_cookie = GoogleInSpec::Compute::Property::RegionBackendServiceConsistentHashHttpCookie.new(args['httpCookie'], to_s)
          @http_header_name = args['httpHeaderName']
          @minimum_ring_size = args['minimumRingSize']
        end

        def to_s
          "#{@parent_identifier} RegionBackendServiceConsistentHash"
        end
      end
    end
  end
end
