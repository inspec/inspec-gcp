+++
title = "google_dataproc_batches resource"

draft = false



[menu.gcp]
title = "google_dataproc_batches"
identifier = "inspec/resources/gcp/google_dataproc_batches resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_batches` InSpec audit resource to test the properties of a Google Cloud Batch resource.

## Examples

```ruby
  describe google_dataproc_batches(parent: 'projects/*/locations/*') do
    it { should exist }
    its('names') { should include 'value_name' }
    its('uuids') { should include 'value_uuid' }
    its('create_times') { should include 'value_createtime' }
    its('states') { should include 'value_state' }
    its('state_messages') { should include 'value_statemessage' }
    its('state_times') { should include 'value_statetime' }
    its('creators') { should include 'value_creator' }
    its('operations') { should include 'value_operation' }
  end
```

## Parameters

Parameters that can be accessed from the `google_dataproc_batches` resource:

See [google_dataproc_batch](google_dataproc_batch) for more detailed information.

* `names`: an array of `google_dataproc_batch` name
* `uuids`: an array of `google_dataproc_batch` uuid
* `create_times`: an array of `google_dataproc_batch` create_time
* `pyspark_batches`: an array of `google_dataproc_batch` pyspark_batch
* `spark_batches`: an array of `google_dataproc_batch` spark_batch
* `spark_r_batches`: an array of `google_dataproc_batch` spark_r_batch
* `spark_sql_batches`: an array of `google_dataproc_batch` spark_sql_batch
* `runtime_infos`: an array of `google_dataproc_batch` runtime_info
* `states`: an array of `google_dataproc_batch` state
* `state_messages`: an array of `google_dataproc_batch` state_message
* `state_times`: an array of `google_dataproc_batch` state_time
* `creators`: an array of `google_dataproc_batch` creator
* `labels`: an array of `google_dataproc_batch` labels
* `runtime_configs`: an array of `google_dataproc_batch` runtime_config
* `environment_configs`: an array of `google_dataproc_batch` environment_config
* `operations`: an array of `google_dataproc_batch` operation
* `state_histories`: an array of `google_dataproc_batch` state_history

## Properties

Properties that can be accessed from the `google_dataproc_batches` resource:

See [google_dataproc_batch](google_dataproc_batch) for more detailed information.

* `names`: an array of `google_dataproc_batch` name
* `uuids`: an array of `google_dataproc_batch` uuid
* `create_times`: an array of `google_dataproc_batch` create_time
* `pyspark_batches`: an array of `google_dataproc_batch` pyspark_batch
* `spark_batches`: an array of `google_dataproc_batch` spark_batch
* `spark_r_batches`: an array of `google_dataproc_batch` spark_r_batch
* `spark_sql_batches`: an array of `google_dataproc_batch` spark_sql_batch
* `runtime_infos`: an array of `google_dataproc_batch` runtime_info
* `states`: an array of `google_dataproc_batch` state
* `state_messages`: an array of `google_dataproc_batch` state_message
* `state_times`: an array of `google_dataproc_batch` state_time
* `creators`: an array of `google_dataproc_batch` creator
* `labels`: an array of `google_dataproc_batch` labels
* `runtime_configs`: an array of `google_dataproc_batch` runtime_config
* `environment_configs`: an array of `google_dataproc_batch` environment_config
* `operations`: an array of `google_dataproc_batch` operation
* `state_histories`: an array of `google_dataproc_batch` state_history

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
