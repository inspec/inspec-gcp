# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeZone < GcpResourceBase
    name 'google_compute_zone'
    desc 'Verifies settings for a zone'

    example "
      describe google_compute_zone(project: 'chef-inspec-gcp',  zone: 'us-east1-b') do
        it { should exist }
        its('name') { should match 'us-east1-b' }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @zone = @gcp.gcp_compute_client.get_zone(opts[:project], opts[:name])
        create_resource_methods(@zone)
      end
    end

    # helper method for retrieving a region name
    def region_name
      return '' if !defined?(region) || region.nil?
      region.split('/').last
    end

    def exists?
      !@zone.nil?
    end

    def up?
      return false if !defined?(status) || status.nil?
      status == 'UP'
    end

    def to_s
      "Zone #{@display_name}"
    end
  end
end
