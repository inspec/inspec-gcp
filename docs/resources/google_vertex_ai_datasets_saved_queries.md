+++
title = "google_vertex_ai_datasets_saved_queries resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_datasets_saved_queries"
identifier = "inspec/resources/gcp/google_vertex_ai_datasets_saved_queries Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_datasets_saved_queries` InSpec audit resource to to test a Google Cloud DatasetsSavedQuery resource.

## Examples

```ruby
    describe google_vertex_ai_datasets_saved_queries(parent: "projects/#{gcp_project_id}/locations/#{datasets_saved_query['region']}/datasets/#{datasets_saved_query['dataset']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_datasets_saved_queries` resource:

See [google_vertex_ai_datasets_saved_query](google_vertex_ai_datasets_saved_query) for more detailed information.

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

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
