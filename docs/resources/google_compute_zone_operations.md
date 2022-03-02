---
title: About the google_compute_zone_operations resource
platform: gcp
---

## Syntax
A `google_compute_zone_operations` is used to test a Google ZoneOperation resource

## Examples
```
describe google_compute_zone_operations(project: 'chef-gcp-inspec', zone: 'us-central1-a') do
	it { should exist }
	its('names') { should include 'operation-1641188179305-5d4a6e66fe2bd-8fd1812d-d97f3b69' }
	its('progresses') { should include '100' }
end
```

## Properties
Properties that can be accessed from the `google_compute_zone_operations` resource:

See [google_compute_zone_operation.md](google_compute_zone_operation.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_zone_operation` creation_timestamp
  * `descriptions`: an array of `google_compute_zone_operation` description
  * `ids`: an array of `google_compute_zone_operation` id
  * `names`: an array of `google_compute_zone_operation` name
  * `status_messages`: an array of `google_compute_zone_operation` status_message
  * `target_ids`: an array of `google_compute_zone_operation` target_id
  * `statuses`: an array of `google_compute_zone_operation` status
  * `users`: an array of `google_compute_zone_operation` user
  * `insert_times`: an array of `google_compute_zone_operation` insert_time
  * `start_times`: an array of `google_compute_zone_operation` start_time
  * `end_times`: an array of `google_compute_zone_operation` end_time
  * `progresses`: an array of `google_compute_zone_operation` progress
  * `regions`: an array of `google_compute_zone_operation` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
