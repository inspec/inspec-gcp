

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
  module Container
    module Property
      class ServerConfigChannels
        attr_reader :channel

        attr_reader :default_version

        attr_reader :valid_versions

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @channel = args["channel"]
          @default_version = args["defaultVersion"]
          @valid_versions = args["validVersions"]
        end

        def to_s
          "#{@parent_identifier} ServerConfigChannels"
        end
      end

      class ServerConfigChannelsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServerConfigChannels.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServerConfigChannels.new(v, parent_identifier) }
        end
      end
    end
  end
end
