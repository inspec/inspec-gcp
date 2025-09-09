+++
title = "google_vertex_ai_tensorboard_experiment_run_time_series_resource resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_tensorboard_experiment_run_time_series_resource"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboard_experiment_run_time_series_resource Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_tensorboard_experiment_run_time_series_resource` InSpec audit resource to to test a Google Cloud TensorboardExperimentRunTimeSeriesResource resource.

## Examples

```ruby
describe google_vertex_ai_tensorboard_experiment_run_time_series_resource(name: "projects/#{gcp_project_id}/locations/#{tensorboard_experiment_run_time_series_resource['region']}/tensorboards/#{tensorboard_experiment_run_time_series_resource['tensorboard']}/experiments/#{tensorboard_experiment_run_time_series_resource['experiment']}/runs/#{tensorboard_experiment_run_time_series_resource['run']}/timeSeries/#{tensorboard_experiment_run_time_series_resource['timeSery']}", region: ' value_region') do
	it { should exist }
	its('plugin_name') { should cmp 'value_pluginname' }
	its('plugin_data') { should cmp 'value_plugindata' }
	its('description') { should cmp 'value_description' }
	its('etag') { should cmp 'value_etag' }
	its('display_name') { should cmp 'value_displayname' }
	its('update_time') { should cmp 'value_updatetime' }
	its('create_time') { should cmp 'value_createtime' }
	its('name') { should cmp 'value_name' }
	its('value_type') { should cmp 'value_valuetype' }

end

describe google_vertex_ai_tensorboard_experiment_run_time_series_resource(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_tensorboard_experiment_run_time_series_resource` resource:


  * `plugin_name`: Immutable. Name of the plugin this time series pertain to. Such as Scalar, Tensor, Blob

  * `plugin_data`: Data of the current plugin, with the size limited to 65KB.

  * `description`: Description of this TensorboardTimeSeries.

  * `etag`: Used to perform a consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `display_name`: Required. User provided name of this TensorboardTimeSeries. This value should be unique among all TensorboardTimeSeries resources belonging to the same TensorboardRun resource (parent resource).

  * `update_time`: Output only. Timestamp when this TensorboardTimeSeries was last updated.

  * `create_time`: Output only. Timestamp when this TensorboardTimeSeries was created.

  * `name`: Output only. Name of the TensorboardTimeSeries.

  * `metadata`: Output only. Scalar, Tensor, or Blob metadata for this TensorboardTimeSeries.

  * `value_type`: Required. Immutable. Type of TensorboardTimeSeries value.
  Possible values:
    * VALUE_TYPE_UNSPECIFIED
    * SCALAR
    * TENSOR
    * BLOB_SEQUENCE


## GCP permissions
