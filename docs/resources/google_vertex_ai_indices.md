---
title: About the google_vertex_ai_indices resource
platform: gcp
---

## Syntax
A `google_vertex_ai_indices` is used to test a Google Index resource

## Examples
```
    describe google_vertex_ai_indices(parent: "projects/#{gcp_project_id}/locations/#{index['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_indices` resource:

See [google_vertex_ai_index.md](google_vertex_ai_index.md) for more detailed information
  * `descriptions`: an array of `google_vertex_ai_index` description
  * `metadata`: an array of `google_vertex_ai_index` metadata
  * `index_stats`: an array of `google_vertex_ai_index` index_stats
  * `names`: an array of `google_vertex_ai_index` name
  * `deployed_indexes`: an array of `google_vertex_ai_index` deployed_indexes
  * `display_names`: an array of `google_vertex_ai_index` display_name
  * `metadata_schema_uris`: an array of `google_vertex_ai_index` metadata_schema_uri
  * `index_update_methods`: an array of `google_vertex_ai_index` index_update_method
  * `update_times`: an array of `google_vertex_ai_index` update_time
  * `create_times`: an array of `google_vertex_ai_index` create_time
  * `etags`: an array of `google_vertex_ai_index` etag
  * `labels`: an array of `google_vertex_ai_index` labels

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
