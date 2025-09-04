+++
title = "google_compute_vpn_gateways resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_vpn_gateways"
identifier = "inspec/resources/gcp/google_compute_vpn_gateways Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_vpn_gateways` is used to test a Google VpnGateway resource

## Examples
```
    describe google_compute_vpn_gateways(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_vpn_gateways` resource:

See [google_compute_vpn_gateway.md](google_compute_vpn_gateway.md) for more detailed information
  * `kinds`: an array of `google_compute_vpn_gateway` kind
  * `ids`: an array of `google_compute_vpn_gateway` id
  * `creation_timestamps`: an array of `google_compute_vpn_gateway` creation_timestamp
  * `names`: an array of `google_compute_vpn_gateway` name
  * `descriptions`: an array of `google_compute_vpn_gateway` description
  * `regions`: an array of `google_compute_vpn_gateway` region
  * `networks`: an array of `google_compute_vpn_gateway` network
  * `self_links`: an array of `google_compute_vpn_gateway` self_link
  * `labels`: an array of `google_compute_vpn_gateway` labels
  * `label_fingerprints`: an array of `google_compute_vpn_gateway` label_fingerprint
  * `vpn_interfaces`: an array of `google_compute_vpn_gateway` vpn_interfaces
  * `stack_types`: an array of `google_compute_vpn_gateway` stack_type

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
