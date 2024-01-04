

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
module GoogleInSpec
  module Compute
    module Property
      class RegionBackendServiceConnectionDraining
        attr_reader :draining_timeout_sec

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @draining_timeout_sec = args["drainingTimeoutSec"]
        end

        def to_s
          "#{@parent_identifier} RegionBackendServiceConnectionDraining"
        end
      end
    end
  end
end
