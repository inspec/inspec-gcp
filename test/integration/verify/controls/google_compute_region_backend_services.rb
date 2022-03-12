title 'Test GCP google_compute_region_backend_services resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
region_backend_service = input('region_backend_service', value: {
  "name": "inspec-gcp-region-backend-service",
  "description": "A regional description",
  "protocol": "TCP",
  "timeout_sec": 15
}, description: 'Backend service definition')

control 'google_compute_region_backend_services-1.0' do
  impact 1.0
  title 'google_compute_region_backend_services resource test'

  describe google_compute_region_backend_services(project: gcp_project_id, region: gcp_location) do
    its('count') { should be >= 1 }
    its('names') { should include region_backend_service['name'] }
    its('protocols') { should include region_backend_service['protocol'] }
    its('timeout_secs') { should include region_backend_service['timeout_sec'] }
  end
end
