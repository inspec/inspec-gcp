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
  module Run
    module Property
      class JobTemplateTemplateContainersLivenessProbeGrpc
        attr_reader :port

        attr_reader :service

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @port = args['port']
          @service = args['service']
        end

        def to_s
          "#{@parent_identifier} JobTemplateTemplateContainersLivenessProbeGrpc"
        end
      end
    end
  end
end
