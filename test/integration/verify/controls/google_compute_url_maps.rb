title 'Test GCP google_compute_url_maps resource.'

# backend_service = input('backend_service', value: {
#   "name": "inspec-gcp-backend-service",
#   "description": "A description",
#   "port_name": "http",
#   "protocol": "HTTP",
#   "timeout_sec": 10,
#   "enable_cdn": true
# }, description: 'Backend service definition')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
url_map = input('url_map', value: {
  "name": "inspec-gcp-url-map",
  "description": "URL map description",
  "host_rule_host": "site.com",
  "path_matcher_name": "allpaths",
  "path_rule_path": "/home",
  "test_host": "test.com",
  "test_path": "/home"
}, description: 'Compute URL map definition')

control 'google_compute_url_maps-1.0' do
  impact 1.0
  title 'google_compute_url_maps resource test'

  describe google_compute_url_maps(project: gcp_project_id) do
    its('names') { should include url_map['name'] }
  end
end
