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
module GoogleInSpec
  module Compute
    module Property
      class UrlMapHostRules
        attr_reader :description

        attr_reader :hosts

        attr_reader :path_matcher

        def initialize(args = nil)
          return if args.nil?
          @description = args['description']
          @hosts = args['hosts']
          @path_matcher = args['pathMatcher']
        end
      end

      class UrlMapHostRulesArray
        def self.parse(value)
          return if value.nil?
          return UrlMapHostRules.new(value) unless value.is_a?(::Array)
          value.map { |v| UrlMapHostRules.new(v) }
        end
      end
    end
  end
end
