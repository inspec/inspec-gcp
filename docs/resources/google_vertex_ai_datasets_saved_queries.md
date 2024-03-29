---
title: About the google_vertex_ai_datasets_saved_queries resource
platform: gcp
---

## Syntax
A `google_vertex_ai_datasets_saved_queries` is used to test a Google DatasetsSavedQuery resource

## Examples
```
    describe google_vertex_ai_datasets_saved_queries(parent: "projects/#{gcp_project_id}/locations/#{datasets_saved_query['region']}/datasets/#{datasets_saved_query['dataset']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_datasets_saved_queries` resource:

See [google_vertex_ai_datasets_saved_query.md](google_vertex_ai_datasets_saved_query.md) for more detailed information
  * `annotation_spec_counts`: an array of `google_vertex_ai_datasets_saved_query` annotation_spec_count
  * `update_times`: an array of `google_vertex_ai_datasets_saved_query` update_time
  * `support_automl_trainings`: an array of `google_vertex_ai_datasets_saved_query` support_automl_training
  * `metadata`: an array of `google_vertex_ai_datasets_saved_query` metadata
  * `problem_types`: an array of `google_vertex_ai_datasets_saved_query` problem_type
  * `names`: an array of `google_vertex_ai_datasets_saved_query` name
  * `create_times`: an array of `google_vertex_ai_datasets_saved_query` create_time
  * `etags`: an array of `google_vertex_ai_datasets_saved_query` etag
  * `display_names`: an array of `google_vertex_ai_datasets_saved_query` display_name
  * `annotation_filters`: an array of `google_vertex_ai_datasets_saved_query` annotation_filter

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
