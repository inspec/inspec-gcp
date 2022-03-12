title 'Test GCP google_compute_security_policies resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
security_policy = input('security_policy', value: {
  "name": "sec-policy",
  "action": "deny(403)",
  "priority": "1000",
  "ip_range": "9.9.9.0/24",
  "description": "my description"
}, description: 'Security Policy description')

control 'google_compute_security_policies-1.0' do
  impact 1.0
  title 'google_compute_security_policies resource test'

  describe google_compute_security_policies(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('names') { should include security_policy['name'] }
  end
end
