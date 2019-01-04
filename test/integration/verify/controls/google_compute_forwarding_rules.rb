title 'ForwardingRules Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_lb_region, default: '', description: 'The GCP region being used.')
gcp_forwarding_rule_name = attribute(:gcp_lb_fr_name, default: '', description: 'The GCP forwarding_rule name.')

control 'gcp-forwarding_rules-1.0' do

  impact 1.0
  title 'Ensure forwarding_rules have the correct properties in bulk'

  describe google_compute_forwarding_rules(project: gcp_project_id, region: gcp_region) do
    it { should exist }
    its('count') { should be <= 100}
    its('forwarding_rule_names') { should include gcp_forwarding_rule_name }
  end

end
