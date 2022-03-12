title 'Test GCP google_compute_forwarding_rule resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_lb_region = input(:gcp_lb_region, value: '', description: 'The region used for the forwarding rule.')
gcp_fr_udp_name = input(:gcp_fr_udp_name, value: '', description: 'The forwarding rule name.')

control 'google_compute_forwarding_rule-1.0' do
  impact 1.0
  title 'google_compute_forwarding_rule resource test'

  describe google_compute_forwarding_rule(project: gcp_project_id, region: gcp_lb_region, name: "#{gcp_fr_udp_name}-500") do
    it { should exist }
    its('region') { should match gcp_lb_region }
    its('creation_timestamp') { should be > Time.now - 365*60*60*24*10 }
    its('load_balancing_scheme') { should match 'EXTERNAL' }
    its('port_range') { should match "500-500" }
    its('ip_protocol') { should match "UDP" }
  end

  describe google_compute_forwarding_rule(project: gcp_project_id, region: gcp_lb_region, name: "nonexistent") do
    it { should_not exist }
  end
end
