+++
title = "google_vertex_ai_tensorboard_experiment_run_time_series_resources resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_tensorboard_experiment_run_time_series_resources"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboard_experiment_run_time_series_resources resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_tensorboard_experiment_run_time_series_resources` InSpec audit resource to to test a Google Cloud TensorboardExperimentRunTimeSeriesResource resource.

## Examples

```ruby
    describe google_vertex_ai_tensorboard_experiment_run_time_series_resources(parent: "projects/#{gcp_project_id}/locations/#{tensorboard_experiment_run_time_series_resource['region']}/tensorboards/#{tensorboard_experiment_run_time_series_resource['tensorboard']}/experiments/#{tensorboard_experiment_run_time_series_resource['experiment']}/runs/#{tensorboard_experiment_run_time_series_resource['run']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_tensorboard_experiment_run_time_series_resources` resource:

See [google_vertex_ai_tensorboard_experiment_run_time_series_resource](google_vertex_ai_tensorboard_experiment_run_time_series_resource) for more detailed information.

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

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
