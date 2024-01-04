

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
require "google/bigquery/property/dataset_access_view"
module GoogleInSpec
  module BigQuery
    module Property
      class DatasetAccess
        attr_reader :arguments

        attr_reader :domain

        attr_reader :group_by_email

        attr_reader :role

        attr_reader :special_group

        attr_reader :user_by_email

        attr_reader :view

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @domain = arguments["domain"]
          @group_by_email = arguments["groupByEmail"]
          @role = arguments["role"]
          @special_group = arguments["specialGroup"]
          @user_by_email = arguments["userByEmail"]
          @view = GoogleInSpec::BigQuery::Property::DatasetAccessView.new(arguments["view"], to_s)
        end

        def to_s
          "#{@parent_identifier} DatasetAccess"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            "domain" => ->(x, path) { x.nil? ? [] : ["its('#{path}.domain') { should cmp #{x.inspect} }"] },
            "group_by_email" => ->(x, path) { x.nil? ? [] : ["its('#{path}.group_by_email') { should cmp #{x.inspect} }"] },
            "role" => ->(x, path) { x.nil? ? [] : ["its('#{path}.role') { should cmp #{x.inspect} }"] },
            "special_group" => ->(x, path) { x.nil? ? [] : ["its('#{path}.special_group') { should cmp #{x.inspect} }"] },
            "user_by_email" => ->(x, path) { x.nil? ? [] : ["its('#{path}.user_by_email') { should cmp #{x.inspect} }"] },
            "view" => ->(x, path) { x.nil? ? [] : GoogleInSpec::BigQuery::Property::DatasetAccessView.un_parse(x, "#{path}.view") },
          }
          way_to_parse.map do |k, v|
            v.call(item.method(k).call, current_path)
          end
        end

        def to_json(*_args)
          @arguments.to_json
        end

        # other is a string representation of this object
        def ==(other)
          @arguments == JSON.parse(other)
        end
      end

      class DatasetAccessArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return DatasetAccess.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| DatasetAccess.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?
          value.map { |v| DatasetAccess.un_parse(v, path) }
        end
      end
    end
  end
end
