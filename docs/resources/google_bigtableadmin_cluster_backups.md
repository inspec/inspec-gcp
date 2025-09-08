+++

title = "google_bigtableadmin_cluster_backups Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_bigtableadmin_cluster_backups"
identifier = "inspec/resources/gcp/google_bigtableadmin_cluster_backups Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_bigtableadmin_cluster_backups` InSpec audit resource to test the properties of a test a Google ClusterBackup.

## Syntax
A `google_bigtableadmin_cluster_backups` is used to test a Google ClusterBackup resource

## Examples
```
  describe google_bigtableadmin_cluster_backups(parent: 'value_parent') do
    it { should exist }
    its('name') { should include 'value_name' }
    its('source_table') { should include 'value_sourcetable' }
    its('source_backup') { should include 'value_sourcebackup' }
    its('expire_time') { should include 'value_expiretime' }
    its('start_time') { should include 'value_starttime' }
    its('end_time') { should include 'value_endtime' }
    its('size_bytes') { should include 'value_sizebytes' }
    its('state') { should include 'value_state' }
  end
```

## Parameters
Properties that can be accessed from the `google_bigtableadmin_cluster_backups` resource:

See [google_bigtableadmin_cluster_backup.md](google_bigtableadmin_cluster_backup.md) for more detailed information
* `names`: an array of `google_bigtableadmin_cluster_backup` name
* `source_tables`: an array of `google_bigtableadmin_cluster_backup` source_table
* `source_backups`: an array of `google_bigtableadmin_cluster_backup` source_backup
* `expire_times`: an array of `google_bigtableadmin_cluster_backup` expire_time
* `start_times`: an array of `google_bigtableadmin_cluster_backup` start_time
* `end_times`: an array of `google_bigtableadmin_cluster_backup` end_time
* `size_bytes`: an array of `google_bigtableadmin_cluster_backup` size_bytes
* `states`: an array of `google_bigtableadmin_cluster_backup` state
* `encryption_infos`: an array of `google_bigtableadmin_cluster_backup` encryption_info
## Properties
Properties that can be accessed from the `google_bigtableadmin_cluster_backups` resource:

See [google_bigtableadmin_cluster_backup.md](google_bigtableadmin_cluster_backup.md) for more detailed information
* `names`: an array of `google_bigtableadmin_cluster_backup` name
* `source_tables`: an array of `google_bigtableadmin_cluster_backup` source_table
* `source_backups`: an array of `google_bigtableadmin_cluster_backup` source_backup
* `expire_times`: an array of `google_bigtableadmin_cluster_backup` expire_time
* `start_times`: an array of `google_bigtableadmin_cluster_backup` start_time
* `end_times`: an array of `google_bigtableadmin_cluster_backup` end_time
* `size_bytes`: an array of `google_bigtableadmin_cluster_backup` size_bytes
* `states`: an array of `google_bigtableadmin_cluster_backup` state
* `encryption_infos`: an array of `google_bigtableadmin_cluster_backup` encryption_info

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://bigtableadmin.googleapis.com/](https://console.cloud.google.com/apis/library/bigtableadmin.googleapis.com/) is enabled for the current project.
