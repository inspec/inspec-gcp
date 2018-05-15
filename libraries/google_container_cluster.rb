# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/container_v1'

module Inspec::Resources
  class GoogleContainerCluster < GcpResourceBase
    name 'google_container_cluster'
    desc 'Verifies settings for a google container cluster'

    example "
      describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'gcp-inspec-test', name: 'cluster-name') do
        it { should exist }
        its('name') { should eq 'inspec-test' }
        its('status') { should eq 'in_use' }
        ...
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @cluster = @gcp.gcp_client(Google::Apis::ContainerV1::ContainerService).get_zone_cluster(opts[:project], opts[:zone], opts[:name])
        create_resource_methods(@cluster)
      end
    end

    def exists?
      !@cluster.nil?
    end

    def to_s
      "Cluster #{@display_name}"
    end
  end
end
