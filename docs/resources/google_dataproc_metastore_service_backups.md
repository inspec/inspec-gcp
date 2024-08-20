+++

title = "google_dataproc_metastore_service_backups Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_dataproc_metastore_service_backups"
identifier = "inspec/resources/gcp/google_dataproc_metastore_service_backups Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_metastore_service_backups` InSpec audit resource to test the properties of a test a Google ServiceBackup.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_dataproc_metastore_service_backups` is used to test a Google ServiceBackup resource

## Examples
```
    describe google_dataproc_metastore_service_backups(parent: ' value_parent') do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_dataproc_metastore_service_backups` resource:

See [google_dataproc_metastore_service_backup.md](google_dataproc_metastore_service_backup.md) for more detailed information
* `names`: an array of `google_dataproc_metastore_service_backup` name
* `create_times`: an array of `google_dataproc_metastore_service_backup` create_time
* `end_times`: an array of `google_dataproc_metastore_service_backup` end_time
* `states`: an array of `google_dataproc_metastore_service_backup` state
* `service_revisions`: an array of `google_dataproc_metastore_service_backup` service_revision
* `descriptions`: an array of `google_dataproc_metastore_service_backup` description
* `restoring_services`: an array of `google_dataproc_metastore_service_backup` restoring_services
## Properties
Properties that can be accessed from the `google_dataproc_metastore_service_backups` resource:

See [google_dataproc_metastore_service_backup.md](google_dataproc_metastore_service_backup.md) for more detailed information
* `names`: an array of `google_dataproc_metastore_service_backup` name
* `create_times`: an array of `google_dataproc_metastore_service_backup` create_time
* `end_times`: an array of `google_dataproc_metastore_service_backup` end_time
* `states`: an array of `google_dataproc_metastore_service_backup` state
* `service_revisions`: an array of `google_dataproc_metastore_service_backup` service_revision
* `descriptions`: an array of `google_dataproc_metastore_service_backup` description
* `restoring_services`: an array of `google_dataproc_metastore_service_backup` restoring_services

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Dataproc Metastore API](https://console.cloud.google.com/apis/library/metastore.googleapis.com) is enabled for the current project.
