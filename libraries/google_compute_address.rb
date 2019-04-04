# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeAddress < GcpResourceBase
    name 'google_compute_address'
    desc 'Verifies settings for a compute address'

    example "
      describe google_compute_address(project: 'chef-inspec-gcp', location: 'us-west2', name: 'gcp-inspec-test') do
        it { should exist }
        its('name') { should eq 'inspec-test' }
        its('status') { should eq 'in_use' }
        ...
      end
    "

    supports platform: 'gcp'

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @address = @gcp.gcp_compute_client.get_address(opts[:project], opts[:location], opts[:name])
        create_resource_methods(@address)
      end
    end

    def address_ip_exists
      !address.nil?
    end

    def exists?
      !address.nil?
    end

    # How many users are there for the address
    def user_count
      users.count
    end

    # Return the first user resource base name
    def user_resource_name
      users.first.split('/').last
    end

    def to_s
      "Address #{@display_name}"
    end
  end
end
