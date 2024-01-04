

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
  module BigQuery
    module Property
      class TableViewUserDefinedFunctionResources
        attr_reader :inline_code

        attr_reader :resource_uri

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @inline_code = args["inlineCode"]
          @resource_uri = args["resourceUri"]
        end

        def to_s
          "#{@parent_identifier} TableViewUserDefinedFunctionResources"
        end
      end

      class TableViewUserDefinedFunctionResourcesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return TableViewUserDefinedFunctionResources.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| TableViewUserDefinedFunctionResources.new(v, parent_identifier) }
        end
      end
    end
  end
end
