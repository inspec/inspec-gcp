# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeRegionInstanceGroupManager < GcpResourceBase
    name 'google_compute_region_instance_group_manager'
    desc 'Verifies settings for a compute instance group manager'

    example "
      describe google_compute_region_instance_group_manager(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-test') do
        it { should exist }
        its('name') { should eq 'inspec-test' }
        ...
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      @region = opts[:region]

      catch_gcp_errors do
        @instance_group_manager = @gcp.gcp_compute_client.get_region_instance_group_manager(opts[:project], @region, @display_name)
        create_resource_methods(@instance_group_manager)
      end
    end

    def port_name
      find_named_ports(:name)
    end
    RSpec::Matchers.alias_matcher :has_port_name, :be_allow_port_name

    def port_value
      find_named_ports(:port)
    end
    RSpec::Matchers.alias_matcher :has_port_value, :be_allow_port_value

    def find_named_ports(key = :name)
      # check all name/port values for a match
      return false if !defined?(named_ports) || named_ports.nil?
      named_ports.each do |named_port|
        next if !defined?(named_port.item[key]) || named_port.item[key].nil?
        return named_port.item[key]
      end
      false
    end

    def exists?
      !@instance_group_manager.nil?
    end

    def to_s
      "Region Instance Group Manager #{@display_name}"
    end
  end
end
