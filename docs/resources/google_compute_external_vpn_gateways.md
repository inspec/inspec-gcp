+++
title = "google_compute_external_vpn_gateways resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_external_vpn_gateways"
identifier = "inspec/resources/gcp/google_compute_external_vpn_gateways Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_external_vpn_gateways` InSpec audit resource to to test a Google Cloud externalVpnGateway resource.

## Examples

```ruby
describe google_compute_external_vpn_gateways(project: 'chef-gcp-inspec') do
it { should exist }
it { should be_up }
end
```

## Properties

Properties that can be accessed from the `google_compute_external_vpn_gateways` resource:

See [google_compute_external_vpn_gateway](google_compute_external_vpn_gateway) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_external_vpn_gateway` creation_timestamp
  * `redundancy_types`: an array of `google_compute_external_vpn_gateway` redundancy_type
  * `interfaces`: an array of `google_compute_external_vpn_gateway` interfaces
  * `labels`: an array of `google_compute_external_vpn_gateway` labels
  * `label_fingerprints`: an array of `google_compute_external_vpn_gateway` label_fingerprint
  * `next_page_tokens`: an array of `google_compute_external_vpn_gateway` next_page_token
  * `descriptions`: an array of `google_compute_external_vpn_gateway` description
  * `ids`: an array of `google_compute_external_vpn_gateway` id
  * `names`: an array of `google_compute_external_vpn_gateway` name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
