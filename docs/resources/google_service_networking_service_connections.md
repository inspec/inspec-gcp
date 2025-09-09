+++
title = "google_service_networking_service_connections resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_service_networking_service_connections"
identifier = "inspec/resources/gcp/google_service_networking_service_connections Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_service_networking_service_connections` InSpec audit resource to to test a Google Cloud service_connection resource.

## Examples

```ruby
    describe google_servicenetworking_service_connections(parent: ' value_parent',network: 'value_network') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_service_networking_service_connections` resource:

See [google_service_networking_service_connection](google_service_networking_service_connection) for more detailed information.

  * `networks`: an array of `google_service_networking_service_connection` network
  * `reserved_peering_ranges`: an array of `google_service_networking_service_connection` reserved_peering_ranges
  * `peerings`: an array of `google_service_networking_service_connection` peering
  * `services`: an array of `google_service_networking_service_connection` service

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [https://servicenetworking.googleapis.com/](https://console.cloud.google.com/apis/library/servicenetworking.googleapis.com/) is enabled for the current project.
