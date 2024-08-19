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
      class ServiceTemplateVolumesEmptyDir
        attr_reader :medium

        attr_reader :size_limit

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @medium = args['medium']
          @size_limit = args['sizeLimit']
        end

        def to_s
          "#{@parent_identifier} ServiceTemplateVolumesEmptyDir"
        end
      end
    end
  end
end
