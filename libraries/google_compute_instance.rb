# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeInstance < GcpResourceBase
    name 'google_compute_instance'
    desc 'Verifies settings for an instance'

    example "
      describe google_compute_instance(project: 'chef-inspec-gcp', zone: 'us-east1-b', name: 'inspec-test') do
        it { should exist }
        its('name') { should eq 'inspec-test' }
        its('machine_size') { should eq 'f1-micro' }
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
        @instance = @gcp.gcp_compute_client.get_instance(opts[:project], opts[:zone], opts[:name])
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
    #     but passing index arguments from the inspec test would be better

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
      disks_source_name(0)
    end

    def first_disks_first_license
      disks_license(0, 0)
    end

    def second_disks_device_name
      return false if !defined?(disks[1].device_name)
      disks[1].device_name
    end

    def second_disks_kind
      return false if !defined?(disks[1].kind)
      disks[1].kind
    end

    def second_disks_source_name
      disks_source_name(1)
    end

    def second_disks_first_license
      disks_license(1, 0)
    end

    # helper method for retrieving a disk source basename
    def disks_source_name(index = 0)
      return false if !defined?(disks[index].source)
      disks[index].source.split('/').last
    end

    # helper method for retrieving a disk license string
    def disks_license(disk_index = 0, license_index = 0)
      return false if !defined?(disks[disk_index].licenses[license_index])
      disks[disk_index].licenses[license_index].downcase
    end

    def machine_size
      return false if !defined?(machine_type)
      machine_type.split('/').last
    end

    # helper for returning label keys to perform checks
    def labels_keys
      return [] if !defined?(labels)
      labels.item.keys
    end

    # helper for returning label values to perform checks
    def labels_values
      return [] if !defined?(labels)
      labels.item.values
    end

    def service_account_scopes
      # note instances can have only one service account defined
      return [] if !defined?(@instance.service_accounts[0].scopes)
      @instance.service_accounts[0].scopes
    end

    def block_project_ssh_keys
      return false if !defined?(@instance.metadata.items)
      @instance.metadata.items.each do |element|
        return true if element.key=='block-project-ssh-keys' and element.value.casecmp('true').zero?
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
end
