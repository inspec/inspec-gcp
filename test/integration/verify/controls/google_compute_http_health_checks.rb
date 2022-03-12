title 'Test GCP google_compute_http_health_checks resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
http_health_check = input('http_health_check', value: {
  "name": "inspec-gcp-http-health-check",
  "request_path": "/health_check",
  "timeout_sec": 20,
  "check_interval_sec": 20
}, description: 'HTTP health check definition')

control 'google_compute_http_health_checks-1.0' do
  impact 1.0
  title 'google_compute_http_health_checks resource test'

  describe google_compute_http_health_checks(project: gcp_project_id) do
    its('names') { should include http_health_check['name'] }
    its('timeout_secs') { should include http_health_check['timeout_sec'] }
    its('check_interval_secs') { should include http_health_check['check_interval_sec'] }
  end
end
