+++
title = "google_vertex_ai_tensorboard_experiment_run resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_tensorboard_experiment_run"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboard_experiment_run Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_tensorboard_experiment_run` InSpec audit resource to to test a Google Cloud TensorboardExperimentRun resource.

## Examples

```ruby
describe google_vertex_ai_tensorboard_experiment_run(name: "projects/#{gcp_project_id}/locations/#{tensorboard_experiment_run['region']}/tensorboards/#{tensorboard_experiment_run['tensorboard']}/experiments/#{tensorboard_experiment_run['experiment']}/runs/#{tensorboard_experiment_run['run']}", region: ' value_region') do
	it { should exist }

end

describe google_vertex_ai_tensorboard_experiment_run(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_tensorboard_experiment_run` resource:


  * `display_name`: Required. User provided name of this TensorboardRun. This value must be unique among all TensorboardRuns belonging to the same parent TensorboardExperiment.

  * `update_time`: Output only. Timestamp when this TensorboardRun was last updated.

  * `description`: Description of this TensorboardRun.

  * `etag`: Used to perform a consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `labels`: The labels with user-defined metadata to organize your TensorboardRuns. This field will be used to filter and visualize Runs in the Tensorboard UI. For example, a Vertex AI training job can set a label aiplatform.googleapis.com/training_job_id=xxxxx to all the runs created within that job. An end user can set a label experiment_id=xxxxx for all the runs produced in a Jupyter notebook. These runs can be grouped by a label value and visualized together in the Tensorboard UI. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one TensorboardRun (System labels are excluded). See https://goo.gl/xmQnxf for more information and examples of labels. System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable.

    * `additional_properties`: 

  * `create_time`: Output only. Timestamp when this TensorboardRun was created.

  * `name`: Output only. Name of the TensorboardRun. Format: `projects/{project}/locations/{location}/tensorboards/{tensorboard}/experiments/{experiment}/runs/{run}`


## GCP permissions
