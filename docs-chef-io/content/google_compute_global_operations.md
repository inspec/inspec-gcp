+++
title = "google_compute_global_operations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_global_operations"
identifier = "inspec/resources/gcp/google_compute_global_operations resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_global_operations` InSpec audit resource to to test a Google Cloud GlobalOperation resource.

## Examples

```ruby
describe google_compute_global_operations(project: 'chef-gcp-inspec') do
  it { should exist }
  it { should be_up }
  its('operation_type') { should include 'delete' }
end
```

## Properties

Properties that can be accessed from the `google_compute_global_operations` resource:

See [google_compute_global_operation](google_compute_global_operation) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_global_operation` creation_timestamp
  * `descriptions`: an array of `google_compute_global_operation` description
  * `ids`: an array of `google_compute_global_operation` id
  * `names`: an array of `google_compute_global_operation` name
  * `zones`: an array of `google_compute_global_operation` zone
  * `client_operation_ids`: an array of `google_compute_global_operation` client_operation_id
  * `operation_types`: an array of `google_compute_global_operation` operation_type
  * `users`: an array of `google_compute_global_operation` user
  * `progresses`: an array of `google_compute_global_operation` progress
  * `insert_times`: an array of `google_compute_global_operation` insert_time
  * `start_times`: an array of `google_compute_global_operation` start_time
  * `end_times`: an array of `google_compute_global_operation` end_time
  * `statuses`: an array of `google_compute_global_operation` status
  * `status_messages`: an array of `google_compute_global_operation` status_message

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
