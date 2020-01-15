---
title: About the google_compute_subnetworks resource
platform: gcp
---

## Syntax
A `google_compute_subnetworks` is used to test a Google Subnetwork resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_compute_subnetworks(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('ip_cidr_ranges') { should include '10.2.0.0/16' }
  its('subnetwork_names') { should include 'inspec-subnet' }
end
```

## Properties
Properties that can be accessed from the `google_compute_subnetworks` resource:

See [google_compute_subnetwork.md](google_compute_subnetwork.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_subnetwork` creation_timestamp
  * `descriptions`: an array of `google_compute_subnetwork` description
  * `gateway_addresses`: an array of `google_compute_subnetwork` gateway_address
  * `subnetwork_ids`: an array of `google_compute_subnetwork` id
  * `ip_cidr_ranges`: an array of `google_compute_subnetwork` ip_cidr_range
  * `subnetwork_names`: an array of `google_compute_subnetwork` name
  * `networks`: an array of `google_compute_subnetwork` network
  * `purposes`: (Beta only) an array of `google_compute_subnetwork` purpose
  * `roles`: (Beta only) an array of `google_compute_subnetwork` role
  * `secondary_ip_ranges`: an array of `google_compute_subnetwork` secondary_ip_ranges
  * `private_ip_google_accesses`: an array of `google_compute_subnetwork` private_ip_google_access
  * `regions`: an array of `google_compute_subnetwork` region
  * `log_configs`: an array of `google_compute_subnetwork` log_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
