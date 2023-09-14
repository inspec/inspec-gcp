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

title 'Test GCP google_vertex_ai_metadata_store resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  metadata_store = input('metadata_store', value: {
  "name": "value_name",
  "region": "value_region",
  "parent": "value_parent",
  "description": "value_description",
  "create_time": "value_createtime",
  "update_time": "value_updatetime"
}, description: 'metadata_store description')
control 'google_vertex_ai_metadata_store-1.0' do
  impact 1.0
  title 'google_vertex_ai_metadata_store resource test'

  describe google_vertex_ai_metadata_store(name: "projects/#{gcp_project_id}/locations/#{metadata_store['region']}/metadataStores/#{metadata_store['name']}", region: metadata_store['region']) do
  	it { should exist }
  	its('description') { should cmp metadata_store['description'] }
  	its('create_time') { should cmp metadata_store['create_time'] }
  	its('update_time') { should cmp metadata_store['update_time'] }
  	its('name') { should cmp metadata_store['name'] }

  end

  describe google_vertex_ai_metadata_store(name: "does_not_exit", region: metadata_store['region']) do
  	it { should_not exist }
  end
end
