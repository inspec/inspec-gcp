---
title: About the google_vertex_ai_hyperparameter_tuning_jobs resource
platform: gcp
---

## Syntax
A `google_vertex_ai_hyperparameter_tuning_jobs` is used to test a Google HyperparameterTuningJob resource

## Examples
```
    describe google_vertex_ai_hyperparameter_tuning_jobs(parent: "projects/#{gcp_project_id}/locations/#{hyperparameter_tuning_job['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_hyperparameter_tuning_jobs` resource:

See [google_vertex_ai_hyperparameter_tuning_job.md](google_vertex_ai_hyperparameter_tuning_job.md) for more detailed information
  * `study_specs`: an array of `google_vertex_ai_hyperparameter_tuning_job` study_spec
  * `trials`: an array of `google_vertex_ai_hyperparameter_tuning_job` trials
  * `states`: an array of `google_vertex_ai_hyperparameter_tuning_job` state
  * `max_failed_trial_counts`: an array of `google_vertex_ai_hyperparameter_tuning_job` max_failed_trial_count
  * `encryption_specs`: an array of `google_vertex_ai_hyperparameter_tuning_job` encryption_spec
  * `errors`: an array of `google_vertex_ai_hyperparameter_tuning_job` error
  * `end_times`: an array of `google_vertex_ai_hyperparameter_tuning_job` end_time
  * `update_times`: an array of `google_vertex_ai_hyperparameter_tuning_job` update_time
  * `start_times`: an array of `google_vertex_ai_hyperparameter_tuning_job` start_time
  * `labels`: an array of `google_vertex_ai_hyperparameter_tuning_job` labels
  * `create_times`: an array of `google_vertex_ai_hyperparameter_tuning_job` create_time
  * `parallel_trial_counts`: an array of `google_vertex_ai_hyperparameter_tuning_job` parallel_trial_count
  * `trial_job_specs`: an array of `google_vertex_ai_hyperparameter_tuning_job` trial_job_spec
  * `max_trial_counts`: an array of `google_vertex_ai_hyperparameter_tuning_job` max_trial_count
  * `display_names`: an array of `google_vertex_ai_hyperparameter_tuning_job` display_name
  * `names`: an array of `google_vertex_ai_hyperparameter_tuning_job` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
