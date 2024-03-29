---
title: About the google_vertex_ai_tensorboards_experiments resource
platform: gcp
---

## Syntax
A `google_vertex_ai_tensorboards_experiments` is used to test a Google TensorboardsExperiment resource

## Examples
```
    describe google_vertex_ai_tensorboards_experiments(parent: "projects/#{gcp_project_id}/locations/#{tensorboards_experiment['region']}/tensorboards/#{tensorboards_experiment['tensorboard']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_tensorboards_experiments` resource:

See [google_vertex_ai_tensorboards_experiment.md](google_vertex_ai_tensorboards_experiment.md) for more detailed information
  * `descriptions`: an array of `google_vertex_ai_tensorboards_experiment` description
  * `sources`: an array of `google_vertex_ai_tensorboards_experiment` source
  * `display_names`: an array of `google_vertex_ai_tensorboards_experiment` display_name
  * `create_times`: an array of `google_vertex_ai_tensorboards_experiment` create_time
  * `update_times`: an array of `google_vertex_ai_tensorboards_experiment` update_time
  * `labels`: an array of `google_vertex_ai_tensorboards_experiment` labels
  * `names`: an array of `google_vertex_ai_tensorboards_experiment` name
  * `etags`: an array of `google_vertex_ai_tensorboards_experiment` etag

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
