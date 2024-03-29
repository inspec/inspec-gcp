# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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

title 'Test GCP google_compute_instance_groups resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: 'gcp_zone', description: 'GCP zone name')
instance_group = input('instance_group', value: {
  "name": "inspec-instance-group",
  "description": "My instance group for testing",
  "named_port_name": "https",
  "named_port_port": 8080
}, description: 'Instance group')
control 'google_compute_instance_groups-1.0' do
  impact 1.0
  title 'google_compute_instance_groups resource test'


  describe google_compute_instance_groups(project: gcp_project_id, zone: gcp_zone) do
    its('instance_group_names') { should include instance_group['name'] }
  end
end
