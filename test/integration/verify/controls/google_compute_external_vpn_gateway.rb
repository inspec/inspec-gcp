title 'Test GCP google_compute_external_vpn_gateway resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
external_vpn_gateway = input('external_vpn_gateway', value: {
  "name": "external-gateway",
  "redundancy_type": "SINGLE_IP_INTERNALLY_REDUNDANT",
  "description": "An externally managed VPN gateway",
}, description: 'The externally managed vpn gateway.')

control 'google_compute_external_vpn_gateway-1.0' do
  impact 1.0
  title 'google_compute_external_vpn_gateway resource test'

  describe google_compute_external_vpn_gateway(project: gcp_project_id, name: external_vpn_gateway['name']) do
    it { should exist }
  end
end
