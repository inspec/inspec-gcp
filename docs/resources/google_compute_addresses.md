---
title: About the google_compute_addresses resource
platform: gcp
---

## Syntax
A `google_compute_addresses` is used to test a Google Address resource

## Examples
```
describe google_compute_addresses(project: 'chef-gcp-inspec', location: 'europe-west2') do
  its('addresses') { should include '10.2.0.3' }
  its('names') { should include 'inspec-gcp-global-address' }
end
```

## Properties
Properties that can be accessed from the `google_compute_addresses` resource:

See [google_compute_address.md](google_compute_address.md) for more detailed information
  * `addresses`: an array of `google_compute_address` address
  * `address_types`: an array of `google_compute_address` address_type
  * `creation_timestamps`: an array of `google_compute_address` creation_timestamp
  * `descriptions`: an array of `google_compute_address` description
  * `ids`: an array of `google_compute_address` id
  * `names`: an array of `google_compute_address` name
  * `purposes`: an array of `google_compute_address` purpose
  * `network_tiers`: an array of `google_compute_address` network_tier
  * `subnetworks`: an array of `google_compute_address` subnetwork
  * `users`: an array of `google_compute_address` users
  * `statuses`: an array of `google_compute_address` status
  * `regions`: an array of `google_compute_address` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
