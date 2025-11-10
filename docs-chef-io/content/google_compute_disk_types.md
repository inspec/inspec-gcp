+++
title = "google_compute_disk_types resource"

draft = false


[menu.gcp]
title = "google_compute_disk_types"
identifier = "inspec/resources/gcp/google_compute_disk_types resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_disk_types` InSpec audit resource to to test a Google Cloud DiskType resource.

## Examples

```ruby
describe google_compute_disk_types(project: 'chef-gcp-inspec', zone: 'us-east1-b') do
it { should exist }
it { should be_up }
end
```

## Properties

Properties that can be accessed from the `google_compute_disk_types` resource:

See [google_compute_disk_type](google_compute_disk_type) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_disk_type` creation_timestamp
  * `default_disk_size_gbs`: an array of `google_compute_disk_type` default_disk_size_gb
  * `deprecateds`: an array of `google_compute_disk_type` deprecated
  * `descriptions`: an array of `google_compute_disk_type` description
  * `ids`: an array of `google_compute_disk_type` id
  * `names`: an array of `google_compute_disk_type` name
  * `valid_disk_sizes`: an array of `google_compute_disk_type` valid_disk_size
  * `zones`: an array of `google_compute_disk_type` zone

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
