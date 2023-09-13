---
title: About the google_vertex_ai_data_labeling_jobs resource
platform: gcp
---

## Syntax
A `google_vertex_ai_data_labeling_jobs` is used to test a Google DataLabelingJob resource

## Examples
```
    describe google_vertex_ai_data_labeling_jobs(parent: "projects/#{gcp_project_id}/locations/#{data_labeling_job['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_data_labeling_jobs` resource:

See [google_vertex_ai_data_labeling_job.md](google_vertex_ai_data_labeling_job.md) for more detailed information
  * `labeling_progresses`: an array of `google_vertex_ai_data_labeling_job` labeling_progress
  * `create_times`: an array of `google_vertex_ai_data_labeling_job` create_time
  * `encryption_specs`: an array of `google_vertex_ai_data_labeling_job` encryption_spec
  * `inputs_schema_uris`: an array of `google_vertex_ai_data_labeling_job` inputs_schema_uri
  * `labeler_counts`: an array of `google_vertex_ai_data_labeling_job` labeler_count
  * `errors`: an array of `google_vertex_ai_data_labeling_job` error
  * `inputs`: an array of `google_vertex_ai_data_labeling_job` inputs
  * `instruction_uris`: an array of `google_vertex_ai_data_labeling_job` instruction_uri
  * `update_times`: an array of `google_vertex_ai_data_labeling_job` update_time
  * `annotation_labels`: an array of `google_vertex_ai_data_labeling_job` annotation_labels
  * `names`: an array of `google_vertex_ai_data_labeling_job` name
  * `current_spends`: an array of `google_vertex_ai_data_labeling_job` current_spend
  * `specialist_pools`: an array of `google_vertex_ai_data_labeling_job` specialist_pools
  * `display_names`: an array of `google_vertex_ai_data_labeling_job` display_name
  * `states`: an array of `google_vertex_ai_data_labeling_job` state
  * `datasets`: an array of `google_vertex_ai_data_labeling_job` datasets
  * `labels`: an array of `google_vertex_ai_data_labeling_job` labels
  * `active_learning_configs`: an array of `google_vertex_ai_data_labeling_job` active_learning_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
