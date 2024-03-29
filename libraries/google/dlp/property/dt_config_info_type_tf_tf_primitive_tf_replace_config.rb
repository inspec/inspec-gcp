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
require 'google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_replace_config_new_value'
require 'google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_replace_config_new_value_date_value'
require 'google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_replace_config_new_value_time_value'
module GoogleInSpec
  module DLP
    module Property
      class DTConfigInfoTypeTfTfPrimitiveTfReplaceConfig
        attr_reader :new_value

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @new_value = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfReplaceConfigNewValue.new(args['newValue'], to_s)
        end

        def to_s
          "#{@parent_identifier} DTConfigInfoTypeTfTfPrimitiveTfReplaceConfig"
        end
      end
    end
  end
end
