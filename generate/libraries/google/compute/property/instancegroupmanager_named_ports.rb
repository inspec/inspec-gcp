

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
      class InstanceGroupManagerNamedPorts
        attr_reader :arguments

        attr_reader :name

        attr_reader :port

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @name = arguments["name"]
          @port = arguments["port"]
        end

        def to_s
          "#{@parent_identifier} InstanceGroupManagerNamedPorts"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            "name" => ->(x, path) { x.nil? ? [] : ["its('#{path}.name') { should cmp #{x.inspect} }"] },
            "port" => ->(x, path) { x.nil? ? [] : ["its('#{path}.port') { should cmp #{x.inspect} }"] },
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

      class InstanceGroupManagerNamedPortsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InstanceGroupManagerNamedPorts.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InstanceGroupManagerNamedPorts.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?
          value.map { |v| InstanceGroupManagerNamedPorts.un_parse(v, path) }
        end
      end
    end
  end
end
