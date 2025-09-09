+++
title = "google_vertex_ai_nas_jobs_nas_trial_detail resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_nas_jobs_nas_trial_detail"
identifier = "inspec/resources/gcp/google_vertex_ai_nas_jobs_nas_trial_detail Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_nas_jobs_nas_trial_detail` InSpec audit resource to to test a Google Cloud NasJobsNasTrialDetail resource.

## Examples

```ruby
describe google_vertex_ai_nas_jobs_nas_trial_detail(name: "projects/#{gcp_project_id}/locations/#{nas_jobs_nas_trial_detail['region']}/nasJobs/#{nas_jobs_nas_trial_detail['nasJob']}/nasTrialDetails/#{nas_jobs_nas_trial_detail['name']}", region: ' value_region') do
	it { should exist }
	its('parameters') { should cmp 'value_parameters' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_nas_jobs_nas_trial_detail(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_nas_jobs_nas_trial_detail` resource:


  * `parameters`: The parameters for the NasJob NasTrial.

  * `name`: Output only. Resource name of the NasTrialDetail.

  * `search_trial`: Represents a uCAIP NasJob trial.

    * `id`: Output only. The identifier of the NasTrial assigned by the service.

    * `state`: Output only. The detailed state of the NasTrial.
    Possible values:
      * STATE_UNSPECIFIED
      * REQUESTED
      * ACTIVE
      * STOPPING
      * SUCCEEDED
      * INFEASIBLE

    * `final_measurement`: A message representing a Measurement of a Trial. A Measurement contains the Metrics got by executing a Trial using suggested hyperparameter values.

      * `metrics`: Output only. A list of metrics got by evaluating the objective functions using suggested Parameter values.

        * `metric_id`: Output only. The ID of the Metric. The Metric should be defined in StudySpec's Metrics.

        * `value`: Output only. The value for this metric.

      * `elapsed_duration`: Output only. Time that the Trial has been running at the point of this Measurement.

      * `step_count`: Output only. The number of steps the machine learning model has been trained for. Must be non-negative.

    * `start_time`: Output only. Time when the NasTrial was started.

    * `end_time`: Output only. Time when the NasTrial's status changed to `SUCCEEDED` or `INFEASIBLE`.

  * `train_trial`: Represents a uCAIP NasJob trial.

    * `id`: Output only. The identifier of the NasTrial assigned by the service.

    * `state`: Output only. The detailed state of the NasTrial.
    Possible values:
      * STATE_UNSPECIFIED
      * REQUESTED
      * ACTIVE
      * STOPPING
      * SUCCEEDED
      * INFEASIBLE

    * `final_measurement`: A message representing a Measurement of a Trial. A Measurement contains the Metrics got by executing a Trial using suggested hyperparameter values.

      * `metrics`: Output only. A list of metrics got by evaluating the objective functions using suggested Parameter values.

        * `metric_id`: Output only. The ID of the Metric. The Metric should be defined in StudySpec's Metrics.

        * `value`: Output only. The value for this metric.

      * `elapsed_duration`: Output only. Time that the Trial has been running at the point of this Measurement.

      * `step_count`: Output only. The number of steps the machine learning model has been trained for. Must be non-negative.

    * `start_time`: Output only. Time when the NasTrial was started.

    * `end_time`: Output only. Time when the NasTrial's status changed to `SUCCEEDED` or `INFEASIBLE`.


## GCP permissions
