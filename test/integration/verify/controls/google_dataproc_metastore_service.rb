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

title 'Test GCP google_dataproc_metastore_service resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  project_location_service = input('project_location_service', value: {
  "name": "projects/ppradhan/locations/us-central1/services/metastore-srv",
  "parent": "projects/ppradhan/locations/us-central1",
  "create_time": "2024-07-11T10:37:41.096165514Z",
  "update_time": "2024-07-11T11:17:30.112145404Z",
  "network": "projects/ppradhan/global/networks/default",
  "endpoint_uri": "thrift://10.104.64.28:9080",
  "state": "ACTIVE",
  "state_message": "The service is ready to use",
  "artifact_gcs_uri": "gs://gcs-bucket-metastore-srv-2a1c2d78-1aab-4f1b-b6cd-388796854ab8",
  "tier": "DEVELOPER",
  "uid": "2a1c2d78-1aab-4f1b-b6cd-388796854ab8",
  "release_channel": "STABLE",
  "database_type": "MYSQL"
}, description: 'project_location_service description')
control 'google_dataproc_metastore_service-1.0' do
  impact 1.0
  title 'google_dataproc_metastore_service resource test'

  describe google_dataproc_metastore_service(name: project_location_service['name']) do
  	it { should exist }
  	its('name') { should cmp project_location_service['name'] }
  	its('create_time') { should cmp project_location_service['create_time'] }
  	its('update_time') { should cmp project_location_service['update_time'] }
  	its('network') { should cmp project_location_service['network'] }
  	its('endpoint_uri') { should cmp project_location_service['endpoint_uri'] }
  	its('state') { should cmp project_location_service['state'] }
  	its('state_message') { should cmp project_location_service['state_message'] }
  	its('artifact_gcs_uri') { should cmp project_location_service['artifact_gcs_uri'] }
  	its('tier') { should cmp project_location_service['tier'] }
  	its('uid') { should cmp project_location_service['uid'] }
  	its('release_channel') { should cmp project_location_service['release_channel'] }
  	its('database_type') { should cmp project_location_service['database_type'] }
  end

  describe google_dataproc_metastore_service(name: "does_not_exit") do
  	it { should_not exist }
  end
end