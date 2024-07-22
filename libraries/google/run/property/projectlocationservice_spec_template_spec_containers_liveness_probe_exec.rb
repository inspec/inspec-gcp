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
      class ProjectLocationServiceSpecTemplateSpecContainersLivenessProbeExec
        attr_reader :command

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @command = args['command']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceSpecTemplateSpecContainersLivenessProbeExec"
        end
      end
    end
  end
end
