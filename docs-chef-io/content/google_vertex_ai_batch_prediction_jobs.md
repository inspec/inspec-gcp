+++
title = "google_vertex_ai_batch_prediction_jobs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_batch_prediction_jobs"
identifier = "inspec/resources/gcp/google_vertex_ai_batch_prediction_jobs resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_batch_prediction_jobs` InSpec audit resource to to test a Google Cloud BatchPredictionJob resource.

## Examples

```ruby
    describe google_vertex_ai_batch_prediction_jobs(parent: ' value_parent', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_batch_prediction_jobs` resource:

See [google_vertex_ai_batch_prediction_job](google_vertex_ai_batch_prediction_job) for more detailed information.

  * `create_times`: an array of `google_vertex_ai_batch_prediction_job` create_time
  * `model_parameters`: an array of `google_vertex_ai_batch_prediction_job` model_parameters
  * `instance_configs`: an array of `google_vertex_ai_batch_prediction_job` instance_config
  * `model_version_ids`: an array of `google_vertex_ai_batch_prediction_job` model_version_id
  * `dedicated_resources`: an array of `google_vertex_ai_batch_prediction_job` dedicated_resources
  * `output_infos`: an array of `google_vertex_ai_batch_prediction_job` output_info
  * `disable_container_loggings`: an array of `google_vertex_ai_batch_prediction_job` disable_container_logging
  * `explanation_specs`: an array of `google_vertex_ai_batch_prediction_job` explanation_spec
  * `end_times`: an array of `google_vertex_ai_batch_prediction_job` end_time
  * `generate_explanations`: an array of `google_vertex_ai_batch_prediction_job` generate_explanation
  * `resources_consumeds`: an array of `google_vertex_ai_batch_prediction_job` resources_consumed
  * `errors`: an array of `google_vertex_ai_batch_prediction_job` error
  * `input_configs`: an array of `google_vertex_ai_batch_prediction_job` input_config
  * `unmanaged_container_models`: an array of `google_vertex_ai_batch_prediction_job` unmanaged_container_model
  * `completion_stats`: an array of `google_vertex_ai_batch_prediction_job` completion_stats
  * `start_times`: an array of `google_vertex_ai_batch_prediction_job` start_time
  * `manual_batch_tuning_parameters`: an array of `google_vertex_ai_batch_prediction_job` manual_batch_tuning_parameters
  * `update_times`: an array of `google_vertex_ai_batch_prediction_job` update_time
  * `names`: an array of `google_vertex_ai_batch_prediction_job` name
  * `labels`: an array of `google_vertex_ai_batch_prediction_job` labels
  * `states`: an array of `google_vertex_ai_batch_prediction_job` state
  * `encryption_specs`: an array of `google_vertex_ai_batch_prediction_job` encryption_spec
  * `partial_failures`: an array of `google_vertex_ai_batch_prediction_job` partial_failures
  * `models`: an array of `google_vertex_ai_batch_prediction_job` model
  * `output_configs`: an array of `google_vertex_ai_batch_prediction_job` output_config
  * `display_names`: an array of `google_vertex_ai_batch_prediction_job` display_name
  * `service_accounts`: an array of `google_vertex_ai_batch_prediction_job` service_account

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
