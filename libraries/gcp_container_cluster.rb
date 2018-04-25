# frozen_string_literal: true

require 'gcp_backend'

class GcpContainerCluster < GcpResourceBase
  name 'gcp_container_cluster'
  desc 'Verifies settings for a container cluster'

  example "
    describe gcp_container_cluster(project: 'chef-inspec-gcp', zone: 'gcp-inspec-test', name: 'cluster-name') do
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
      @cluster = @gcp.container_client.get_zone_cluster(opts[:project], opts[:zone], opts[:name])
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
