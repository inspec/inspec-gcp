# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeSubnetwork < GcpResourceBase
    name 'google_compute_subnetwork'
    desc 'Verifies settings for a compute subnetwork'

    example "
      describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @subnetwork = @gcp.gcp_compute_client.get_subnetwork(opts[:project], opts[:region], opts[:name])
        create_resource_methods(@subnetwork)
      end
    end

    def creation_timestamp_date
      return false if !defined?(creation_timestamp) || creation_timestamp.nil?
      Time.parse(creation_timestamp.to_s)
    end

    def exists?
      !@subnetwork.nil?
    end

    def to_s
      "Subnetwork #{@display_name}"
    end
  end
end
