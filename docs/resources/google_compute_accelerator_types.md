---
title: About the google_compute_accelerator_types resource
platform: gcp
---

## Syntax
A `google_compute_accelerator_types` is used to test a Google AcceleratorType resource

## Examples
```
    describe google_compute_v1_accelerator_types(project: 'chef-gcp-inspec', zone: ' ') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_accelerator_types` resource:

See [google_compute_accelerator_type.md](google_compute_accelerator_type.md) for more detailed information
  * `kinds`: an array of `google_compute_accelerator_type` kind
  * `ids`: an array of `google_compute_accelerator_type` id
  * `creation_timestamps`: an array of `google_compute_accelerator_type` creation_timestamp
  * `names`: an array of `google_compute_accelerator_type` name
  * `descriptions`: an array of `google_compute_accelerator_type` description
  * `deprecateds`: an array of `google_compute_accelerator_type` deprecated
  * `zones`: an array of `google_compute_accelerator_type` zone
  * `self_links`: an array of `google_compute_accelerator_type` self_link
  * `maximum_cards_per_instances`: an array of `google_compute_accelerator_type` maximum_cards_per_instance

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
