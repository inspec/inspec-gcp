

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
  module Compute
    module Property
      class InstanceTags
        attr_reader :arguments

        attr_reader :fingerprint

        attr_reader :items

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @fingerprint = arguments["fingerprint"]
          @items = arguments["items"]
        end

        def to_s
          "#{@parent_identifier} InstanceTags"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            "fingerprint" => ->(x, path) { x.nil? ? [] : ["its('#{path}.fingerprint') { should cmp #{x.inspect} }"] },
            "items" => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.items') { should include #{single.inspect} }" } },
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
    end
  end
end
