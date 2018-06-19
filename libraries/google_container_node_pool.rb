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
      @display_name = opts[:name]
      catch_gcp_errors do
        @nodepool = @gcp.gcp_client(Google::Apis::ContainerV1::ContainerService).get_project_zone_cluster_node_pool(opts[:project], opts[:zone], opts[:cluster_name], opts[:nodepool_name])
        create_resource_methods(@nodepool)
      end
    end

    def exists?
      !@nodepool.nil?
    end

    def to_s
      "Nodepool #{@display_name}"
    end
  end
end
