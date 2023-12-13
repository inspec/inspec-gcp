# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_compute_vpn_gateway resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  vpn_gateway = input('vpn_gateway', value: {
  "project": "ppradhan",
  "region": "us-central1",
  "vpn_gateway": "2245103640699591658",
  "kind": "value_kind",
  "id": "2245103640699591658",
  "creation_timestamp": "2023-12-12T05:49:57.914-08:00",
  "name": "inspec-vpn-gateway",
  "description": "value_description",
  "network": "https://www.googleapis.com/compute/v1/projects/ppradhan/global/networks/network1",
  "self_link": "value_selflink",
  "label_fingerprint": "value_labelfingerprint",
  "stack_type": "IPV4_ONLY"
}, description: 'vpn_gateway description')
control 'google_compute_vpn_gateway-1.0' do
  impact 1.0
  title 'google_compute_vpn_gateway resource test'

  describe google_compute_vpn_gateway(project: gcp_project_id, region: vpn_gateway['region'], vpnGateway: vpn_gateway['vpnGateway']) do
  	it { should exist }
  	its('kind') { should cmp vpn_gateway['kind'] }
  	its('id') { should cmp vpn_gateway['id'] }
  	its('creation_timestamp') { should cmp vpn_gateway['creation_timestamp'] }
  	its('name') { should cmp vpn_gateway['name'] }
  	its('description') { should cmp vpn_gateway['description'] }
  	its('region') { should cmp vpn_gateway['region'] }
  	its('network') { should cmp vpn_gateway['network'] }
  	its('self_link') { should cmp vpn_gateway['self_link'] }
  	its('label_fingerprint') { should cmp vpn_gateway['label_fingerprint'] }
  	its('stack_type') { should cmp vpn_gateway['stack_type'] }

  end

  describe google_compute_vpn_gateway(project: gcp_project_id, region: vpn_gateway['region'], vpnGateway: vpn_gateway['vpnGateway']) do
  	it { should_not exist }
  end
end