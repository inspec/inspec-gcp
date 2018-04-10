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
    disks.count
  end

  def tag_count
    tags.count
  end

  def network_interfaces_count
    network_interfaces.count
  end

  # TBD: Below few methods are present to make the tests simpler e.g. avoid looping over arrays etc.
  #     but passing index arguments would be better
  def first_network_interface_nat_ip_exists
    !network_interfaces[0].access_configs[0].nat_ip.nil?
  end

  def first_network_interface_name
    network_interfaces[0].access_configs[0].name
  end

  def first_network_interface_type
    network_interfaces[0].access_configs[0].type.downcase
  end

  def first_disks_source_name
    disks[0].source.split('/').last
  end

  def first_disks_first_license
    disks[0].licenses[0].downcase
  end

  def exists?
    !@instance.nil?
  end

  def to_s
    "Instance #{@display_name}"
  end
end
