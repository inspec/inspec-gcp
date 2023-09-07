---
title: About the google_vertex_ai_datasets resource
platform: gcp
---

## Syntax
A `google_vertex_ai_datasets` is used to test a Google Dataset resource

## Examples
```
    describe google_vertex_ai_dataset(parent: ' ') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_datasets` resource:

See [google_vertex_ai_dataset.md](google_vertex_ai_dataset.md) for more detailed information
  * `saved_queries`: an array of `google_vertex_ai_dataset` saved_queries
  * `create_times`: an array of `google_vertex_ai_dataset` create_time
  * `encryption_specs`: an array of `google_vertex_ai_dataset` encryption_spec
  * `names`: an array of `google_vertex_ai_dataset` name
  * `metadata`: an array of `google_vertex_ai_dataset` metadata
  * `etags`: an array of `google_vertex_ai_dataset` etag
  * `descriptions`: an array of `google_vertex_ai_dataset` description
  * `labels`: an array of `google_vertex_ai_dataset` labels
  * `metadata_schema_uris`: an array of `google_vertex_ai_dataset` metadata_schema_uri
  * `metadata_artifacts`: an array of `google_vertex_ai_dataset` metadata_artifact
  * `update_times`: an array of `google_vertex_ai_dataset` update_time
  * `data_item_counts`: an array of `google_vertex_ai_dataset` data_item_count
  * `display_names`: an array of `google_vertex_ai_dataset` display_name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
