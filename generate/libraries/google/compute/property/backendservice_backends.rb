

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
      class BackendServiceBackends
        attr_reader :arguments

        attr_reader :balancing_mode

        attr_reader :capacity_scaler

        attr_reader :description

        attr_reader :group

        attr_reader :max_connections

        attr_reader :max_connections_per_instance

        attr_reader :max_connections_per_endpoint

        attr_reader :max_rate

        attr_reader :max_rate_per_instance

        attr_reader :max_rate_per_endpoint

        attr_reader :max_utilization

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @balancing_mode = arguments["balancingMode"]
          @capacity_scaler = arguments["capacityScaler"]
          @description = arguments["description"]
          @group = arguments["group"]
          @max_connections = arguments["maxConnections"]
          @max_connections_per_instance = arguments["maxConnectionsPerInstance"]
          @max_connections_per_endpoint = arguments["maxConnectionsPerEndpoint"]
          @max_rate = arguments["maxRate"]
          @max_rate_per_instance = arguments["maxRatePerInstance"]
          @max_rate_per_endpoint = arguments["maxRatePerEndpoint"]
          @max_utilization = arguments["maxUtilization"]
        end

        def to_s
          "#{@parent_identifier} BackendServiceBackends"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            "balancing_mode" => ->(x, path) { x.nil? ? [] : ["its('#{path}.balancing_mode') { should cmp #{x.inspect} }"] },
            "capacity_scaler" => ->(x, path) { x.nil? ? [] : ["its('#{path}.capacity_scaler') { should cmp #{x.inspect} }"] },
            "description" => ->(x, path) { x.nil? ? [] : ["its('#{path}.description') { should cmp #{x.inspect} }"] },
            "group" => ->(x, path) { x.nil? ? [] : ["its('#{path}.group') { should cmp #{x.inspect} }"] },
            "max_connections" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_connections') { should cmp #{x.inspect} }"] },
            "max_connections_per_instance" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_connections_per_instance') { should cmp #{x.inspect} }"] },
            "max_connections_per_endpoint" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_connections_per_endpoint') { should cmp #{x.inspect} }"] },
            "max_rate" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_rate') { should cmp #{x.inspect} }"] },
            "max_rate_per_instance" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_rate_per_instance') { should cmp #{x.inspect} }"] },
            "max_rate_per_endpoint" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_rate_per_endpoint') { should cmp #{x.inspect} }"] },
            "max_utilization" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_utilization') { should cmp #{x.inspect} }"] },
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

      class BackendServiceBackendsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return BackendServiceBackends.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| BackendServiceBackends.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?
          value.map { |v| BackendServiceBackends.un_parse(v, path) }
        end
      end
    end
  end
end
