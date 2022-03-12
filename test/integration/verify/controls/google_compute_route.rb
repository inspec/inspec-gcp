title 'Test GCP google_compute_route resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
route = input('route', value: {
  "name": "inspec-gcp-route",
  "dest_range": "15.0.0.0/24",
  "next_hop_ip": "10.2.0.1",
  "priority": 100
}, description: 'Compute route description')
gcp_network_name = input(:gcp_network_name, value: '', description: 'GCP network name')

control 'google_compute_route-1.0' do
  impact 1.0
  title 'google_compute_route resource test'

  describe google_compute_route(project: gcp_project_id, name: route['name']) do
    it { should exist }
    its('dest_range') { should eq route['dest_range'] }
    its('network') { should match /\/#{gcp_network_name}$/ }
    its('next_hop_ip') { should eq route['next_hop_ip'] }
    its('priority') { should eq route['priority'] }
  end

  describe google_compute_route(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
