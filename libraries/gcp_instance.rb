# frozen_string_literal: true

require 'json'

class GcpInstance < Inspec.resource(1)
  name 'gcp_instance'
  desc 'Verifies settings for an instance'

  example "
    describe gcp_instance(project: 'silicon-vertex-398188', zone: 'us-east1-b', name: 'inspec-test') do
      it { should exist }
      its('name') { should eq 'inspec-test' }
      its('machine_type') { should eq 'f1-micro' }
      its('cpu_platform') { should eq 'Intel Haswell' }
      its('status') { should eq 'running' }
      it { should have_network_tag('test') }
    end
  "

  def initialize(opts, conn = GCPConnection.new)
    @opts = opts
    @display_name = @opts[:name]
    @instance_client = conn.compute_client
    begin
      @instance = @instance_client.get_instance(@opts[:project], @opts[:zone], @opts[:name])
    rescue => e
      @error = JSON.parse(e.body)
    end
  end

  def instance_id
    if @instance
      @instance.id.to_s
    else
      @error['error']['message']
    end
  end

  def zone
    if @instance
      @instance.zone.to_s.split('/').last
    else
      @error['error']['message']
    end
  end

  def kind
    if @instance
      @instance.kind
    else
      @error['error']['message']
    end
  end

  def cpu_platform
    if @instance
      @instance.cpu_platform
    else
      @error['error']['message']
    end
  end

  def name
    if @instance
      @instance.name
    else
      @error['error']['message']
    end
  end

  def machine_type
    if @instance
      @instance.machine_type.split('/').last
    else
      @error['error']['message']
    end
  end

  def disk_count
    if @instance
      @instance.disks.count
    else
      @error['error']['message']
    end
  end

  def tag_count
    if @instance
      @instance.tags.to_h.length
    else
      @error['error']['message']
    end
  end

  def network_interface_count
    if @instance
      @instance.network_interfaces.count
    else
      @error['error']['message']
    end
  end

  # def network_interface_nat_ip(network_interface_index=0,access_configs_index=0)
  #   if @instance
  #     @instance.network_interfaces[network_interface_index].access_configs[access_configs_index].nat_ip
  #   else
  #     @error['error']['message']
  #   end
  # end

  def first_network_interface_nat_ip_exists
    if @instance
      !@instance.network_interfaces[0].access_configs[0].nat_ip.nil?
    else
      @error['error']['message']
    end
  end

  def first_network_interface_name
    if @instance
      @instance.network_interfaces[0].access_configs[0].name
    else
      @error['error']['message']
    end
  end

  def first_network_interface_type
    if @instance
      @instance.network_interfaces[0].access_configs[0].type.downcase
    else
      @error['error']['message']
    end
  end

  # def disks_source_name_equal(disk_index=0)
  #   if @instance
  #     @instance.disks[disk_index].source.split('/').last
  #   else
  #     @error['error']['message']
  #     false
  #   end
  # end

  def first_disks_source_name
    if @instance
      @instance.disks[0].source.split('/').last
    else
      @error['error']['message']
      false
    end
  end

  def first_disks_first_license
    if @instance
      @instance.disks[0].licenses[0].downcase
    else
      @error['error']['message']
      false
    end
  end

  def status
    if @instance
      @instance.status.downcase
    else
      @error['error']['message']
    end
  end

  def has_network_tag?(tag_name)
    if @instance
      tags = @instance.tags.items
      tags.each do |tag|
        if tag == tag_name
          return true
        end
      end
    else
      @error['error']['message']
      false
    end

    false
  end

  def exists?
    !@instance.nil?
  end

  def to_s
    "Instance #{@display_name}"
  end
end
