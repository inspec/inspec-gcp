# frozen_string_literal: false

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
require 'google/dataprocmetastore/property/projectlocationservice_network_config_consumers'
module GoogleInSpec
  module DataprocMetastore
    module Property
      class ProjectLocationServiceNetworkConfig
        attr_reader :consumers

        attr_reader :custom_routes_enabled

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @consumers = GoogleInSpec::DataprocMetastore::Property::ProjectLocationServiceNetworkConfigConsumersArray.parse(args['consumers'], to_s)
          @custom_routes_enabled = args['customRoutesEnabled']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceNetworkConfig"
        end
      end
    end
  end
end
