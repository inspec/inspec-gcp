+++
title = "google_compute_zone_operation resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_zone_operation"
identifier = "inspec/resources/gcp/google_compute_zone_operation Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_zone_operation` is used to test a Google ZoneOperation resource

## Examples
```
describe google_compute_zone_operation(project: 'chef-gcp-inspec', zone: 'us-central1-a', name: 'operation-1641188179305-5d4a6e66fe2bd-8fd1812d-d97f3b69') do
it { should exist }
its('name') { should eq 'operation-1641188179305-5d4a6e66fe2bd-8fd1812d-d97f3b69' }
its('status') { should eq '' }
its('progress') { should eq '100' }
end

describe google_compute_zone_operation(project: 'chef-gcp-inspec', zone: 'us-central1-a', name: 'nonexistent') do
it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_zone_operation` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `status_message`: An optional, human-readable explanation of the status.

  * `target_id`: The unique target ID, which identifies a specific incarnation of the target resource.

  * `status`: The status of the operation, which can be one of the following: PENDING, RUNNING, or DONE.
  Possible values:
    * PENDING
    * RUNNING
    * DONE

  * `user`: User who requested the operation, for example: user@example.com.

  * `insert_time`: The time that this operation was requested. This value is in RFC3339 text format.

  * `start_time`: The time that this operation was requested. This value is in RFC3339 text format.

  * `end_time`: The time that this operation was requested. This value is in RFC3339 text format.

  * `progress`: An optional progress indicator that ranges from 0 to 100. There is no requirement that this be linear or support any granularity of operations. This should not be used to guess when the operation will be complete. This number should monotonically increase as the operation progresses.

  * `region`: The URL of the region where the operation resides. Only applicable when performing regional operations.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
