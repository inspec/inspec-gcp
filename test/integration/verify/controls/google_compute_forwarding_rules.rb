title 'Test GCP google_compute_forwarding_rules resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_lb_region = input(:gcp_lb_region, value: '', description: 'The region used for the forwarding rule.')
gcp_fr_udp_name = input(:gcp_fr_udp_name, value: '', description: 'The forwarding rule name.')

control 'google_compute_forwarding_rules-1.0' do
  impact 1.0
  title 'google_compute_forwarding_rules resource test'

  describe google_compute_forwarding_rules(project: gcp_project_id, region: gcp_lb_region) do
    its('forwarding_rule_names') { should include "#{gcp_fr_udp_name}-500" }
  end
end
