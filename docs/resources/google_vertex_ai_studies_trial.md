+++
title = "google_vertex_ai_studies_trial resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_studies_trial"
identifier = "inspec/resources/gcp/google_vertex_ai_studies_trial Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_studies_trial` is used to test a Google StudiesTrial resource

## Examples
```
describe google_vertex_ai_studies_trial(name: "projects/#{gcp_project_id}/locations/#{studies_trial['region']}/studies/#{studies_trial['study']}/trials/#{studies_trial['name']}", region: ' value_region') do
	it { should exist }
	its('start_time') { should cmp 'value_starttime' }
	its('end_time') { should cmp 'value_endtime' }
	its('name') { should cmp 'value_name' }
	its('infeasible_reason') { should cmp 'value_infeasiblereason' }
	its('client_id') { should cmp 'value_clientid' }
	its('custom_job') { should cmp 'value_customjob' }
	its('state') { should cmp 'value_state' }
	its('id') { should cmp 'value_id' }

end

describe google_vertex_ai_studies_trial(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_studies_trial` resource:


  * `measurements`: Output only. A list of measurements that are strictly lexicographically ordered by their induced tuples (steps, elapsed_duration). These are used for early stopping computations.

    * `metrics`: Output only. A list of metrics got by evaluating the objective functions using suggested Parameter values.

      * `metric_id`: Output only. The ID of the Metric. The Metric should be defined in StudySpec's Metrics.

      * `value`: Output only. The value for this metric.

    * `elapsed_duration`: Output only. Time that the Trial has been running at the point of this Measurement.

    * `step_count`: Output only. The number of steps the machine learning model has been trained for. Must be non-negative.

  * `start_time`: Output only. Time when the Trial was started.

  * `end_time`: Output only. Time when the Trial's status changed to `SUCCEEDED` or `INFEASIBLE`.

  * `parameters`: Output only. The parameters of the Trial.

    * `value`: Output only. The value of the parameter. `number_value` will be set if a parameter defined in StudySpec is in type 'INTEGER', 'DOUBLE' or 'DISCRETE'. `string_value` will be set if a parameter defined in StudySpec is in type 'CATEGORICAL'.

    * `parameter_id`: Output only. The ID of the parameter. The parameter should be defined in StudySpec's Parameters.

  * `name`: Output only. Resource name of the Trial assigned by the service.

  * `infeasible_reason`: Output only. A human readable string describing why the Trial is infeasible. This is set only if Trial state is `INFEASIBLE`.

  * `final_measurement`: A message representing a Measurement of a Trial. A Measurement contains the Metrics got by executing a Trial using suggested hyperparameter values.

    * `metrics`: Output only. A list of metrics got by evaluating the objective functions using suggested Parameter values.

      * `metric_id`: Output only. The ID of the Metric. The Metric should be defined in StudySpec's Metrics.

      * `value`: Output only. The value for this metric.

    * `elapsed_duration`: Output only. Time that the Trial has been running at the point of this Measurement.

    * `step_count`: Output only. The number of steps the machine learning model has been trained for. Must be non-negative.

  * `client_id`: Output only. The identifier of the client that originally requested this Trial. Each client is identified by a unique client_id. When a client asks for a suggestion, Vertex AI Vizier will assign it a Trial. The client should evaluate the Trial, complete it, and report back to Vertex AI Vizier. If suggestion is asked again by same client_id before the Trial is completed, the same Trial will be returned. Multiple clients with different client_ids can ask for suggestions simultaneously, each of them will get their own Trial.

  * `custom_job`: Output only. The CustomJob name linked to the Trial. It's set for a HyperparameterTuningJob's Trial.

  * `state`: Output only. The detailed state of the Trial.
  Possible values:
    * STATE_UNSPECIFIED
    * REQUESTED
    * ACTIVE
    * STOPPING
    * SUCCEEDED
    * INFEASIBLE

  * `web_access_uris`: Output only. URIs for accessing [interactive shells](https://cloud.google.com/vertex-ai/docs/training/monitor-debug-interactive-shell) (one URI for each training node). Only available if this trial is part of a HyperparameterTuningJob and the job's trial_job_spec.enable_web_access field is `true`. The keys are names of each node used for the trial; for example, `workerpool0-0` for the primary node, `workerpool1-0` for the first node in the second worker pool, and `workerpool1-1` for the second node in the second worker pool. The values are the URIs for each node's interactive shell.

    * `additional_properties`: 

  * `id`: Output only. The identifier of the Trial assigned by the service.


## GCP Permissions
