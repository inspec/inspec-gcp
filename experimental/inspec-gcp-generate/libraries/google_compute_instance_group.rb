# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeInstanceGroup < GcpResourceBase
    name 'google_compute_instance_group'
    desc 'Verifies settings for a compute instance group'

    example "
      describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
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
        @instance_group = @gcp.gcp_compute_client.get_instance_group(opts[:project], opts[:zone], opts[:name])
        create_resource_methods(@instance_group)
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
      !@instance_group.nil?
    end

    def to_s
      "Instance Group #{@display_name}"
    end
  end
end
