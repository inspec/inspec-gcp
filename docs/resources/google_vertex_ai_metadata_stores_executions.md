+++
title = "google_vertex_ai_metadata_stores_executions resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_metadata_stores_executions"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores_executions Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_metadata_stores_executions` is used to test a Google MetadataStoresExecution resource

## Examples
```
    describe google_vertex_ai_metadata_stores_executions(parent: "projects/#{gcp_project_id}/locations/#{metadata_stores_execution['region']}/metadataStores/#{metadata_stores_execution['metadataStore']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_metadata_stores_executions` resource:

See [google_vertex_ai_metadata_stores_execution.md](google_vertex_ai_metadata_stores_execution.md) for more detailed information
  * `labels`: an array of `google_vertex_ai_metadata_stores_execution` labels
  * `create_times`: an array of `google_vertex_ai_metadata_stores_execution` create_time
  * `schema_versions`: an array of `google_vertex_ai_metadata_stores_execution` schema_version
  * `states`: an array of `google_vertex_ai_metadata_stores_execution` state
  * `names`: an array of `google_vertex_ai_metadata_stores_execution` name
  * `etags`: an array of `google_vertex_ai_metadata_stores_execution` etag
  * `display_names`: an array of `google_vertex_ai_metadata_stores_execution` display_name
  * `metadata`: an array of `google_vertex_ai_metadata_stores_execution` metadata
  * `schema_titles`: an array of `google_vertex_ai_metadata_stores_execution` schema_title
  * `descriptions`: an array of `google_vertex_ai_metadata_stores_execution` description
  * `update_times`: an array of `google_vertex_ai_metadata_stores_execution` update_time

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
