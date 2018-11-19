title 'VPN Tunnel Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_vpn_tunnel_name = attribute(:gcp_vpn_tunnel_name, default: '', description: 'The GCP VPN tunnel name.')
gcp_vpn_gateway_name = attribute(:gcp_vpn_gateway_name, default: '', description: 'The GCP VPN gateway name.')

control 'gcp-vpn_tunnels-1.0' do

  impact 1.0
  title 'Ensure VPN tunnels have the correct properties in bulk'

  describe google_compute_vpn_tunnels(project: gcp_project_id, region: gcp_region) do
    it { should exist }
    its('count') { should be 1}
    its('vpn_tunnel_names') { should include gcp_vpn_tunnel_name }
    its('vpn_tunnel_target_vpn_gateways') { should include /#{gcp_vpn_gateway_name}/ }
  end

end
