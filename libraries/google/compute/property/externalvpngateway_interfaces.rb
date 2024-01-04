

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
  module Compute
    module Property
      class ExternalVpnGatewayInterfaces
        attr_reader :id

        attr_reader :ip_address

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @id = args["id"]
          @ip_address = args["ipAddress"]
        end

        def to_s
          "#{@parent_identifier} ExternalVpnGatewayInterfaces"
        end
      end

      class ExternalVpnGatewayInterfacesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ExternalVpnGatewayInterfaces.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ExternalVpnGatewayInterfaces.new(v, parent_identifier) }
        end
      end
    end
  end
end
