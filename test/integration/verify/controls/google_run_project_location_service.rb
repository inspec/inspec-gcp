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

title 'Test GCP google_run_project_location_service resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  project_location_service = input('project_location_service', value: {
  "name": "value_name",
  "parent": "value_parent",
  "create_time": "value_createtime",
  "update_time": "value_updatetime",
  "network": "value_network",
  "endpoint_uri": "value_endpointuri",
  "state": "value_state",
  "state_message": "value_statemessage",
  "artifact_gcs_uri": "value_artifactgcsuri",
  "tier": "value_tier",
  "uid": "value_uid",
  "release_channel": "value_releasechannel",
  "database_type": "value_databasetype"
}, description: 'project_location_service description')
control 'google_run_project_location_service-1.0' do
  impact 1.0
  title 'google_run_project_location_service resource test'

  describe google_run_project_location_service(name: project_location_service['name']) do
  	it { should exist }
  	its('api_version') { should cmp project_location_service['api_version'] }
  	its('kind') { should cmp project_location_service['kind'] }

  end

  describe google_run_project_location_service(name: "does_not_exit") do
  	it { should_not exist }
  end
end
