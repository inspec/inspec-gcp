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
require 'google/compute/property/regionurlmap_pmprrawbsharht_add'
module GoogleInSpec
  module Compute
    module Property
      class RegionUrlMapPathMatchersPathRulesRouteActionWeightedBackendServicesHeaderAction
        attr_reader :request_headers_to_remove

        attr_reader :request_headers_to_add

        attr_reader :response_headers_to_remove

        attr_reader :response_headers_to_add

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @request_headers_to_remove = args['requestHeadersToRemove']
          @request_headers_to_add = GoogleInSpec::Compute::Property::RegionUrlMapPathMatchersPathRulesRouteActionWeightedBackendServicesHeaderActionRequestHeadersToAddArray.parse(args['requestHeadersToAdd'], to_s)
          @response_headers_to_remove = args['responseHeadersToRemove']
          @response_headers_to_add = GoogleInSpec::Compute::Property::RegionUrlMapPathMatchersPathRulesRouteActionWeightedBackendServicesHeaderActionResponseHeadersToAddArray.parse(args['responseHeadersToAdd'], to_s)
        end

        def to_s
          "#{@parent_identifier} RegionUrlMapPathMatchersPathRulesRouteActionWeightedBackendServicesHeaderAction"
        end
      end
    end
  end
end