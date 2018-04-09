# frozen_string_literal: true

require 'gcp_backend'

class GcpInstance < GcpResourceBase
  name 'gcp_instance'
  desc 'Verifies settings for an instance'

  example "
    describe gcp_instance(project: 'project-id-888', zone: 'us-east1-b', name: 'inspec-test') do
      it { should exist }
      its('name') { should eq 'inspec-test' }
      its('machine_type') { should eq 'f1-micro' }
      its('cpu_platform') { should match 'Intel' }
      its('status') { should eq 'RUNNING' }
      ...
    end
  "

  def initialize(opts = {})
    # Call the parent class constructor
    super(opts)
    @display_name = opts[:name]
    catch_gcp_errors do
      @instance = @gcp.compute_client.get_instance(opts[:project], opts[:zone], opts[:name])
      create_resource_methods(@instance)
    end
  end

  def disk_count
    @instance.disks.count
  end

  def tag_count
    @instance.tags.to_h.length
  end

  def network_interfaces_count
    @instance.network_interfaces.count
  end

  # TBD: Below few methods are present to make the tests simpler e.g. avoid looping over arrays etc.
  #     but passing index arguments would be better
  def first_network_interface_nat_ip_exists
    !@instance.network_interfaces[0].access_configs[0].nat_ip.nil?
  end

  def first_network_interface_name
    @instance.network_interfaces[0].access_configs[0].name
  end

  def first_network_interface_type
    @instance.network_interfaces[0].access_configs[0].type.downcase
  end

  def first_disks_source_name
    @instance.disks[0].source.split('/').last
  end

  def first_disks_first_license
    @instance.disks[0].licenses[0].downcase
  end

  def exists?
    !@instance.nil?
  end

  def to_s
    "Instance #{@display_name}"
  end
end
