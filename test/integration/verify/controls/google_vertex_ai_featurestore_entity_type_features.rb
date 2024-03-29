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

title 'Test GCP google_vertex_ai_featurestore_entity_type_features resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  featurestore_entity_type_feature = input('featurestore_entity_type_feature', value: {
    "entityType": "entity_type_1",
    "region": "us-central1",
    "description": "value_description",
    "create_time": "2023-09-14T07:42:36.438713Z",
    "etag": "AMEw9yPMYJMlc3n6zzbc0vVMquWBrXyW-qjvfoHwzRQVGwFT3LU75lZIahPMBkYQlHzZ",
    "update_time": "2023-09-14T07:42:36.438714Z",
    "featurestore": "feature_store_1",
   "value_type":"BOOL",
}, description: 'featurestore_entity_type_feature description')
control 'google_vertex_ai_featurestore_entity_type_features-1.0' do
  impact 1.0
  title 'google_vertex_ai_featurestore_entity_type_features resource test'
      describe google_vertex_ai_featurestore_entity_type_features(parent: "projects/#{gcp_project_id}/locations/#{featurestore_entity_type_feature['region']}/featurestores/#{featurestore_entity_type_feature['featurestore']}/entityTypes/#{featurestore_entity_type_feature['entityType']}", region: featurestore_entity_type_feature['region']) do
      it { should exist }
    end
end
