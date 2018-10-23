# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/container_v1'

module Inspec::Resources
  class GoogleContainerNodePool < GcpResourceBase
    name 'google_container_node_pool'
    desc 'Verifies settings for a container nodepool'

    example "
      describe google_container_node_pool(project: 'chef-inspec-gcp', zone: 'europe-west2-a', cluster_name: 'cluster-name', nodepool_name: 'inspec-test') do
        it { should exist }
        its('name') { should eq 'inspec-test' }
        ...
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:nodepool_name]
      catch_gcp_errors do
        @nodepool = @gcp.gcp_client(Google::Apis::ContainerV1::ContainerService).get_project_zone_cluster_node_pool(opts[:project], opts[:zone], opts[:cluster_name], opts[:nodepool_name])
        create_resource_methods(@nodepool)
      end
    end

    def has_automatic_node_repair?
      return false if !defined?(@nodepool.management.auto_repair)
      return false if @nodepool.management.auto_repair.nil?
      @nodepool.management.auto_repair
    end

    def has_automatic_node_upgrade?
      return false if !defined?(@nodepool.management.auto_upgrade)
      return false if @nodepool.management.auto_upgrade.nil?
      @nodepool.management.auto_upgrade
    end

    def config_image_type
      return '' if !defined?(@nodepool.config.image_type)
      return '' if @nodepool.config.image_type.nil?
      @nodepool.config.image_type
    end

    def config_service_account
      return '' if !defined?(@nodepool.config.service_account)
      return '' if @nodepool.config.service_account.nil?
      @nodepool.config.service_account
    end

    def config_oauth_scopes
      return false if !defined?(@nodepool.config.oauth_scopes)
      return false if @nodepool.config.oauth_scopes.nil?
      @nodepool.config.oauth_scopes
    end

    def exists?
      !@nodepool.nil?
    end

    def to_s
      "Nodepool #{@display_name}"
    end
  end
end
