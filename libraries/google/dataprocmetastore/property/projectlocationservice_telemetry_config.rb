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
  module DataprocMetastore
    module Property
      class ProjectLocationServiceTelemetryConfig
        attr_reader :log_format

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @log_format = args['logFormat']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceTelemetryConfig"
        end
      end
    end
  end
end
