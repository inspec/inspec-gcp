---
title: About the google_compute_global_operation resource
platform: gcp
---

## Syntax
A `google_compute_global_operation` is used to test a Google GlobalOperation resource

## Examples
```
describe google_compute_global_operation(project: 'chef-gcp-inspec', name: 'operation-1634799391539-5ced765030229-be5d5765-6623920f') do
  it { should exist }
  it { should be_up }
  its('operation_type') { should include 'delete' }
end
```

## Properties
Properties that can be accessed from the `google_compute_global_operation` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the operation.

  * `zone`: The URL of the zone where the operation resides. Only applicable when performing per-zone operations.

  * `client_operation_id`: The value of requestId if you provided it in the request. Not present otherwise.

  * `operation_type`: The type of operation, such as insert, update, or delete, and so on.

  * `user`: User who requested the operation, for example: user@example.com.

  * `progress`: An optional progress indicator that ranges from 0 to 100. There is no requirement that this be linear or support any granularity of operations. This should not be used to guess when the operation will be complete. This number should monotonically increase as the operation progresses.

  * `insert_time`: The time that this operation was requested. This value is in RFC3339 text format.

  * `start_time`: The time that this operation was started by the server. This value is in RFC3339 text format.

  * `end_time`: The time that this operation was completed. This value is in RFC3339 text format.

  * `status`: The status of the operation, which can be one of the following: * PENDING * PENDINGPENDING * DONE
  Possible values:
    * PENDING
    * PENDING
    * DONE

  * `status_message`: An optional textual description of the current status of the operation.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
