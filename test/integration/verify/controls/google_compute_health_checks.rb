title 'Test GCP google_compute_health_checks resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
health_check = input('health_check', value: {
  "name": "inspec-gcp-health-check",
  "timeout_sec": 10,
  "check_interval_sec": 10,
  "tcp_health_check_port": 80
}, description: 'Health check definition')

control 'google_compute_health_checks-1.0' do
  impact 1.0
  title 'google_compute_health_checks resource test'

  describe google_compute_health_checks(project: gcp_project_id) do
    its('names') { should include health_check['name'] }
    its('timeout_secs') { should include health_check['timeout_sec'] }
  end
end
