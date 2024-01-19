---
title: About the google_vertex_ai_tensorboard_experiment_run_time_series_resources resource
platform: gcp
---

## Syntax
A `google_vertex_ai_tensorboard_experiment_run_time_series_resources` is used to test a Google TensorboardExperimentRunTimeSeriesResource resource

## Examples
```
    describe google_vertex_ai_tensorboard_experiment_run_time_series_resources(parent: "projects/#{gcp_project_id}/locations/#{tensorboard_experiment_run_time_series_resource['region']}/tensorboards/#{tensorboard_experiment_run_time_series_resource['tensorboard']}/experiments/#{tensorboard_experiment_run_time_series_resource['experiment']}/runs/#{tensorboard_experiment_run_time_series_resource['run']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_tensorboard_experiment_run_time_series_resources` resource:

See [google_vertex_ai_tensorboard_experiment_run_time_series_resource.md](google_vertex_ai_tensorboard_experiment_run_time_series_resource.md) for more detailed information
  * `plugin_names`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` plugin_name
  * `plugin_data`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` plugin_data
  * `descriptions`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` description
  * `etags`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` etag
  * `display_names`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` display_name
  * `update_times`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` update_time
  * `create_times`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` create_time
  * `names`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` name
  * `metadata`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` metadata
  * `value_types`: an array of `google_vertex_ai_tensorboard_experiment_run_time_series_resource` value_type

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
