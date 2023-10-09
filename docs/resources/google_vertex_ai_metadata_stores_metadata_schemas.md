---
title: About the google_vertex_ai_metadata_stores_metadata_schemas resource
platform: gcp
---

## Syntax
A `google_vertex_ai_metadata_stores_metadata_schemas` is used to test a Google MetadataStoresMetadataSchema resource

## Examples
```
    describe google_vertex_ai_metadata_stores_metadata_schemas(parent: "projects/#{gcp_project_id}/locations/#{metadata_stores_metadata_schema['region']}/metadataStores/#{metadata_stores_metadata_schema['metadataStore']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_metadata_stores_metadata_schemas` resource:

See [google_vertex_ai_metadata_stores_metadata_schema.md](google_vertex_ai_metadata_stores_metadata_schema.md) for more detailed information
  * `schema_types`: an array of `google_vertex_ai_metadata_stores_metadata_schema` schema_type
  * `descriptions`: an array of `google_vertex_ai_metadata_stores_metadata_schema` description
  * `schema_versions`: an array of `google_vertex_ai_metadata_stores_metadata_schema` schema_version
  * `names`: an array of `google_vertex_ai_metadata_stores_metadata_schema` name
  * `create_times`: an array of `google_vertex_ai_metadata_stores_metadata_schema` create_time
  * `schemas`: an array of `google_vertex_ai_metadata_stores_metadata_schema` schema

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
