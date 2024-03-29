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

title 'Test GCP google_vertex_ai_datasets_data_items resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  datasets_data_item = input('datasets_data_item', value: {
  "parent": "value_parent",
  "region": "us-central1",
  "update_time": "value_updatetime",
  "etag": "value_etag",
  "name": "value",
  "create_time": "value_createtime",
  "dataset": "871737898477551616"
}, description: 'datasets_data_item description')
control 'google_vertex_ai_datasets_data_items-1.0' do
  impact 1.0
  title 'google_vertex_ai_datasets_data_items resource test'

      describe google_vertex_ai_datasets_data_items(parent: "projects/#{gcp_project_id}/locations/#{datasets_data_item['region']}/datasets/#{datasets_data_item['dataset']}", region: datasets_data_item['region']) do
      it { should exist }
    end
end
