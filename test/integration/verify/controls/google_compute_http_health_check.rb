title 'Test GCP google_compute_http_health_check resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
http_health_check = input('http_health_check', value: {
  "name": "inspec-gcp-http-health-check",
  "request_path": "/health_check",
  "timeout_sec": 20,
  "check_interval_sec": 20
}, description: 'HTTP health check definition')

control 'google_compute_http_health_check-1.0' do
  impact 1.0
  title 'google_compute_http_health_check resource test'

  describe google_compute_http_health_check(project: gcp_project_id, name: http_health_check['name']) do
    it { should exist }
    its('timeout_sec') { should eq http_health_check['timeout_sec'] }
    its('request_path') { should eq http_health_check['request_path'] }
    its('check_interval_sec') { should eq http_health_check['check_interval_sec'] }
  end

  describe google_compute_http_health_check(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
