# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleContainerNodePools < GcpResourceBase
    name 'google_container_node_pools'
    desc 'Verifies settings for GCP container node pools in bulk'

    example "
      describe google_container_node_pools(project: 'chef-inspec-gcp', node_pool: 'europe-west2-a', cluster_name: 'inspec-gcp-cluster')
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @zone = opts[:zone]
      @cluster_name = opts[:cluster_name]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:node_pool_names, field: :node_pool_name)
    filter_table_config.add(:node_pool_statuses, field: :node_pool_status)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      node_pool_rows = []
      catch_gcp_errors do
        # no pagination
        @node_pools = @gcp.gcp_client(Google::Apis::ContainerV1::ContainerService).list_project_zone_cluster_node_pools(@project, @zone, @cluster_name)
      end
      return [] if !@node_pools || !@node_pools.node_pools
      @node_pools.node_pools.map do |node_pool|
        node_pool_rows+=[{ node_pool_name: node_pool.name,
                           node_pool_status: node_pool.status }]
      end
      @table = node_pool_rows
    end
  end
end
