---
title: About the google_compute_licenses resource
platform: gcp
---

## Syntax
A `google_compute_licenses` is used to test a Google License resource

## Examples
```
    describe google_compute_v1_licenses(project: 'chef-gcp-inspec') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_licenses` resource:

See [google_compute_license.md](google_compute_license.md) for more detailed information
  * `names`: an array of `google_compute_license` name
  * `charges_use_fees`: an array of `google_compute_license` charges_use_fee

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
