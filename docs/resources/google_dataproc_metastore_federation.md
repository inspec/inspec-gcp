+++

title = "google_dataproc_metastore_federation Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_dataproc_metastore_federation"
identifier = "inspec/resources/gcp/google_dataproc_metastore_federation Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_metastore_federation` InSpec audit resource to test the properties of a test a Google Federation.

## Syntax
A `google_dataproc_metastore_federation` is used to test a Google Federation resource

## Examples
```
describe google_dataproc_metastore_federation(name: 'value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }
	its('update_time') { should cmp 'value_updatetime' }
	its('version') { should cmp 'value_version' }
	its('endpoint_uri') { should cmp 'value_endpointuri' }
	its('state') { should cmp 'value_state' }
	its('state_message') { should cmp 'value_statemessage' }
	its('uid') { should cmp 'value_uid' }
end

describe google_dataproc_metastore_federation(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_dataproc_metastore_federation` resource:

## Properties
Properties that can be accessed from the `google_dataproc_metastore_federation` resource:


  * `name`: Immutable. The relative resource name of the federation, of the form: projects/{project_number}/locations/{location_id}/federations/{federation_id}`.

  * `create_time`: Output only. The time when the metastore federation was created.

  * `update_time`: Output only. The time when the metastore federation was last updated.

  * `labels`: User-defined labels for the metastore federation.

    * `additional_properties`:

  * `version`: Immutable. The Apache Hive metastore version of the federation. All backend metastore versions must be compatible with the federation version.

  * `backend_metastores`: A map from BackendMetastore rank to BackendMetastores from which the federation service serves metadata at query time. The map key represents the order in which BackendMetastores should be evaluated to resolve database names at query time and should be greater than or equal to zero. A BackendMetastore with a lower number will be evaluated before a BackendMetastore with a higher number.

    * `additional_properties`: Represents a backend metastore for the federation.

  * `endpoint_uri`: Output only. The federation endpoint.

  * `state`: Output only. The current state of the federation.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * UPDATING
    * DELETING
    * ERROR

  * `state_message`: Output only. Additional information about the current state of the metastore federation, if available.

  * `uid`: Output only. The globally unique resource identifier of the metastore federation.


## GCP Permissions

Ensure the [Dataproc Metastore API](https://console.cloud.google.com/apis/library/metastore.googleapis.com) is enabled for the current project.
