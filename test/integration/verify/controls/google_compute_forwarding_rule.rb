title 'Test single GCP compute forwarding_rule'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_network_name = attribute(:gcp_lb_network, default: '', description: 'The GCP network name.')
gcp_region = attribute(:gcp_lb_region, default: '', description: 'The GCP region being used.')
gcp_forwarding_rule_name = attribute(:gcp_lb_fr_name, default: '', description: 'The GCP forwarding_rule name.')


control 'gcp-compute-forwarding_rule-1.0' do

  impact 1.0
  title 'Ensure GCP compute forwarding_rule has the correct properties.'

  describe google_compute_forwarding_rule(project: gcp_project_id, region: gcp_region, name: gcp_forwarding_rule_name) do
    it { should exist }
    its('name') { should eq gcp_forwarding_rule_name }
    its('region') { should match gcp_region }
    its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    its('load_balancing_scheme') { should match 'EXTERNAL' }
    its('port_range') { should match "80" }
    its('ip_protocol') { should match "TCP" }
  end
end
