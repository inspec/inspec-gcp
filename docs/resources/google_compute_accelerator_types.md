---
title: About the google_compute_accelerator_types resource
platform: gcp
---

## Syntax
A `google_compute_accelerator_types` is used to test a Google AcceleratorType resource

## Examples
```
describe google_compute_accelerator_types(project: 'chef-gcp-inspec', zone: 'us-east1-b') do
it { should exist }
it { should be_up }
end
```

## Properties
Properties that can be accessed from the `google_compute_accelerator_types` resource:

See [google_compute_accelerator_type.md](google_compute_accelerator_type.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_accelerator_type` creation_timestamp
  * `deprecateds`: an array of `google_compute_accelerator_type` deprecated
  * `descriptions`: an array of `google_compute_accelerator_type` description
  * `ids`: an array of `google_compute_accelerator_type` id
  * `names`: an array of `google_compute_accelerator_type` name
  * `zones`: an array of `google_compute_accelerator_type` zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
