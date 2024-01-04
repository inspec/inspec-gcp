

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
  module DNS
    module Property
      class ManagedZoneServiceDirectoryConfigNamespace
        attr_reader :namespace_url

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @namespace_url = args["namespaceUrl"]
        end

        def to_s
          "#{@parent_identifier} ManagedZoneServiceDirectoryConfigNamespace"
        end
      end
    end
  end
end
