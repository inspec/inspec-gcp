+++
title = "google_vertex_ai_hyperparameter_tuning_job resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_hyperparameter_tuning_job"
identifier = "inspec/resources/gcp/google_vertex_ai_hyperparameter_tuning_job resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_hyperparameter_tuning_job` InSpec audit resource to to test a Google Cloud HyperparameterTuningJob resource.

## Examples

```ruby
describe google_vertex_ai_hyperparameter_tuning_job(name: "projects/#{gcp_project_id}/locations/#{hyperparameter_tuning_job['region']}/hyperparameterTuningJobs/#{hyperparameter_tuning_job['name']}", region: ' value_region') do
	it { should exist }
	its('state') { should cmp 'value_state' }
	its('end_time') { should cmp 'value_endtime' }
	its('update_time') { should cmp 'value_updatetime' }
	its('start_time') { should cmp 'value_starttime' }
	its('create_time') { should cmp 'value_createtime' }
	its('display_name') { should cmp 'value_displayname' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_hyperparameter_tuning_job(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_hyperparameter_tuning_job` resource:


  * `study_spec`: Required. Study configuration of the HyperparameterTuningJob.

  * `trials`: Output only. Trials of the HyperparameterTuningJob.

  * `state`: Output only. The detailed state of the job.
  Possible values:
    * JOB_STATE_UNSPECIFIED
    * JOB_STATE_QUEUED
    * JOB_STATE_PENDING
    * JOB_STATE_RUNNING
    * JOB_STATE_SUCCEEDED
    * JOB_STATE_FAILED
    * JOB_STATE_CANCELLING
    * JOB_STATE_CANCELLED
    * JOB_STATE_PAUSED
    * JOB_STATE_EXPIRED
    * JOB_STATE_UPDATING
    * JOB_STATE_PARTIALLY_SUCCEEDED

  * `max_failed_trial_count`: The number of failed Trials that need to be seen before failing the HyperparameterTuningJob. If set to 0, Vertex AI decides how many Trials must fail before the whole job fails.

  * `encryption_spec`: Customer-managed encryption key options for a HyperparameterTuningJob. If this is set, then all resources created by the HyperparameterTuningJob will be encrypted with the provided encryption key.

  * `error`: Output only. Only populated when job's state is JOB_STATE_FAILED or JOB_STATE_CANCELLED.

  * `end_time`: Output only. Time when the HyperparameterTuningJob entered any of the following states: `JOB_STATE_SUCCEEDED`, `JOB_STATE_FAILED`, `JOB_STATE_CANCELLED`.

  * `update_time`: Output only. Time when the HyperparameterTuningJob was most recently updated.

  * `start_time`: Output only. Time when the HyperparameterTuningJob for the first time entered the `JOB_STATE_RUNNING` state.

  * `labels`: The labels with user-defined metadata to organize HyperparameterTuningJobs. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `create_time`: Output only. Time when the HyperparameterTuningJob was created.

  * `parallel_trial_count`: Required. The desired number of Trials to run in parallel.

  * `trial_job_spec`: Required. The spec of a trial job. The same spec applies to the CustomJobs created in all the trials.

  * `max_trial_count`: Required. The desired total number of Trials.

  * `display_name`: Required. The display name of the HyperparameterTuningJob. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `name`: Output only. Resource name of the HyperparameterTuningJob.


## GCP permissions
