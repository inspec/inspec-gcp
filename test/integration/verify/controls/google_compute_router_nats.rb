title 'Test GCP google_compute_router_nats resource.'

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
router_nat = input('router_nat', value: {
  "name": "inspec-router-nat",
  "nat_ip_allocate_option": "AUTO_ONLY",
  "source_subnetwork_ip_ranges_to_nat": "ALL_SUBNETWORKS_ALL_IP_RANGES",
  "min_ports_per_vm": 2,
  "log_config_enable": true,
  "log_config_filter": "ERRORS_ONLY"
}, description: 'Compute router NAT description')

control 'google_compute_router_nats-1.0' do
  impact 1.0
  title 'google_compute_router_nats resource test'

  describe google_compute_router_nats(project: gcp_project_id, region: gcp_location, router: router['name']) do
    its('names') { should include router_nat['name'] }
  end
end
