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

title 'Test GCP google_compute_region_network_endpoint_group resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  region_network_endpoint_group = input('region_network_endpoint_group', value: {
  "network_endpoint_group": "apigee-us-west1-xw8iaictllv4",
  "project": "value_project",
  "kind": "value_kind",
  "id": "value_id",
  "creation_timestamp": "value_creationtimestamp",
  "self_link": "value_selflink",
  "name": "value_name",
  "description": "value_description",
  "network_endpoint_type": "value_networkendpointtype",
  "region": "us-west1",
  "zone": "value_zone",
  "network": "value_network",
  "subnetwork": "value_subnetwork",
  "psc_target_service": "value_psctargetservice"
}, description: 'region_network_endpoint_group description')
control 'google_compute_region_network_endpoint_group-1.0' do
  impact 1.0
  title 'google_compute_region_network_endpoint_group resource test'

  describe google_compute_region_network_endpoint_group(network_endpoint_group: region_network_endpoint_group['network_endpoint_group'], project: gcp_project_id, region: region_network_endpoint_group['region']) do
  	it { should exist }
  	its('kind') { should cmp region_network_endpoint_group['kind'] }
  	its('id') { should cmp region_network_endpoint_group['id'] }
  	its('creation_timestamp') { should cmp region_network_endpoint_group['creation_timestamp'] }
  	its('self_link') { should cmp region_network_endpoint_group['self_link'] }
  	its('name') { should cmp region_network_endpoint_group['name'] }
  	its('description') { should cmp region_network_endpoint_group['description'] }
  	its('network_endpoint_type') { should cmp region_network_endpoint_group['network_endpoint_type'] }
  	its('region') { should cmp region_network_endpoint_group['region'] }
  	its('zone') { should cmp region_network_endpoint_group['zone'] }
  	its('network') { should cmp region_network_endpoint_group['network'] }
  	its('subnetwork') { should cmp region_network_endpoint_group['subnetwork'] }
  	its('psc_target_service') { should cmp region_network_endpoint_group['psc_target_service'] }

  end

  describe google_compute_region_network_endpoint_group(network_endpoint_group: region_network_endpoint_group['network_endpoint_group'], project: gcp_project_id, region: region_network_endpoint_group['region']) do
  	it { should_not exist }
  end
end