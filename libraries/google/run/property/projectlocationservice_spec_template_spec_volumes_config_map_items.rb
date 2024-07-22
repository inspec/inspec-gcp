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
      class ProjectLocationServiceSpecTemplateSpecVolumesConfigMapItems
        attr_reader :key

        attr_reader :path

        attr_reader :mode

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @key = args['key']
          @path = args['path']
          @mode = args['mode']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceSpecTemplateSpecVolumesConfigMapItems"
        end
      end

      class ProjectLocationServiceSpecTemplateSpecVolumesConfigMapItemsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationServiceSpecTemplateSpecVolumesConfigMapItems.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationServiceSpecTemplateSpecVolumesConfigMapItems.new(v, parent_identifier) }
        end
      end
    end
  end
end
