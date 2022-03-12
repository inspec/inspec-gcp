title 'Test GCP google_compute_network_endpoint_groups resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
network_endpoint_group = input('network_endpoint_group', value: {
  "name": "inspec-gcp-endpoint-group",
  "default_port": 90
}, description: 'Network endpoint group description')
gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name')

control 'google_compute_network_endpoint_groups-1.0' do
  impact 1.0
  title 'google_compute_network_endpoint_groups resource test'


  describe google_compute_network_endpoint_groups(project: gcp_project_id, zone: gcp_zone) do
    its('default_ports') { should include network_endpoint_group['default_port'] }
    its('names') { should include network_endpoint_group['name'] }
  end
end
