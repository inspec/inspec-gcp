# frozen_string_literal: true

require 'gcp_backend'

class GcpInstanceGroup < GcpResourceBase
  name 'gcp_instance_group'
  desc 'Verifies settings for a compute instance group'

  example "
    describe gcp_instance_group(project: 'chef-inspec-gcp', location: 'us-west2', name: 'gcp-inspec-test') do
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
      @instance_group = @gcp.compute_client.get_instance_group(opts[:project], opts[:zone], opts[:name])
      create_resource_methods(@instance_group)
    end
  end

  def port_name
    get_named_ports(0,:name)
  end

  def port_value
    get_named_ports(0,:port)
  end

  def get_named_ports(index=0,key=:name)
    if defined?(named_ports[index].item[key])
      named_ports[index].item[key]
    else
      nil
    end
  end

  def to_s
    "Instance Group #{@display_name}"
  end
end
