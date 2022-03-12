title 'Test GCP google_compute_global_forwarding_rule resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
global_forwarding_rule = input('global_forwarding_rule', value: {
  "name": "inspec-gcp-global-forwarding-rule",
  "port_range": "80-80"
}, description: 'Compute global forwarding rule definition')

control 'google_compute_global_forwarding_rule-1.0' do
  impact 1.0
  title 'google_compute_global_forwarding_rule resource test'

  describe google_compute_global_forwarding_rule(project: gcp_project_id, name: global_forwarding_rule['name']) do
    it { should exist }
    its('port_range') { should eq global_forwarding_rule['port_range'] }
    its('target') { should  match /\/inspec-gcp-http-proxy$/ }
  end

  describe google_compute_global_forwarding_rule(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
