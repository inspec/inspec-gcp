---
title: About the google_compute_public_delegated_prefixes resource
platform: gcp
---

## Syntax
A `google_compute_public_delegated_prefixes` is used to test a Google PublicDelegatedPrefix resource

## Examples
```
describe google_compute_public_delegated_prefixes(project: 'chef-gcp-inspec', region: 'us-east1-b') do
  it { should exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_public_delegated_prefixes` resource:

See [google_compute_public_delegated_prefix.md](google_compute_public_delegated_prefix.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_public_delegated_prefix` creation_timestamp
  * `descriptions`: an array of `google_compute_public_delegated_prefix` description
  * `ids`: an array of `google_compute_public_delegated_prefix` id
  * `names`: an array of `google_compute_public_delegated_prefix` name
  * `ip_cidr_ranges`: an array of `google_compute_public_delegated_prefix` ip_cidr_range
  * `parent_prefixes`: an array of `google_compute_public_delegated_prefix` parent_prefix
  * `is_live_migrations`: an array of `google_compute_public_delegated_prefix` is_live_migration
  * `fingerprints`: an array of `google_compute_public_delegated_prefix` fingerprint
  * `statuses`: an array of `google_compute_public_delegated_prefix` status
  * `public_delegated_sub_prefixs`: an array of `google_compute_public_delegated_prefix` public_delegated_sub_prefixs

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
