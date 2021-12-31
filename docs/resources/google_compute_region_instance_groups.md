---
title: About the google_compute_region_instance_groups resource
platform: gcp
---

## Syntax
A `google_compute_region_instance_groups` is used to test a Google RegionInstanceGroup resource

## Examples
```
describe google_compute_region_instance_groups(project: 'chef-gcp-inspec', region: 'us-central1') do
	it { should exist }
	its('names') { should include 'instance-group-2' }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_instance_groups` resource:

See [google_compute_region_instance_group.md](google_compute_region_instance_group.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_region_instance_group` creation_timestamp
  * `descriptions`: an array of `google_compute_region_instance_group` description
  * `ids`: an array of `google_compute_region_instance_group` id
  * `names`: an array of `google_compute_region_instance_group` name
  * `fingerprints`: an array of `google_compute_region_instance_group` fingerprint
  * `networks`: an array of `google_compute_region_instance_group` network
  * `zones`: an array of `google_compute_region_instance_group` zone
  * `sizes`: an array of `google_compute_region_instance_group` size
  * `regions`: an array of `google_compute_region_instance_group` region
  * `named_ports`: an array of `google_compute_region_instance_group` named_ports

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
