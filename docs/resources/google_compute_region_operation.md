+++
title = "google_compute_region_operation resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_operation"
identifier = "inspec/resources/gcp/google_compute_region_operation Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_operation` InSpec audit resource to to test a Google Cloud RegionOperation resource.

## Examples

```ruby
describe google_compute_region_operation(project: 'chef-gcp-inspec', region: '', name: 'operation-1641188435323-5d4a6f5b26934-9281422c-dce238f5') do
it { should exist }
its('name') { should eq 'operation-1641188435323-5d4a6f5b26934-9281422c-dce238f5' }
its('status') { should eq '' }
its('progress') { should eq '100' }
end

describe google_compute_region_operation(project: 'chef-gcp-inspec', region: '', name: 'nonexistent') do
it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_region_operation` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

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

  * `zone`: The URL of the zone where the instance group is located (for zonal resources).


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
