---
title: About the google_compute_region_notification_endpoints resource
platform: gcp
---

## Syntax
A `google_compute_region_notification_endpoints` is used to test a Google RegionNotificationEndpoint resource

## Examples
```
    describe google_compute_region_notification_endpoints(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_region_notification_endpoints` resource:

See [google_compute_region_notification_endpoint.md](google_compute_region_notification_endpoint.md) for more detailed information
  * `kinds`: an array of `google_compute_region_notification_endpoint` kind
  * `ids`: an array of `google_compute_region_notification_endpoint` id
  * `creation_timestamps`: an array of `google_compute_region_notification_endpoint` creation_timestamp
  * `names`: an array of `google_compute_region_notification_endpoint` name
  * `descriptions`: an array of `google_compute_region_notification_endpoint` description
  * `self_links`: an array of `google_compute_region_notification_endpoint` self_link
  * `regions`: an array of `google_compute_region_notification_endpoint` region
  * `grpc_settings`: an array of `google_compute_region_notification_endpoint` grpc_settings

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
