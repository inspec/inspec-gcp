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
require 'google/datalossprevention/property/deidentifytemplate_deidentify_config_info_type_transformations_transformations_primitive_transformation_replace_config_new_value'
require 'google/datalossprevention/property/deidentifytemplate_deidentify_config_info_type_transformations_transformations_primitive_transformation_replace_config_new_value_date_value'
require 'google/datalossprevention/property/deidentifytemplate_deidentify_config_info_type_transformations_transformations_primitive_transformation_replace_config_new_value_time_value'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class DeidentifyTemplateDeidentifyConfigInfoTypeTransformationsTransformationsPrimitiveTransformationReplaceConfig
        attr_reader :new_value

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @new_value = GoogleInSpec::DataLossPrevention::Property::DeidentifyTemplateDeidentifyConfigInfoTypeTransformationsTransformationsPrimitiveTransformationReplaceConfigNewValue.new(args['newValue'], to_s)
        end

        def to_s
          "#{@parent_identifier} DeidentifyTemplateDeidentifyConfigInfoTypeTransformationsTransformationsPrimitiveTransformationReplaceConfig"
        end
      end
    end
  end
end