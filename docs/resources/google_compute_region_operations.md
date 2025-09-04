+++
title = "google_compute_region_operations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_region_operations"
identifier = "inspec/resources/gcp/google_compute_region_operations Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_region_operations` is used to test a Google RegionOperation resource

## Examples
```
describe google_compute_region_operations(project: 'chef-gcp-inspec', region: '') do
	it { should exist }
	its('names') { should include 'operation-1641188435323-5d4a6f5b26934-9281422c-dce238f5' }
	its('progress') { should include '100' }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_operations` resource:

See [google_compute_region_operation.md](google_compute_region_operation.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_region_operation` creation_timestamp
  * `descriptions`: an array of `google_compute_region_operation` description
  * `ids`: an array of `google_compute_region_operation` id
  * `names`: an array of `google_compute_region_operation` name
  * `target_ids`: an array of `google_compute_region_operation` target_id
  * `statuses`: an array of `google_compute_region_operation` status
  * `users`: an array of `google_compute_region_operation` user
  * `insert_times`: an array of `google_compute_region_operation` insert_time
  * `start_times`: an array of `google_compute_region_operation` start_time
  * `end_times`: an array of `google_compute_region_operation` end_time
  * `progresses`: an array of `google_compute_region_operation` progress
  * `zones`: an array of `google_compute_region_operation` zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
