

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
  module SQL
    module Property
      class ConnectIpAddresses
        attr_reader :ip_address

        attr_reader :time_to_retire

        attr_reader :type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @ip_address = args["ipAddress"]
          @time_to_retire = parse_time_string(args["timeToRetire"])
          @type = args["type"]
        end

        def to_s
          "#{@parent_identifier} ConnectIpAddresses"
        end

        # Handles parsing RFC3339 time string
        def parse_time_string(time_string)
          time_string ? Time.parse(time_string) : nil
        end
      end

      class ConnectIpAddressesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ConnectIpAddresses.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ConnectIpAddresses.new(v, parent_identifier) }
        end
      end
    end
  end
end
