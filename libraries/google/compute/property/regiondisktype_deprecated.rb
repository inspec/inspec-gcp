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
      class RegionDiskTypeDeprecated
        attr_reader :deleted

        attr_reader :deprecated

        attr_reader :obsolete

        attr_reader :replacement

        attr_reader :state

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @deleted = parse_time_string(args['deleted'])
          @deprecated = parse_time_string(args['deprecated'])
          @obsolete = parse_time_string(args['obsolete'])
          @replacement = args['replacement']
          @state = args['state']
        end

        def to_s
          "#{@parent_identifier} RegionDiskTypeDeprecated"
        end

        # Handles parsing RFC3339 time string
        def parse_time_string(time_string)
          time_string ? Time.parse(time_string) : nil
        end
      end
    end
  end
end
