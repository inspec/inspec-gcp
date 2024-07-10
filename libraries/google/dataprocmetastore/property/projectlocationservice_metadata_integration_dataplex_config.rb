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
require 'google/dataprocmetastore/property/projectlocationservice_metadata_integration_dataplex_config_lake_resources'
module GoogleInSpec
  module DataprocMetastore
    module Property
      class ProjectLocationServiceMetadataIntegrationDataplexConfig
        attr_reader :lake_resources

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @lake_resources = GoogleInSpec::DataprocMetastore::Property::ProjectLocationServiceMetadataIntegrationDataplexConfigLakeResources.new(args['lakeResources'], to_s)
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceMetadataIntegrationDataplexConfig"
        end
      end
    end
  end
end
