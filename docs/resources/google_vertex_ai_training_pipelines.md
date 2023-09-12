---
title: About the google_vertex_ai_training_pipelines resource
platform: gcp
---

## Syntax
A `google_vertex_ai_training_pipelines` is used to test a Google TrainingPipeline resource

## Examples
```
    describe google_vertex_ai_training_pipelines(parent: ' value_parent', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_training_pipelines` resource:

See [google_vertex_ai_training_pipeline.md](google_vertex_ai_training_pipeline.md) for more detailed information
  * `end_times`: an array of `google_vertex_ai_training_pipeline` end_time
  * `errors`: an array of `google_vertex_ai_training_pipeline` error
  * `display_names`: an array of `google_vertex_ai_training_pipeline` display_name
  * `names`: an array of `google_vertex_ai_training_pipeline` name
  * `input_data_configs`: an array of `google_vertex_ai_training_pipeline` input_data_config
  * `parent_models`: an array of `google_vertex_ai_training_pipeline` parent_model
  * `update_times`: an array of `google_vertex_ai_training_pipeline` update_time
  * `states`: an array of `google_vertex_ai_training_pipeline` state
  * `labels`: an array of `google_vertex_ai_training_pipeline` labels
  * `training_task_definitions`: an array of `google_vertex_ai_training_pipeline` training_task_definition
  * `start_times`: an array of `google_vertex_ai_training_pipeline` start_time
  * `create_times`: an array of `google_vertex_ai_training_pipeline` create_time
  * `training_task_metadata`: an array of `google_vertex_ai_training_pipeline` training_task_metadata
  * `training_task_inputs`: an array of `google_vertex_ai_training_pipeline` training_task_inputs
  * `model_ids`: an array of `google_vertex_ai_training_pipeline` model_id
  * `encryption_specs`: an array of `google_vertex_ai_training_pipeline` encryption_spec
  * `model_to_uploads`: an array of `google_vertex_ai_training_pipeline` model_to_upload

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
