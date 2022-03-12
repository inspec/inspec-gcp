title 'Test GCP google_compute_routers resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
router = input('router', value: {
  "name": "inspec-gcp-router",
  "bgp_asn": 64514,
  "bgp_advertise_mode": "CUSTOM",
  "bgp_advertised_group": "ALL_SUBNETS",
  "bgp_advertised_ip_range1": "1.2.3.4",
  "bgp_advertised_ip_range2": "6.7.0.0/16"
}, description: 'Compute router description')
# gcp_network_name = input(:gcp_network_name, value: '', description: 'GCP network name')

control 'google_compute_routers-1.0' do
  impact 1.0
  title 'google_compute_routers resource test'

  describe google_compute_routers(project: gcp_project_id, region: gcp_location) do
    its('names') { should include router['name'] }
  end
end
