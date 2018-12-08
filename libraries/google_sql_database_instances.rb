# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleCloudSqlDatabaseInstances < GcpResourceBase
    name 'google_sql_database_instances'
    desc 'Verifies settings for GCP Cloud SQL Database instances in bulk'

    example "
      describe google_sql_database_instances(project: 'chef-inspec-gcp') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:instance_names, field: :instance_name)
    filter_table_config.add(:instance_versions, field: :instance_version)
    filter_table_config.add(:instance_regions, field: :instance_region)
    filter_table_config.add(:instance_zones, field: :instance_zone)
    filter_table_config.add(:instance_states, field: :instance_state)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      instance_rows = []
      catch_gcp_errors do
        @databases = @gcp.gcp_client(Google::Apis::SqladminV1beta4::SQLAdminService).list_instances(opts[:project])
      end
      return [] if !@databases || !@databases.items
      @databases.items.map do |instance|
        instance_rows+=[{ instance_name: instance.name,
                          instance_version: instance.database_version,
                          instance_region: instance.region,
                          instance_zone: instance.gce_zone,
                          instance_state: instance.state }]
      end
      @databases = instance_rows
    end
  end
end
