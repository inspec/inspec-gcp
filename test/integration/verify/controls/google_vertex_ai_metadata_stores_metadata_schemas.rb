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

title 'Test GCP google_vertex_ai_metadata_stores_metadata_schemas resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  metadata_stores_metadata_schema = input('metadata_stores_metadata_schema', value: {
  "name": "system-dag-execution-v0-0-1",
  "region": "us-central1",
  "parent": "projects/165434197229/locations/us-central1/metadataStores/default/metadataSchemas/",
  "metadataStore": "default",
  "schema_type": "EXECUTION_TYPE",
  "description": "value_description",
  "schema_version": "value_schemaversion",
  "create_time": "value_createtime",
  "schema": "value_schema"
}, description: 'metadata_stores_metadata_schema description')
control 'google_vertex_ai_metadata_stores_metadata_schemas-1.0' do
  impact 1.0
  title 'google_vertex_ai_metadata_stores_metadata_schemas resource test'

      describe google_vertex_ai_metadata_stores_metadata_schemas(parent: "projects/#{gcp_project_id}/locations/#{metadata_stores_metadata_schema['region']}/metadataStores/#{metadata_stores_metadata_schema['metadataStore']}", region: metadata_stores_metadata_schema['region']) do
      it { should exist }
    end
end
