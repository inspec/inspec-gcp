title 'Test GCP google_compute_global_forwarding_rules resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
global_forwarding_rule = input('global_forwarding_rule', value: {
  "name": "inspec-gcp-global-forwarding-rule",
  "port_range": "80-80"
}, description: 'Compute global forwarding rule definition')

control 'google_compute_global_forwarding_rules-1.0' do
  impact 1.0
  title 'google_compute_global_forwarding_rules resource test'

  describe google_compute_global_forwarding_rules(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('port_ranges') { should include global_forwarding_rule['port_range'] }
  end
end
