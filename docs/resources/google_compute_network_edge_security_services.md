---
title: About the google_compute_network_edge_security_services resource
platform: gcp
---

## Syntax
A `google_compute_network_edge_security_services` is used to test a Google NetworkEdgeSecurityService resource

## Examples
```
    describe google_compute_v1_network_edge_security_services() do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_network_edge_security_services` resource:

See [google_compute_network_edge_security_service.md](google_compute_network_edge_security_service.md) for more detailed information
  * `kinds`: an array of `google_compute_network_edge_security_service` kind
  * `ids`: an array of `google_compute_network_edge_security_service` id
  * `creation_timestamps`: an array of `google_compute_network_edge_security_service` creation_timestamp
  * `names`: an array of `google_compute_network_edge_security_service` name
  * `descriptions`: an array of `google_compute_network_edge_security_service` description
  * `self_links`: an array of `google_compute_network_edge_security_service` self_link
  * `self_link_with_ids`: an array of `google_compute_network_edge_security_service` self_link_with_id
  * `regions`: an array of `google_compute_network_edge_security_service` region
  * `fingerprints`: an array of `google_compute_network_edge_security_service` fingerprint
  * `security_policies`: an array of `google_compute_network_edge_security_service` security_policy

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
