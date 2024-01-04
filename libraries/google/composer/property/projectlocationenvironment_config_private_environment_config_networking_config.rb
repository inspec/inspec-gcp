

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
  module Composer
    module Property
      class ProjectLocationEnvironmentConfigPrivateEnvironmentConfigNetworkingConfig
        attr_reader :connection_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @connection_type = args["connectionType"]
        end

        def to_s
          "#{@parent_identifier} ProjectLocationEnvironmentConfigPrivateEnvironmentConfigNetworkingConfig"
        end
      end
    end
  end
end
