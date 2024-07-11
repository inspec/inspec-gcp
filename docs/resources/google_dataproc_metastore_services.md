+++

title = "google_dataproc_metastore_services Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_dataproc_metastore_services"
identifier = "inspec/resources/gcp/google_dataproc_metastore_services Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_metastore_services` InSpec audit resource to test the properties of a test a Google Service.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_dataproc_metastore_services` is used to test a Google Service resource

## Examples
```
    describe google_dataproc_metastore_services(parent: ' value_parent') do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_dataproc_metastore_services` resource:

See [google_dataproc_metastore_service.md](google_dataproc_metastore_service.md) for more detailed information
* `hive_metastore_configs`: an array of `google_dataproc_metastore_service` hive_metastore_config
* `names`: an array of `google_dataproc_metastore_service` name
* `create_times`: an array of `google_dataproc_metastore_service` create_time
* `update_times`: an array of `google_dataproc_metastore_service` update_time
* `labels`: an array of `google_dataproc_metastore_service` labels
* `networks`: an array of `google_dataproc_metastore_service` network
* `endpoint_uris`: an array of `google_dataproc_metastore_service` endpoint_uri
* `ports`: an array of `google_dataproc_metastore_service` port
* `states`: an array of `google_dataproc_metastore_service` state
* `state_messages`: an array of `google_dataproc_metastore_service` state_message
* `artifact_gcs_uris`: an array of `google_dataproc_metastore_service` artifact_gcs_uri
* `tiers`: an array of `google_dataproc_metastore_service` tier
* `metadata_integrations`: an array of `google_dataproc_metastore_service` metadata_integration
* `maintenance_windows`: an array of `google_dataproc_metastore_service` maintenance_window
* `uids`: an array of `google_dataproc_metastore_service` uid
* `metadata_management_activities`: an array of `google_dataproc_metastore_service` metadata_management_activity
* `release_channels`: an array of `google_dataproc_metastore_service` release_channel
* `encryption_configs`: an array of `google_dataproc_metastore_service` encryption_config
* `network_configs`: an array of `google_dataproc_metastore_service` network_config
* `database_types`: an array of `google_dataproc_metastore_service` database_type
* `telemetry_configs`: an array of `google_dataproc_metastore_service` telemetry_config
* `scaling_configs`: an array of `google_dataproc_metastore_service` scaling_config
* `scheduled_backups`: an array of `google_dataproc_metastore_service` scheduled_backup
* `deletion_protections`: an array of `google_dataproc_metastore_service` deletion_protection
## Properties
Properties that can be accessed from the `google_dataproc_metastore_services` resource:

See [google_dataproc_metastore_service.md](google_dataproc_metastore_service.md) for more detailed information
* `hive_metastore_configs`: an array of `google_dataproc_metastore_service` hive_metastore_config
* `names`: an array of `google_dataproc_metastore_service` name
* `create_times`: an array of `google_dataproc_metastore_service` create_time
* `update_times`: an array of `google_dataproc_metastore_service` update_time
* `labels`: an array of `google_dataproc_metastore_service` labels
* `networks`: an array of `google_dataproc_metastore_service` network
* `endpoint_uris`: an array of `google_dataproc_metastore_service` endpoint_uri
* `ports`: an array of `google_dataproc_metastore_service` port
* `states`: an array of `google_dataproc_metastore_service` state
* `state_messages`: an array of `google_dataproc_metastore_service` state_message
* `artifact_gcs_uris`: an array of `google_dataproc_metastore_service` artifact_gcs_uri
* `tiers`: an array of `google_dataproc_metastore_service` tier
* `metadata_integrations`: an array of `google_dataproc_metastore_service` metadata_integration
* `maintenance_windows`: an array of `google_dataproc_metastore_service` maintenance_window
* `uids`: an array of `google_dataproc_metastore_service` uid
* `metadata_management_activities`: an array of `google_dataproc_metastore_service` metadata_management_activity
* `release_channels`: an array of `google_dataproc_metastore_service` release_channel
* `encryption_configs`: an array of `google_dataproc_metastore_service` encryption_config
* `network_configs`: an array of `google_dataproc_metastore_service` network_config
* `database_types`: an array of `google_dataproc_metastore_service` database_type
* `telemetry_configs`: an array of `google_dataproc_metastore_service` telemetry_config
* `scaling_configs`: an array of `google_dataproc_metastore_service` scaling_config
* `scheduled_backups`: an array of `google_dataproc_metastore_service` scheduled_backup
* `deletion_protections`: an array of `google_dataproc_metastore_service` deletion_protection

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Dataproc Metastore API](https://console.cloud.google.com/apis/library/metastore.googleapis.com) is enabled for the current project.
