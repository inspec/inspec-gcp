

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
  module ServiceUsage
    module Property
      class ServiceConfigApis
        attr_reader :name

        attr_reader :version

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args["name"]
          @version = args["version"]
        end

        def to_s
          "#{@parent_identifier} ServiceConfigApis"
        end
      end

      class ServiceConfigApisArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServiceConfigApis.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServiceConfigApis.new(v, parent_identifier) }
        end
      end
    end
  end
end
