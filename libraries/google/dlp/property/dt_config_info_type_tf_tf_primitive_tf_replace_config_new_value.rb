

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
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_replace_config_new_value_date_value"
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_replace_config_new_value_time_value"
module GoogleInSpec
  module DLP
    module Property
      class DTConfigInfoTypeTfTfPrimitiveTfReplaceConfigNewValue
        attr_reader :integer_value

        attr_reader :float_value

        attr_reader :string_value

        attr_reader :boolean_value

        attr_reader :timestamp_value

        attr_reader :time_value

        attr_reader :date_value

        attr_reader :day_of_week_value

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @integer_value = args["integerValue"]
          @float_value = args["floatValue"]
          @string_value = args["stringValue"]
          @boolean_value = args["booleanValue"]
          @timestamp_value = args["timestampValue"]
          @time_value = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfReplaceConfigNewValueTimeValue.new(args["timeValue"], to_s)
          @date_value = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfReplaceConfigNewValueDateValue.new(args["dateValue"], to_s)
          @day_of_week_value = args["dayOfWeekValue"]
        end

        def to_s
          "#{@parent_identifier} DTConfigInfoTypeTfTfPrimitiveTfReplaceConfigNewValue"
        end
      end
    end
  end
end
