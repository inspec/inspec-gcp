title 'Test GCP google_compute_firewall resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
firewall = input('firewall', value: {
  "name": "inspec-gcp-firewall",
  "source_tag": "some-tag"
}, description: 'Firewall rule definition')

control 'google_compute_firewall-1.0' do
  impact 1.0
  title 'google_compute_firewall resource test'

  describe google_compute_firewall(project: gcp_project_id, name: firewall['name']) do
    its('direction') { should cmp 'INGRESS' }
    its('log_config_enabled?') { should be true }
    its('source_tags') { should include firewall['source_tag'] }
  end
end
