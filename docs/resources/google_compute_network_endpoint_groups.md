---
title: About the google_compute_network_endpoint_groups resource
platform: gcp
---

## Syntax
A `google_compute_network_endpoint_groups` is used to test a Google NetworkEndpointGroup resource

## Examples
```

describe google_compute_network_endpoint_groups(project: 'chef-gcp-inspec', zone: 'zone') do
  its('default_ports') { should include '90' }
  its('names') { should include 'inspec-gcp-endpoint-group' }
end
```

## Properties
Properties that can be accessed from the `google_compute_network_endpoint_groups` resource:

See [google_compute_network_endpoint_group.md](google_compute_network_endpoint_group.md) for more detailed information
  * `ids`: an array of `google_compute_network_endpoint_group` id
  * `names`: an array of `google_compute_network_endpoint_group` name
  * `descriptions`: an array of `google_compute_network_endpoint_group` description
  * `network_endpoint_types`: an array of `google_compute_network_endpoint_group` network_endpoint_type
  * `sizes`: an array of `google_compute_network_endpoint_group` size
  * `networks`: an array of `google_compute_network_endpoint_group` network
  * `subnetworks`: an array of `google_compute_network_endpoint_group` subnetwork
  * `default_ports`: an array of `google_compute_network_endpoint_group` default_port
  * `zones`: an array of `google_compute_network_endpoint_group` zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
