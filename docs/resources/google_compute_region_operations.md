+++
title = "google_compute_region_operations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_operations"
identifier = "inspec/resources/gcp/google_compute_region_operations Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_operations` InSpec audit resource to to test a Google Cloud RegionOperation resource.

## Examples

```ruby
describe google_compute_region_operations(project: 'chef-gcp-inspec', region: '') do
	it { should exist }
	its('names') { should include 'operation-1641188435323-5d4a6f5b26934-9281422c-dce238f5' }
	its('progress') { should include '100' }
end
```

## Properties

Properties that can be accessed from the `google_compute_region_operations` resource:

See [google_compute_region_operation](google_compute_region_operation) for more detailed information.

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

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
