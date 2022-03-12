title 'Test GCP google_compute_https_health_checks resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
https_health_check = input('https_health_check', value: {
  "name": "inspec-gcp-https-health-check",
  "request_path": "/https_health_check",
  "timeout_sec": 15,
  "check_interval_sec": 15,
  "unhealthy_threshold": 3
}, description: 'HTTPS health check definition')

control 'google_compute_https_health_checks-1.0' do
  impact 1.0
  title 'google_compute_https_health_checks resource test'

  describe google_compute_https_health_checks(project: gcp_project_id) do
    its('names') { should include https_health_check['name'] }
    its('timeout_secs') { should include https_health_check['timeout_sec'] }
    its('check_interval_secs') { should include https_health_check['check_interval_sec'] }
  end
end
