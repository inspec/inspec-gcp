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
      class RegionUrlMapHostRules
        attr_reader :description

        attr_reader :hosts

        attr_reader :path_matcher

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @description = args['description']
          @hosts = args['hosts']
          @path_matcher = args['pathMatcher']
        end

        def to_s
          "#{@parent_identifier} RegionUrlMapHostRules"
        end
      end

      class RegionUrlMapHostRulesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionUrlMapHostRules.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionUrlMapHostRules.new(v, parent_identifier) }
        end
      end
    end
  end
end