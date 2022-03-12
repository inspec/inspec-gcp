title 'Test GCP google_compute_networks resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
network = input('network', value: {
  "name": "inspec-network",
  "routing_mode": "REGIONAL"
}, description: 'Network description')

control 'google_compute_networks-1.0' do
  impact 1.0
  title 'google_compute_networks resource test'

  describe google_compute_networks(project: gcp_project_id) do
  	its('network_names') { should include network['name'] }
  end
end
