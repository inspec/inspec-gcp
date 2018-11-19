# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeVpnTunnels < GcpResourceBase
    name 'google_compute_vpn_tunnels'
    desc 'Verifies settings for GCP compute vpn_tunnels in bulk'

    example "
      describe google_compute_vpn_tunnels(project: 'chef-inspec-gcp', region: 'europe-west2') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @region = opts[:region]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:vpn_tunnel_names, field: :vpn_tunnel_name)
    filter_table_config.add(:vpn_tunnel_target_vpn_gateways, field: :vpn_tunnel_target_vpn_gateway)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      tunnel_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @vpn_tunnels = @gcp.gcp_compute_client.list_vpn_tunnels(@project, @region, page_token: next_page)
        end
        return [] if !@vpn_tunnels || !@vpn_tunnels.items
        @vpn_tunnels.items.map do |tunnel|
          tunnel_rows+=[{ vpn_tunnel_name: tunnel.name, vpn_tunnel_target_vpn_gateway: tunnel.target_vpn_gateway }]
        end
        next_page = @vpn_tunnels.next_page_token
        break unless next_page
      end
      @table = tunnel_rows
    end
  end
end
