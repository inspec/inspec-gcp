+++

title = "google_bigtableadmin_cluster_backup Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_bigtableadmin_cluster_backup"
identifier = "inspec/resources/gcp/google_bigtableadmin_cluster_backup Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_bigtableadmin_cluster_backup` InSpec audit resource to test the properties of a test a Google ClusterBackup.

## Syntax
A `google_bigtableadmin_cluster_backup` is used to test a Google ClusterBackup resource

## Examples
```
describe google_bigtableadmin_cluster_backup(name: ' value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('source_table') { should cmp 'value_sourcetable' }
	its('source_backup') { should cmp 'value_sourcebackup' }
	its('expire_time') { should cmp 'value_expiretime' }
	its('start_time') { should cmp 'value_starttime' }
	its('end_time') { should cmp 'value_endtime' }
	its('size_bytes') { should cmp 'value_sizebytes' }
	its('state') { should cmp 'value_state' }
end

describe google_bigtableadmin_cluster_backup(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_bigtableadmin_cluster_backup` resource:

## Properties
Properties that can be accessed from the `google_bigtableadmin_cluster_backup` resource:


  * `name`: A globally unique identifier for the backup which cannot be changed. Values are of the form `projects/{project}/instances/{instance}/clusters/{cluster}/ backups/_a-zA-Z0-9*` The final segment of the name must be between 1 and 50 characters in length. The backup is stored in the cluster identified by the prefix of the backup name of the form `projects/{project}/instances/{instance}/clusters/{cluster}`.

  * `source_table`: Required. Immutable. Name of the table from which this backup was created. This needs to be in the same instance as the backup. Values are of the form `projects/{project}/instances/{instance}/tables/{source_table}`.

  * `source_backup`: Output only. Name of the backup from which this backup was copied. If a backup is not created by copying a backup, this field will be empty. Values are of the form: projects//instances//clusters//backups/

  * `expire_time`: Required. The expiration time of the backup, with microseconds granularity that must be at least 6 hours and at most 90 days from the time the request is received. Once the `expire_time` has passed, Cloud Bigtable will delete the backup and free the resources used by the backup.

  * `start_time`: Output only. `start_time` is the time that the backup was started (i.e. approximately the time the CreateBackup request is received). The row data in this backup will be no older than this timestamp.

  * `end_time`: Output only. `end_time` is the time that the backup was finished. The row data in the backup will be no newer than this timestamp.

  * `size_bytes`: Output only. Size of the backup in bytes.

  * `state`: Output only. The current state of the backup.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * READY

  * `encryption_info`: Encryption information for a given resource. If this resource is protected with customer managed encryption, the in-use Cloud Key Management Service (Cloud KMS) key version is specified along with its status.

    * `encryption_type`: Output only. The type of encryption used to protect this resource.
    Possible values:
      * ENCRYPTION_TYPE_UNSPECIFIED
      * GOOGLE_DEFAULT_ENCRYPTION
      * CUSTOMER_MANAGED_ENCRYPTION

    * `encryption_status`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

      * `code`: The status code, which should be an enum value of google.rpc.Code.

      * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

      * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `kms_key_version`: Output only. The version of the Cloud KMS key specified in the parent cluster that is in use for the data underlying this table.


## GCP Permissions

Ensure the [https://bigtableadmin.googleapis.com/](https://console.cloud.google.com/apis/library/bigtableadmin.googleapis.com/) is enabled for the current project.
