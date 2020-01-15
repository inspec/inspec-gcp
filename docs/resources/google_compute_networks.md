---
title: About the google_compute_networks resource
platform: gcp
---

## Syntax
A `google_compute_networks` is used to test a Google Network resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_compute_networks(project: 'chef-gcp-inspec') do
	its('network_names') { should include 'inspec-network' }
end
```

## Properties
Properties that can be accessed from the `google_compute_networks` resource:

See [google_compute_network.md](google_compute_network.md) for more detailed information
  * `descriptions`: an array of `google_compute_network` description
  * `gateway_ipv4s`: an array of `google_compute_network` gateway_ipv4
  * `network_ids`: an array of `google_compute_network` id
  * `network_names`: an array of `google_compute_network` name
  * `subnetworks`: an array of `google_compute_network` subnetworks
  * `auto_create_subnetworks`: an array of `google_compute_network` auto_create_subnetworks
  * `creation_timestamps`: an array of `google_compute_network` creation_timestamp
  * `routing_configs`: an array of `google_compute_network` routing_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
