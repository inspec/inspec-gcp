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
require 'google/dataprocmetastore/property/projectlocationservice_hive_metastore_config_auxiliary_versions'
require 'google/dataprocmetastore/property/projectlocationservice_hive_metastore_config_config_overrides'
require 'google/dataprocmetastore/property/projectlocationservice_hive_metastore_config_kerberos_config'
require 'google/dataprocmetastore/property/projectlocationservice_hive_metastore_config_kerberos_config_keytab'
module GoogleInSpec
  module DataprocMetastore
    module Property
      class ProjectLocationServiceHiveMetastoreConfig
        attr_reader :version

        attr_reader :config_overrides

        attr_reader :kerberos_config

        attr_reader :endpoint_protocol

        attr_reader :auxiliary_versions

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @version = args['version']
          @config_overrides = GoogleInSpec::DataprocMetastore::Property::ProjectLocationServiceHiveMetastoreConfigConfigOverrides.new(args['configOverrides'], to_s)
          @kerberos_config = GoogleInSpec::DataprocMetastore::Property::ProjectLocationServiceHiveMetastoreConfigKerberosConfig.new(args['kerberosConfig'], to_s)
          @endpoint_protocol = args['endpointProtocol']
          @auxiliary_versions = GoogleInSpec::DataprocMetastore::Property::ProjectLocationServiceHiveMetastoreConfigAuxiliaryVersions.new(args['auxiliaryVersions'], to_s)
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceHiveMetastoreConfig"
        end
      end
    end
  end
end
