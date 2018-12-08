# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleCloudSqlUsers < GcpResourceBase
    name 'google_sql_users'
    desc 'Verifies settings for GCP Cloud SQL Database users in bulk'

    example "
      describe google_sql_users(project: 'chef-inspec-gcp', database: 'database') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:user_names, field: :user_name)
    filter_table_config.add(:user_hosts, field: :user_host)
    filter_table_config.add(:user_instances, field: :user_instance)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      user_rows = []
      catch_gcp_errors do
        @users = @gcp.gcp_client(Google::Apis::SqladminV1beta4::SQLAdminService).list_users(opts[:project], opts[:database])
      end
      return [] if !@users || !@users.items
      @users.items.map do |user|
        user_rows+=[{ user_name: user.name,
                      user_host: user.host,
                      user_instance: user.instance }]
      end
      @users = user_rows
    end
  end
end
