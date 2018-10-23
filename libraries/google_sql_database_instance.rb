# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/sqladmin_v1beta4'

module Inspec::Resources
  class GoogleCloudSqlDatabaseInstance < GcpResourceBase
    name 'google_sql_database_instance'
    desc 'Verifies settings for a GCP Cloud SQL Database instance'

    example "
      describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: 'my-database') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:database]
      catch_gcp_errors do
        @database = @gcp.gcp_client(Google::Apis::SqladminV1beta4::SQLAdminService).get_instance(opts[:project], opts[:database])
        create_resource_methods(@database)
      end
    end

    def exists?
      !@database.nil?
    end

    def has_ip_configuration_require_ssl?
      return false if !defined?(@database.settings.ip_configuration.require_ssl)
      return false if @database.settings.ip_configuration.require_ssl.nil?
      return true if @database.settings.ip_configuration.require_ssl.to_s.casecmp('true').zero?
      false
    end

    def authorized_networks
      return [] if !defined?(@database.settings.ip_configuration.authorized_networks) || @database.settings.ip_configuration.authorized_networks.nil?
      @database.settings.ip_configuration.authorized_networks.map(&:value)
    end

    def primary_ip_address
      return '' if !defined?(@database.ip_addresses[0].ip_address) || @database.ip_addresses[0].ip_address.nil?
      @database.ip_addresses[0].ip_address
    end

    def to_s
      "Database #{@display_name}"
    end
  end
end
