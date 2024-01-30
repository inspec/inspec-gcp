---
title: About the google_compute_licenses resource
platform: gcp
---

## Syntax
A `google_compute_licenses` is used to test a Google License resource

## Examples
```
  describe google_compute_licenses(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_licenses` resource:

See [google_compute_license.md](google_compute_license.md) for more detailed information
  * `kinds`: an array of `google_compute_license` kind
  * `names`: an array of `google_compute_license` name
  * `charges_use_fees`: an array of `google_compute_license` charges_use_fee
  * `ids`: an array of `google_compute_license` id
  * `license_codes`: an array of `google_compute_license` license_code
  * `creation_timestamps`: an array of `google_compute_license` creation_timestamp
  * `descriptions`: an array of `google_compute_license` description
  * `transferables`: an array of `google_compute_license` transferable
  * `self_links`: an array of `google_compute_license` self_link
  * `resource_requirements`: an array of `google_compute_license` resource_requirements

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
