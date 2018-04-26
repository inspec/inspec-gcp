# frozen_string_literal: true

require 'gcp_backend'

class GoogleContainerNodePool < GcpResourceBase
  name 'google_container_node_pool'
  desc 'Verifies settings for a container nodepool'

  example "
    describe gcp_container_nodepool(project: 'chef-inspec-gcp', zone: 'gcp-inspec-test', name: 'cluster-name') do
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
      @nodepool = @gcp.container_client.get_project_zone_cluster_node_pool(opts[:project], opts[:zone], opts[:cluster_name], opts[:nodepool_name])
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
