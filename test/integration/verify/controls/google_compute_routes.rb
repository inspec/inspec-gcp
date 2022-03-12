title 'Test GCP google_compute_routes resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
route = input('route', default: {
  "name": "inspec-gcp-route",
  "dest_range": "15.0.0.0/24",
  "next_hop_ip": "10.2.0.1",
  "priority": 100
}, description: 'Compute route description')
# gcp_network_name = input(:gcp_network_name, value: '', description: 'GCP network name')

control 'google_compute_routes-1.0' do
  impact 1.0
  title 'google_compute_routes resource test'

  describe google_compute_routes(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('dest_ranges') { should include route['dest_range'] }
    its('next_hop_ips') { should include route['next_hop_ip'] }
    its('priorities') { should include route['priority'] }
  end
end
