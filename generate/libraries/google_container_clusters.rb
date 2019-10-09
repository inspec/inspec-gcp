# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleContainerClusters < GcpResourceBase
    name 'google_container_clusters'
    desc 'Verifies settings for GCP container clusters in bulk'

    example "
      describe google_container_clusters(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @zone = opts[:zone]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:cluster_names, field: :cluster_name)
    filter_table_config.add(:cluster_statuses, field: :cluster_status)
    filter_table_config.add(:cluster_subnetworks, field: :cluster_subnetwork)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      cluster_rows = []
      catch_gcp_errors do
        # below seemingly doesn't provide pagination
        @clusters = @gcp.gcp_client(Google::Apis::ContainerV1::ContainerService).list_zone_clusters(@project, @zone)
      end
      return [] if !@clusters || !@clusters.clusters
      @clusters.clusters.map do |cluster|
        cluster_rows+=[{ cluster_name: cluster.name,
                         cluster_status: cluster.status,
                         cluster_subnetwork: cluster.subnetwork }]
      end
      @table = cluster_rows
    end
  end
end
