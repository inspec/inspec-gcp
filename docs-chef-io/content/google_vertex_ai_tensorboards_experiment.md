+++
title = "google_vertex_ai_tensorboards_experiment resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_tensorboards_experiment"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboards_experiment resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_tensorboards_experiment` InSpec audit resource to to test a Google Cloud TensorboardsExperiment resource.

## Examples

```ruby
describe google_vertex_ai_tensorboards_experiment(name: "projects/#{gcp_project_id}/locations/#{tensorboards_experiment['region']}/tensorboards/#{tensorboards_experiment['tensorboard']}/experiments/#{tensorboards_experiment['name']}", region: ' value_region') do
	it { should exist }
	its('description') { should cmp 'value_description' }
	its('source') { should cmp 'value_source' }
	its('display_name') { should cmp 'value_displayname' }
	its('create_time') { should cmp 'value_createtime' }
	its('update_time') { should cmp 'value_updatetime' }
	its('name') { should cmp 'value_name' }
	its('etag') { should cmp 'value_etag' }

end

describe google_vertex_ai_tensorboards_experiment(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_tensorboards_experiment` resource:


  * `description`: Description of this TensorboardExperiment.

  * `source`: Immutable. Source of the TensorboardExperiment. Example: a custom training job.

  * `display_name`: User provided name of this TensorboardExperiment.

  * `create_time`: Output only. Timestamp when this TensorboardExperiment was created.

  * `update_time`: Output only. Timestamp when this TensorboardExperiment was last updated.

  * `labels`: The labels with user-defined metadata to organize your TensorboardExperiment. Label keys and values cannot be longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Dataset (System labels are excluded). See https://goo.gl/xmQnxf for more information and examples of labels. System reserved label keys are prefixed with `aiplatform.googleapis.com/` and are immutable. The following system labels exist for each Dataset: * `aiplatform.googleapis.com/dataset_metadata_schema`: output only. Its value is the metadata_schema's title.

    * `additional_properties`: 

  * `name`: Output only. Name of the TensorboardExperiment. Format: `projects/{project}/locations/{location}/tensorboards/{tensorboard}/experiments/{experiment}`

  * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.


## GCP permissions
