title 'Test GCP google_compute_router resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
router = input('router', value: {
  "name": "inspec-gcp-router",
  "bgp_asn": 64514,
  "bgp_advertise_mode": "CUSTOM",
  "bgp_advertised_group": "ALL_SUBNETS",
  "bgp_advertised_ip_range1": "1.2.3.4",
  "bgp_advertised_ip_range2": "6.7.0.0/16"
}, description: 'Compute router description')
gcp_network_name = input(:gcp_network_name, value: '', description: 'GCP network name')

control 'google_compute_router-1.0' do
  impact 1.0
  title 'google_compute_router resource test'

  describe google_compute_router(project: gcp_project_id, region: gcp_location, name: router['name']) do
    it { should exist }
    its('bgp.asn') { should eq router['bgp_asn'] }
    its('bgp.advertise_mode') { should eq router['bgp_advertise_mode'] }
    its('bgp.advertised_groups') { should include router['bgp_advertised_group'] }
    its('bgp.advertised_ip_ranges.count') { should eq 2 }
    its('bgp.advertised_ip_ranges.first.range') { should eq router['bgp_advertised_ip_range1'] }
    its('bgp.advertised_ip_ranges.last.range') { should eq router['bgp_advertised_ip_range2'] }
      its('network') { should match /\/#{gcp_network_name}$/ }
    end

  describe google_compute_router(project: gcp_project_id, region: gcp_location, name: 'nonexistent') do
    it { should_not exist }
  end
end
