---
title: About the google_cloudkms_project_location_key_rings resource
platform: gcp
---

## Syntax
A `google_cloudkms_project_location_key_rings` is used to test a Google ProjectLocationKeyRing resource

## Examples
```
    describe google_cloudkms_project_location_key_rings() do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_cloudkms_project_location_key_rings` resource:

See [google_cloudkms_project_location_key_ring.md](google_cloudkms_project_location_key_ring.md) for more detailed information
  * `names`: an array of `google_cloudkms_project_location_key_ring` name
  * `create_times`: an array of `google_cloudkms_project_location_key_ring` create_time

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://cloudkms.googleapis.com/](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
