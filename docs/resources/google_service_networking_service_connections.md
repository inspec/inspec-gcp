---
title: About the google_service_networking_service_connections resource
platform: gcp
---

## Syntax
A `google_service_networking_service_connections` is used to test a Google service_connection resource

## Examples
```
    describe google_servicenetworking_service_connections(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_service_networking_service_connections` resource:

See [google_service_networking_service_connection.md](google_service_networking_service_connection.md) for more detailed information
  * `networks`: an array of `google_service_networking_service_connection` network
  * `reserved_peering_ranges`: an array of `google_service_networking_service_connection` reserved_peering_ranges
  * `peerings`: an array of `google_service_networking_service_connection` peering
  * `services`: an array of `google_service_networking_service_connection` service

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://servicenetworking.googleapis.com/](https://console.cloud.google.com/apis/library/servicenetworking.googleapis.com/) is enabled for the current project.
