+++
title = "google_compute_region_disk_types resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_disk_types"
identifier = "inspec/resources/gcp/google_compute_region_disk_types Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_disk_types` InSpec audit resource to to test a Google Cloud RegionDiskType resource.

## Examples

```ruby
  describe google_compute_region_disk_types(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_region_disk_types` resource:

See [google_compute_region_disk_type](google_compute_region_disk_type) for more detailed information.

  * `kinds`: an array of `google_compute_region_disk_type` kind
  * `ids`: an array of `google_compute_region_disk_type` id
  * `creation_timestamps`: an array of `google_compute_region_disk_type` creation_timestamp
  * `names`: an array of `google_compute_region_disk_type` name
  * `descriptions`: an array of `google_compute_region_disk_type` description
  * `valid_disk_sizes`: an array of `google_compute_region_disk_type` valid_disk_size
  * `deprecateds`: an array of `google_compute_region_disk_type` deprecated
  * `zones`: an array of `google_compute_region_disk_type` zone
  * `self_links`: an array of `google_compute_region_disk_type` self_link
  * `default_disk_size_gbs`: an array of `google_compute_region_disk_type` default_disk_size_gb
  * `regions`: an array of `google_compute_region_disk_type` region

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
