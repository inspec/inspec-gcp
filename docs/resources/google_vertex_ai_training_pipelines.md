+++
title = "google_vertex_ai_training_pipelines resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_training_pipelines"
identifier = "inspec/resources/gcp/google_vertex_ai_training_pipelines Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_training_pipelines` InSpec audit resource to to test a Google Cloud TrainingPipeline resource.

## Examples

```ruby
    describe google_vertex_ai_training_pipelines(parent: "projects/#{gcp_project_id}/locations/#{training_pipeline['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_training_pipelines` resource:

See [google_vertex_ai_training_pipeline](google_vertex_ai_training_pipeline) for more detailed information.

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

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
