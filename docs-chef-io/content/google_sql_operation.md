+++
title = "google_sql_operation resource"

draft = false


[menu.gcp]
title = "google_sql_operation"
identifier = "inspec/resources/gcp/google_sql_operation resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sql_operation` InSpec audit resource to to test a Google Cloud Operation resource.

## Examples

```ruby
describe google_sql_operation(project: 'chef-gcp-inspec', operation: 'e5c522f1-8391-4830-a8ff-ff1cc4a7b2a5') do
  it { should exist }
  its('name') { should eq 'e5c522f1-8391-4830-a8ff-ff1cc4a7b2a5' }
  its('status') { should eq 'DONE' }
  its('operation_type') { should eq 'CREATE' }
end

describe google_sql_operation(project: 'chef-gcp-inspec', operation: 'nonexistant') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_sql_operation` resource:


  * `user`: The email address of the user who initiated this operation.

  * `name`: An identifier that uniquely identifies the operation. You can use this identifier to retrieve the Operations resource that has information about the operation.

  * `status`: An Operation resource. For successful operations that return an Operation resource, only the fields relevant to the operation are populated in the resource.
  Possible values:
    * PENDING
    * RUNNING
    * DONE
    * SQL_OPERATION_STATUS_UNSPECIFIED

  * `operation_type`: An Operation resource. For successful operations that return an Operation resource, only the fields relevant to the operation are populated in the resource.
  Possible values:
    * SQL_OPERATION_TYPE_UNSPECIFIED
    * IMPORT
    * EXPORT
    * CREATE
    * UPDATE
    * DELETE
    * RESTART
    * BACKUP_VOLUME
    * DELETE_VOLUME
    * RESTORE_VOLUME
    * INJECT_USER
    * CLONE
    * STOP_REPLICA
    * START_REPLICA
    * START_REPLICA
    * CREATE_REPLICA
    * CREATE_USER
    * DELETE_USER
    * UPDATE_USER
    * CREATE_DATABASE
    * DELETE_DATABASE
    * CREATE_REPLICA
    * UPDATE_DATABASE
    * FAILOVER
    * DELETE_BACKUP
    * RECREATE_REPLICA
    * TRUNCATE_LOG
    * DEMOTE_MASTER
    * MAINTENANCE
    * RESCHEDULE_MAINTENANCE
    * START_EXTERNAL_SYNC

  * `instance`: The name of the Cloud SQL instance. This does not include the project ID.


## GCP permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
