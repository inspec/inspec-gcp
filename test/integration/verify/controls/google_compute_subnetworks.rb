title 'Test GCP google_compute_subnetworks resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
subnetwork = input('subnetwork', value: {
  "name": "inspec-subnet",
  "ip_cidr_range": "10.2.0.0/16",
  "log_interval": "INTERVAL_10_MIN",
  "log_sampling": 0.5,
  "log_metadata": "INCLUDE_ALL_METADATA"
}, description: 'Compute subnetwork description')

control 'google_compute_subnetworks-1.0' do
  impact 1.0
  title 'google_compute_subnetworks resource test'

  describe google_compute_subnetworks(project: gcp_project_id, region: gcp_location) do
    its('ip_cidr_ranges') { should include subnetwork['ip_cidr_range'] }
    its('subnetwork_names') { should include subnetwork['name'] }
  end
end
