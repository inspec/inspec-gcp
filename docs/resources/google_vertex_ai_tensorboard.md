+++
title = "google_vertex_ai_tensorboard resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_tensorboard"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboard Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_tensorboard` is used to test a Google Tensorboard resource

## Examples
```
describe google_vertex_ai_tensorboard(name: "projects/#{gcp_project_id}/locations/#{tensorboard['region']}/tensorboards/#{tensorboard['name']}", region: ' value_region') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('update_time') { should cmp 'value_updatetime' }
	its('blob_storage_path_prefix') { should cmp 'value_blobstoragepathprefix' }
	its('etag') { should cmp 'value_etag' }
	its('create_time') { should cmp 'value_createtime' }
	its('display_name') { should cmp 'value_displayname' }
	its('description') { should cmp 'value_description' }

end

describe google_vertex_ai_tensorboard(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_tensorboard` resource:


  * `name`: Output only. Name of the Tensorboard. Format: `projects/{project}/locations/{location}/tensorboards/{tensorboard}`

  * `is_default`: Used to indicate if the TensorBoard instance is the default one. Each project & region can have at most one default TensorBoard instance. Creation of a default TensorBoard instance and updating an existing TensorBoard instance to be default will mark all other TensorBoard instances (if any) as non default.

  * `update_time`: Output only. Timestamp when this Tensorboard was last updated.

  * `labels`: The labels with user-defined metadata to organize your Tensorboards. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Tensorboard (System labels are excluded). See https://goo.gl/xmQnxf for more information and examples of labels. System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable.

    * `additional_properties`: 

  * `blob_storage_path_prefix`: Output only. Consumer project Cloud Storage path prefix used to store blob data, which can either be a bucket or directory. Does not end with a '/'.

  * `etag`: Used to perform a consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `create_time`: Output only. Timestamp when this Tensorboard was created.

  * `run_count`: Output only. The number of Runs stored in this Tensorboard.

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `display_name`: Required. User provided name of this Tensorboard.

  * `description`: Description of this Tensorboard.


## GCP Permissions
