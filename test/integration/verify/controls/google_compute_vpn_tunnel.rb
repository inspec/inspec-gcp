title 'VPN Tunnel Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_vpn_tunnel_name = attribute(:gcp_vpn_tunnel_name, default: '', description: 'The GCP VPN tunnel name.')
gcp_vpn_gateway_name = attribute(:gcp_vpn_gateway_name, default: '', description: 'The GCP VPN gateway name.')

control 'gcp-vpn_tunnel-1.0' do

  impact 1.0
  title 'Ensure VPN tunnel have the correct properties in bulk'

  describe google_compute_vpn_tunnel(project: gcp_project_id, region: gcp_region, name: gcp_vpn_tunnel_name ) do
    it { should exist }
    its('name') { should eq gcp_vpn_tunnel_name }
    its('target_vpn_gateway') { should match /#{gcp_vpn_gateway_name}/ }
    its('remote_traffic_selector') { should include "0.0.0.0/0" }
    its('status') { should_not eq "ESTABLISHED" }
  end

end
