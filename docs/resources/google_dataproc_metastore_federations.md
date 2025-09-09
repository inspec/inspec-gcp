+++
title = "google_dataproc_metastore_federations Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_dataproc_metastore_federations"
identifier = "inspec/resources/gcp/google_dataproc_metastore_federations Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_metastore_federations` InSpec audit resource to test the properties of a Google Cloud Federation resource.

## Examples

```ruby
  describe google_dataproc_metastore_federations(parent: 'value_parent') do
    it { should exist }
    its('names') { should include 'value_name' }
    its('create_times') { should include 'value_createtime' }
    its('update_times') { should include 'value_updatetime' }
    its('versions') { should include 'value_version' }
    its('endpoint_uris') { should include 'value_endpointuri' }
    its('states') { should include 'value_state' }
    its('state_messages') { should include 'value_statemessage' }
    its('uids') { should include 'value_uid' }
  end
```

## Parameters

Parameters that can be accessed from the `google_dataproc_metastore_federations` resource:

See [google_dataproc_metastore_federation](google_dataproc_metastore_federation) for more detailed information.

* `names`: an array of `google_dataproc_metastore_federation` name
* `create_times`: an array of `google_dataproc_metastore_federation` create_time
* `update_times`: an array of `google_dataproc_metastore_federation` update_time
* `labels`: an array of `google_dataproc_metastore_federation` labels
* `versions`: an array of `google_dataproc_metastore_federation` version
* `backend_metastores`: an array of `google_dataproc_metastore_federation` backend_metastores
* `endpoint_uris`: an array of `google_dataproc_metastore_federation` endpoint_uri
* `states`: an array of `google_dataproc_metastore_federation` state
* `state_messages`: an array of `google_dataproc_metastore_federation` state_message
* `uids`: an array of `google_dataproc_metastore_federation` uid

## Properties

Properties that can be accessed from the `google_dataproc_metastore_federations` resource:

See [google_dataproc_metastore_federation](google_dataproc_metastore_federation) for more detailed information.

* `names`: an array of `google_dataproc_metastore_federation` name
* `create_times`: an array of `google_dataproc_metastore_federation` create_time
* `update_times`: an array of `google_dataproc_metastore_federation` update_time
* `labels`: an array of `google_dataproc_metastore_federation` labels
* `versions`: an array of `google_dataproc_metastore_federation` version
* `backend_metastores`: an array of `google_dataproc_metastore_federation` backend_metastores
* `endpoint_uris`: an array of `google_dataproc_metastore_federation` endpoint_uri
* `states`: an array of `google_dataproc_metastore_federation` state
* `state_messages`: an array of `google_dataproc_metastore_federation` state_message
* `uids`: an array of `google_dataproc_metastore_federation` uid

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Dataproc Metastore API](https://console.cloud.google.com/apis/library/metastore.googleapis.com) is enabled for the current project.
