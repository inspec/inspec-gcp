

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
require "google/compute/property/regionbackendservice_cdn_policy_cache_key_policy"
require "google/compute/property/regionbackendservice_cdn_policy_negative_caching_policy"
module GoogleInSpec
  module Compute
    module Property
      class RegionBackendServiceCdnPolicy
        attr_reader :cache_key_policy

        attr_reader :signed_url_cache_max_age_sec

        attr_reader :default_ttl

        attr_reader :max_ttl

        attr_reader :client_ttl

        attr_reader :negative_caching

        attr_reader :negative_caching_policy

        attr_reader :cache_mode

        attr_reader :serve_while_stale

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @cache_key_policy = GoogleInSpec::Compute::Property::RegionBackendServiceCdnPolicyCacheKeyPolicy.new(args["cacheKeyPolicy"], to_s)
          @signed_url_cache_max_age_sec = args["signedUrlCacheMaxAgeSec"]
          @default_ttl = args["defaultTtl"]
          @max_ttl = args["maxTtl"]
          @client_ttl = args["clientTtl"]
          @negative_caching = args["negativeCaching"]
          @negative_caching_policy = GoogleInSpec::Compute::Property::RegionBackendServiceCdnPolicyNegativeCachingPolicyArray.parse(args["negativeCachingPolicy"], to_s)
          @cache_mode = args["cacheMode"]
          @serve_while_stale = args["serveWhileStale"]
        end

        def to_s
          "#{@parent_identifier} RegionBackendServiceCdnPolicy"
        end
      end
    end
  end
end
