title 'Test GCP google_compute_url_map resource.'

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
backend_service = input('backend_service', value: {
  "name": "inspec-gcp-backend-service",
  "description": "A description",
  "port_name": "http",
  "protocol": "HTTP",
  "timeout_sec": 10,
  "enable_cdn": true
}, description: 'Backend service definition')

control 'google_compute_url_map-1.0' do
  impact 1.0
  title 'google_compute_url_map resource test'

  describe google_compute_url_map(project: gcp_project_id, name: url_map['name']) do
    it { should exist }
    its('description') { should eq url_map['description'] }
    its('default_service') { should match /\/inspec-gcp-backend-service$/ }
    its('host_rules.count') { should eq 1 }
    its('host_rules.first.hosts') { should include url_map['host_rule_host'] }
    its('path_matchers.count') { should eq 1 }
    its('path_matchers.first.default_service') { should match /\/inspec-gcp-backend-service$/ }
    its('tests.count') { should eq 1 }
    its('tests.first.host') { should eq url_map['test_host'] }
    its('tests.first.path') { should eq url_map['test_path'] }
  end

  describe google_compute_url_map(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
