+++
title = "google_vertex_ai_metadata_stores_metadata_schemas resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_metadata_stores_metadata_schemas"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores_metadata_schemas Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_metadata_stores_metadata_schemas` InSpec audit resource to to test a Google Cloud MetadataStoresMetadataSchema resource.

## Examples

```ruby
    describe google_vertex_ai_metadata_stores_metadata_schemas(parent: "projects/#{gcp_project_id}/locations/#{metadata_stores_metadata_schema['region']}/metadataStores/#{metadata_stores_metadata_schema['metadataStore']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_metadata_stores_metadata_schemas` resource:

See [google_vertex_ai_metadata_stores_metadata_schema](google_vertex_ai_metadata_stores_metadata_schema) for more detailed information.

  * `schema_types`: an array of `google_vertex_ai_metadata_stores_metadata_schema` schema_type
  * `descriptions`: an array of `google_vertex_ai_metadata_stores_metadata_schema` description
  * `schema_versions`: an array of `google_vertex_ai_metadata_stores_metadata_schema` schema_version
  * `names`: an array of `google_vertex_ai_metadata_stores_metadata_schema` name
  * `create_times`: an array of `google_vertex_ai_metadata_stores_metadata_schema` create_time
  * `schemas`: an array of `google_vertex_ai_metadata_stores_metadata_schema` schema

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
