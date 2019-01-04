# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeVpnTunnel < GcpResourceBase
    name 'google_compute_vpn_tunnel'
    desc 'Verifies settings for a compute vpn_tunnel'

    example "
      describe google_compute_vpn_tunnel(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-vpn_tunnel') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @vpn_tunnel = @gcp.gcp_compute_client.get_vpn_tunnel(opts[:project], opts[:region], opts[:name])
        create_resource_methods(@vpn_tunnel)
      end
    end

    def exists?
      !@vpn_tunnel.nil?
    end

    def creation_timestamp_date
      return false if !defined?(creation_timestamp) || creation_timestamp.nil?
      Time.parse(creation_timestamp.to_s)
    end

    def to_s
      "Tunnel #{@display_name}"
    end
  end
end
