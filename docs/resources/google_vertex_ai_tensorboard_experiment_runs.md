+++
title = "google_vertex_ai_tensorboard_experiment_runs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_tensorboard_experiment_runs"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboard_experiment_runs Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_tensorboard_experiment_runs` is used to test a Google TensorboardExperimentRun resource

## Examples
```
    describe google_vertex_ai_tensorboard_experiment_runs(parent: "projects/#{gcp_project_id}/locations/#{tensorboard_experiment_run['region']}/tensorboards/#{tensorboard_experiment_run['tensorboard']}/experiments/#{tensorboard_experiment_run['experiment']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_tensorboard_experiment_runs` resource:

See [google_vertex_ai_tensorboard_experiment_run.md](google_vertex_ai_tensorboard_experiment_run.md) for more detailed information
  * `display_names`: an array of `google_vertex_ai_tensorboard_experiment_run` display_name
  * `update_times`: an array of `google_vertex_ai_tensorboard_experiment_run` update_time
  * `descriptions`: an array of `google_vertex_ai_tensorboard_experiment_run` description
  * `etags`: an array of `google_vertex_ai_tensorboard_experiment_run` etag
  * `labels`: an array of `google_vertex_ai_tensorboard_experiment_run` labels
  * `create_times`: an array of `google_vertex_ai_tensorboard_experiment_run` create_time
  * `names`: an array of `google_vertex_ai_tensorboard_experiment_run` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
