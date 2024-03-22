---
title: About the google_compute_public_advertised_prefixes resource
platform: gcp
---

## Syntax
A `google_compute_public_advertised_prefixes` is used to test a Google PublicAdvertisedPrefix resource

## Examples
```
    describe google_compute_v1_public_advertised_prefixes(project: 'chef-gcp-inspec') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_public_advertised_prefixes` resource:

See [google_compute_public_advertised_prefix.md](google_compute_public_advertised_prefix.md) for more detailed information
  * `kinds`: an array of `google_compute_public_advertised_prefix` kind
  * `ids`: an array of `google_compute_public_advertised_prefix` id
  * `creation_timestamps`: an array of `google_compute_public_advertised_prefix` creation_timestamp
  * `names`: an array of `google_compute_public_advertised_prefix` name
  * `descriptions`: an array of `google_compute_public_advertised_prefix` description
  * `self_links`: an array of `google_compute_public_advertised_prefix` self_link
  * `ip_cidr_ranges`: an array of `google_compute_public_advertised_prefix` ip_cidr_range
  * `dns_verification_ips`: an array of `google_compute_public_advertised_prefix` dns_verification_ip
  * `shared_secrets`: an array of `google_compute_public_advertised_prefix` shared_secret
  * `statuses`: an array of `google_compute_public_advertised_prefix` status
  * `pdp_scopes`: an array of `google_compute_public_advertised_prefix` pdp_scope
  * `public_delegated_prefixs`: an array of `google_compute_public_advertised_prefix` public_delegated_prefixs
  * `fingerprints`: an array of `google_compute_public_advertised_prefix` fingerprint
  * `byoip_api_versions`: an array of `google_compute_public_advertised_prefix` byoip_api_version

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
