+++
title = "google_dataproc_metastore_service_backups Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_dataproc_metastore_service_backups"
identifier = "inspec/resources/gcp/google_dataproc_metastore_service_backups Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_metastore_service_backups` InSpec audit resource to test the properties of a Google Cloud ServiceBackup resource.

## Examples

```ruby
  describe google_dataproc_metastore_service_backups(parent: ' value_parent') do
    it { should exist }
    its('names') { should include 'value_name' }
    its('create_times') { should include 'value_createtime' }
    its('end_times') { should include 'value_endtime' }
    its('states') { should include 'value_state' }
    its('descriptions') { should include 'value_description' }
  end
```

## Parameters

Parameters that can be accessed from the `google_dataproc_metastore_service_backups` resource:

See [google_dataproc_metastore_service_backup](google_dataproc_metastore_service_backup) for more detailed information.

* `names`: an array of `google_dataproc_metastore_service_backup` name
* `create_times`: an array of `google_dataproc_metastore_service_backup` create_time
* `end_times`: an array of `google_dataproc_metastore_service_backup` end_time
* `states`: an array of `google_dataproc_metastore_service_backup` state
* `service_revisions`: an array of `google_dataproc_metastore_service_backup` service_revision
* `descriptions`: an array of `google_dataproc_metastore_service_backup` description
* `restoring_services`: an array of `google_dataproc_metastore_service_backup` restoring_services

## Properties

Properties that can be accessed from the `google_dataproc_metastore_service_backups` resource:

See [google_dataproc_metastore_service_backup](google_dataproc_metastore_service_backup) for more detailed information.

* `names`: an array of `google_dataproc_metastore_service_backup` name
* `create_times`: an array of `google_dataproc_metastore_service_backup` create_time
* `end_times`: an array of `google_dataproc_metastore_service_backup` end_time
* `states`: an array of `google_dataproc_metastore_service_backup` state
* `service_revisions`: an array of `google_dataproc_metastore_service_backup` service_revision
* `descriptions`: an array of `google_dataproc_metastore_service_backup` description
* `restoring_services`: an array of `google_dataproc_metastore_service_backup` restoring_services

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Dataproc Metastore API](https://console.cloud.google.com/apis/library/metastore.googleapis.com) is enabled for the current project.
