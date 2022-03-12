title 'Test GCP google_compute_network_endpoint_group resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
network_endpoint_group = input('network_endpoint_group', value: {
  "name": "inspec-gcp-endpoint-group",
  "default_port": 90
}, description: 'Network endpoint group description')
gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name')

control 'google_compute_network_endpoint_group-1.0' do
  impact 1.0
  title 'google_compute_network_endpoint_group resource test'

  describe google_compute_network_endpoint_group(project: gcp_project_id, zone: gcp_zone, name: network_endpoint_group['name']) do
    it { should exist }
    its('default_port') { should cmp network_endpoint_group['default_port'] }
  end

  describe google_compute_network_endpoint_group(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
