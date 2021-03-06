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
require 'google/logging/property/metric_bucket_options_explicit_buckets'
require 'google/logging/property/metric_bucket_options_exponential_buckets'
require 'google/logging/property/metric_bucket_options_linear_buckets'
module GoogleInSpec
  module Logging
    module Property
      class MetricBucketOptions
        attr_reader :linear_buckets

        attr_reader :exponential_buckets

        attr_reader :explicit_buckets

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @linear_buckets = GoogleInSpec::Logging::Property::MetricBucketOptionsLinearBuckets.new(args['linearBuckets'], to_s)
          @exponential_buckets = GoogleInSpec::Logging::Property::MetricBucketOptionsExponentialBuckets.new(args['exponentialBuckets'], to_s)
          @explicit_buckets = GoogleInSpec::Logging::Property::MetricBucketOptionsExplicitBuckets.new(args['explicitBuckets'], to_s)
        end

        def to_s
          "#{@parent_identifier} MetricBucketOptions"
        end
      end
    end
  end
end
