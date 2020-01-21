---
title: About the google_compute_zones resource
platform: gcp
---

## Syntax
A `google_compute_zones` is used to test a Google Zone resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
google_compute_zones(project: 'chef-gcp-inspec').zone_names.each do |zone_name|
  describe google_compute_zones(project: 'chef-gcp-inspec', name: zone_name) do
    it { should exist }
    it { should be_up }
  end
end
```

## Properties
Properties that can be accessed from the `google_compute_zones` resource:

See [google_compute_zone.md](google_compute_zone.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_zone` creation_timestamp
  * `deprecateds`: an array of `google_compute_zone` deprecated
  * `descriptions`: an array of `google_compute_zone` description
  * `zone_ids`: an array of `google_compute_zone` id
  * `zone_names`: an array of `google_compute_zone` name
  * `regions`: an array of `google_compute_zone` region
  * `zone_statuses`: an array of `google_compute_zone` status
  * `available_cpu_platforms`: an array of `google_compute_zone` available_cpu_platforms

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
