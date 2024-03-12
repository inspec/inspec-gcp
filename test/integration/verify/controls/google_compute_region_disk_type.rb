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

title 'Test GCP google_compute_region_disk_type resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  region_disk_type = input('region_disk_type', value: {
  "disk_type": "value_disktype",
  "project": "value_project",
  "region": "value_region",
  "kind": "value_kind",
  "id": "value_id",
  "creation_timestamp": "value_creationtimestamp",
  "name": "value_name",
  "description": "value_description",
  "valid_disk_size": "value_validdisksize",
  "zone": "value_zone",
  "self_link": "value_selflink",
  "self_link_with_id": "value_selflinkwithid",
  "default_disk_size_gb": "value_defaultdisksizegb"
}, description: 'region_disk_type description')
control 'google_compute_region_disk_type-1.0' do
  impact 1.0
  title 'google_compute_region_disk_type resource test'

  describe google_compute_region_disk_type(diskType: region_disk_type['diskType'], project: gcp_project_id, region: region_disk_type['region']) do
  	it { should exist }
  	its('kind') { should cmp region_disk_type['kind'] }
  	its('id') { should cmp region_disk_type['id'] }
  	its('creation_timestamp') { should cmp region_disk_type['creation_timestamp'] }
  	its('name') { should cmp region_disk_type['name'] }
  	its('description') { should cmp region_disk_type['description'] }
  	its('valid_disk_size') { should cmp region_disk_type['valid_disk_size'] }
  	its('zone') { should cmp region_disk_type['zone'] }
  	its('self_link') { should cmp region_disk_type['self_link'] }
  	its('self_link_with_id') { should cmp region_disk_type['self_link_with_id'] }
  	its('default_disk_size_gb') { should cmp region_disk_type['default_disk_size_gb'] }
  	its('region') { should cmp region_disk_type['region'] }

  end

  describe google_compute_region_disk_type(diskType: region_disk_type['diskType'], project: gcp_project_id, region: region_disk_type['region']) do
  	it { should_not exist }
  end
end
