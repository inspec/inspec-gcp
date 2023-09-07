---
title: About the google_compute_public_delegated_prefixes resource
platform: gcp
---

## Syntax
A `google_compute_public_delegated_prefixes` is used to test a Google PublicDelegatedPrefix resource

## Examples
```
    describe google_compute_public_delegated_prefix(project: 'chef-gcp-inspec', region: ' ') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_public_delegated_prefixes` resource:

See [google_compute_public_delegated_prefix.md](google_compute_public_delegated_prefix.md) for more detailed information
  * `kinds`: an array of `google_compute_public_delegated_prefix` kind
  * `ids`: an array of `google_compute_public_delegated_prefix` id
  * `creation_timestamps`: an array of `google_compute_public_delegated_prefix` creation_timestamp
  * `names`: an array of `google_compute_public_delegated_prefix` name
  * `descriptions`: an array of `google_compute_public_delegated_prefix` description
  * `self_links`: an array of `google_compute_public_delegated_prefix` self_link
  * `regions`: an array of `google_compute_public_delegated_prefix` region
  * `ip_cidr_ranges`: an array of `google_compute_public_delegated_prefix` ip_cidr_range
  * `statuses`: an array of `google_compute_public_delegated_prefix` status
  * `parent_prefixes`: an array of `google_compute_public_delegated_prefix` parent_prefix
  * `public_delegated_sub_prefixs`: an array of `google_compute_public_delegated_prefix` public_delegated_sub_prefixs
  * `is_live_migrations`: an array of `google_compute_public_delegated_prefix` is_live_migration
  * `fingerprints`: an array of `google_compute_public_delegated_prefix` fingerprint

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
