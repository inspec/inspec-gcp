+++

title = "google_dataproc_metastore_project_location_service_backup Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_dataproc_metastore_project_location_service_backup"
identifier = "inspec/resources/gcp/google_dataproc_metastore_project_location_service_backup Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_metastore_project_location_service_backup` InSpec audit resource to test the properties of a test a Google ProjectLocationServiceBackup.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_dataproc_metastore_project_location_service_backup` is used to test a Google ProjectLocationServiceBackup resource

## Examples
```
describe google_dataproc_metastore_project_location_service_backup(name: ' value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }
	its('end_time') { should cmp 'value_endtime' }
	its('state') { should cmp 'value_state' }
	its('description') { should cmp 'value_description' }

end

describe google_dataproc_metastore_project_location_service_backup(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_dataproc_metastore_project_location_service_backup` resource:

## Properties
Properties that can be accessed from the `google_dataproc_metastore_project_location_service_backup` resource:


  * `name`: Immutable. The relative resource name of the backup, in the following form:projects/{project_number}/locations/{location_id}/services/{service_id}/backups/{backup_id}

  * `create_time`: Output only. The time when the backup was started.

  * `end_time`: Output only. The time when the backup finished creating.

  * `state`: Output only. The current state of the backup.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * DELETING
    * ACTIVE
    * FAILED
    * RESTORING

  * `service_revision`: A managed metastore service that serves metadata queries.

    * `hive_metastore_config`: Specifies configuration information specific to running Hive metastore software as the metastore service.

      * `version`: Immutable. The Hive metastore schema version.

      * `config_overrides`: A mapping of Hive metastore configuration key-value pairs to apply to the Hive metastore (configured in hive-site.xml). The mappings override system defaults (some keys cannot be overridden). These overrides are also applied to auxiliary versions and can be further customized in the auxiliary version's AuxiliaryVersionConfig.

        * `additional_properties`: 

      * `kerberos_config`: Configuration information for a Kerberos principal.

        * `keytab`: A securely stored value.

          * `cloud_secret`: The relative resource name of a Secret Manager secret version, in the following form:projects/{project_number}/secrets/{secret_id}/versions/{version_id}.

        * `principal`: A Kerberos principal that exists in the both the keytab the KDC to authenticate as. A typical principal is of the form primary/instance@REALM, but there is no exact format.

        * `krb5_config_gcs_uri`: A Cloud Storage URI that specifies the path to a krb5.conf file. It is of the form gs://{bucket_name}/path/to/krb5.conf, although the file does not need to be named krb5.conf explicitly.

      * `endpoint_protocol`: The protocol to use for the metastore service endpoint. If unspecified, defaults to THRIFT.
      Possible values:
        * ENDPOINT_PROTOCOL_UNSPECIFIED
        * THRIFT
        * GRPC

      * `auxiliary_versions`: A mapping of Hive metastore version to the auxiliary version configuration. When specified, a secondary Hive metastore service is created along with the primary service. All auxiliary versions must be less than the service's primary version. The key is the auxiliary service name and it must match the regular expression a-z?. This means that the first character must be a lowercase letter, and all the following characters must be hyphens, lowercase letters, or digits, except the last character, which cannot be a hyphen.

        * `additional_properties`: Configuration information for the auxiliary service versions.

    * `name`: Immutable. The relative resource name of the metastore service, in the following format:projects/{project_number}/locations/{location_id}/services/{service_id}.

    * `create_time`: Output only. The time when the metastore service was created.

    * `update_time`: Output only. The time when the metastore service was last updated.

    * `labels`: User-defined labels for the metastore service.

      * `additional_properties`: 

    * `network`: Immutable. The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form:projects/{project_number}/global/networks/{network_id}.

    * `endpoint_uri`: Output only. The URI of the endpoint used to access the metastore service.

    * `port`: The TCP port at which the metastore service is reached. Default: 9083.

    * `state`: Output only. The current state of the metastore service.
    Possible values:
      * STATE_UNSPECIFIED
      * CREATING
      * ACTIVE
      * SUSPENDING
      * SUSPENDED
      * UPDATING
      * DELETING
      * ERROR
      * MIGRATING

    * `state_message`: Output only. Additional information about the current state of the metastore service, if available.

    * `artifact_gcs_uri`: Output only. A Cloud Storage URI (starting with gs://) that specifies where artifacts related to the metastore service are stored.

    * `tier`: The tier of the service.
    Possible values:
      * TIER_UNSPECIFIED
      * DEVELOPER
      * ENTERPRISE

    * `metadata_integration`: Specifies how metastore metadata should be integrated with external services.

      * `data_catalog_config`: Specifies how metastore metadata should be integrated with the Data Catalog service.

        * `enabled`: Optional. Defines whether the metastore metadata should be synced to Data Catalog. The default value is to disable syncing metastore metadata to Data Catalog.

      * `dataplex_config`: Specifies how metastore metadata should be integrated with the Dataplex service.

        * `lake_resources`: A reference to the Lake resources that this metastore service is attached to. The key is the lake resource name. Example: projects/{project_number}/locations/{location_id}/lakes/{lake_id}.

          * `additional_properties`: Represents a Lake resource

    * `maintenance_window`: Maintenance window. This specifies when Dataproc Metastore may perform system maintenance operation to the service.

      * `hour_of_day`: The hour of day (0-23) when the window starts.

      * `day_of_week`: The day of week, when the window starts.
      Possible values:
        * DAY_OF_WEEK_UNSPECIFIED
        * MONDAY
        * TUESDAY
        * WEDNESDAY
        * THURSDAY
        * FRIDAY
        * SATURDAY
        * SUNDAY

    * `uid`: Output only. The globally unique resource identifier of the metastore service.

    * `metadata_management_activity`: The metadata management activities of the metastore service.

      * `metadata_exports`: Output only. The latest metadata exports of the metastore service.

        * `destination_gcs_uri`: Output only. A Cloud Storage URI of a folder that metadata are exported to, in the form of gs:////, where is automatically generated.

        * `start_time`: Output only. The time when the export started.

        * `end_time`: Output only. The time when the export ended.

        * `state`: Output only. The current state of the export.
        Possible values:
          * STATE_UNSPECIFIED
          * RUNNING
          * SUCCEEDED
          * FAILED
          * CANCELLED

        * `database_dump_type`: Output only. The type of the database dump.
        Possible values:
          * TYPE_UNSPECIFIED
          * MYSQL
          * AVRO

      * `restores`: Output only. The latest restores of the metastore service.

        * `start_time`: Output only. The time when the restore started.

        * `end_time`: Output only. The time when the restore ended.

        * `state`: Output only. The current state of the restore.
        Possible values:
          * STATE_UNSPECIFIED
          * RUNNING
          * SUCCEEDED
          * FAILED
          * CANCELLED

        * `backup`: Output only. The relative resource name of the metastore service backup to restore from, in the following form:projects/{project_id}/locations/{location_id}/services/{service_id}/backups/{backup_id}.

        * `type`: Output only. The type of restore.
        Possible values:
          * RESTORE_TYPE_UNSPECIFIED
          * FULL
          * METADATA_ONLY

        * `details`: Output only. The restore details containing the revision of the service to be restored to, in format of JSON.

        * `backup_location`: Optional. A Cloud Storage URI specifying where the backup artifacts are stored, in the format gs:///.

    * `release_channel`: Immutable. The release channel of the service. If unspecified, defaults to STABLE.
    Possible values:
      * RELEASE_CHANNEL_UNSPECIFIED
      * CANARY
      * STABLE

    * `encryption_config`: Encryption settings for the service.

      * `kms_key`: The fully qualified customer provided Cloud KMS key name to use for customer data encryption, in the following format:projects/{project_number}/locations/{location_id}/keyRings/{key_ring_id}/cryptoKeys/{crypto_key_id}.

    * `network_config`: Network configuration for the Dataproc Metastore service.

      * `consumers`: Immutable. The consumer-side network configuration for the Dataproc Metastore instance.

        * `subnetwork`: Immutable. The subnetwork of the customer project from which an IP address is reserved and used as the Dataproc Metastore service's endpoint. It is accessible to hosts in the subnet and to all hosts in a subnet in the same region and same network. There must be at least one IP address available in the subnet's primary range. The subnet is specified in the following form:projects/{project_number}/regions/{region_id}/subnetworks/{subnetwork_id}

        * `endpoint_uri`: Output only. The URI of the endpoint used to access the metastore service.

        * `endpoint_location`: Output only. The location of the endpoint URI. Format: projects/{project}/locations/{location}.

      * `custom_routes_enabled`: Enables custom routes to be imported and exported for the Dataproc Metastore service's peered VPC network.

    * `database_type`: Immutable. The database type that the Metastore service stores its data.
    Possible values:
      * DATABASE_TYPE_UNSPECIFIED
      * MYSQL
      * SPANNER

    * `telemetry_config`: Telemetry Configuration for the Dataproc Metastore service.

      * `log_format`: The output format of the Dataproc Metastore service's logs.
      Possible values:
        * LOG_FORMAT_UNSPECIFIED
        * LEGACY
        * JSON

    * `scaling_config`: Represents the scaling configuration of a metastore service.

      * `instance_size`: An enum of readable instance sizes, with each instance size mapping to a float value (e.g. InstanceSize.EXTRA_SMALL = scaling_factor(0.1))
      Possible values:
        * INSTANCE_SIZE_UNSPECIFIED
        * EXTRA_SMALL
        * SMALL
        * MEDIUM
        * LARGE
        * EXTRA_LARGE

      * `scaling_factor`: Scaling factor, increments of 0.1 for values less than 1.0, and increments of 1.0 for values greater than 1.0.

      * `autoscaling_config`: Represents the autoscaling configuration of a metastore service.

        * `autoscaling_factor`: Output only. The scaling factor of a service with autoscaling enabled.

        * `autoscaling_enabled`: Optional. Whether or not autoscaling is enabled for this service.

        * `limit_config`: Represents the autoscaling limit configuration of a metastore service.

          * `max_scaling_factor`: Optional. The highest scaling factor that the service should be autoscaled to.

          * `min_scaling_factor`: Optional. The lowest scaling factor that the service should be autoscaled to.

    * `scheduled_backup`: This specifies the configuration of scheduled backup.

      * `enabled`: Optional. Defines whether the scheduled backup is enabled. The default value is false.

      * `cron_schedule`: Optional. The scheduled interval in Cron format, see https://en.wikipedia.org/wiki/Cron The default is empty: scheduled backup is not enabled. Must be specified to enable scheduled backups.

      * `time_zone`: Optional. Specifies the time zone to be used when interpreting cron_schedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones), e.g. America/Los_Angeles or Africa/Abidjan. If left unspecified, the default is UTC.

      * `next_scheduled_time`: Output only. The time when the next backups execution is scheduled to start.

      * `backup_location`: Optional. A Cloud Storage URI of a folder, in the format gs:///. A sub-folder containing backup files will be stored below it.

      * `latest_backup`: The details of the latest scheduled backup.

        * `backup_id`: Output only. The ID of an in-progress scheduled backup. Empty if no backup is in progress.

        * `start_time`: Output only. The time when the backup was started.

        * `state`: Output only. The current state of the backup.
        Possible values:
          * STATE_UNSPECIFIED
          * IN_PROGRESS
          * SUCCEEDED
          * FAILED

        * `duration`: Output only. The duration of the backup completion.

    * `deletion_protection`: Optional. Indicates if the dataproc metastore should be protected against accidental deletions.

  * `description`: The description of the backup.

  * `restoring_services`: Output only. Services that are restoring from the backup.


## GCP Permissions

Ensure the [Dataproc Metastore API](https://console.cloud.google.com/apis/library/metastore.googleapis.com) is enabled for the current project.
