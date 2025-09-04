+++
title = "google_compute_region_ssl_policies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_region_ssl_policies"
identifier = "inspec/resources/gcp/google_compute_region_ssl_policies Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_region_ssl_policies` is used to test a Google RegionSslPolicy resource

## Examples
```
    describe google_compute_region_ssl_policies(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_region_ssl_policies` resource:

See [google_compute_region_ssl_policy.md](google_compute_region_ssl_policy.md) for more detailed information
  * `kinds`: an array of `google_compute_region_ssl_policy` kind
  * `ids`: an array of `google_compute_region_ssl_policy` id
  * `creation_timestamps`: an array of `google_compute_region_ssl_policy` creation_timestamp
  * `self_links`: an array of `google_compute_region_ssl_policy` self_link
  * `self_link_with_ids`: an array of `google_compute_region_ssl_policy` self_link_with_id
  * `names`: an array of `google_compute_region_ssl_policy` name
  * `descriptions`: an array of `google_compute_region_ssl_policy` description
  * `profiles`: an array of `google_compute_region_ssl_policy` profile
  * `min_tls_versions`: an array of `google_compute_region_ssl_policy` min_tls_version
  * `enabled_features`: an array of `google_compute_region_ssl_policy` enabled_features
  * `custom_features`: an array of `google_compute_region_ssl_policy` custom_features
  * `fingerprints`: an array of `google_compute_region_ssl_policy` fingerprint
  * `warnings`: an array of `google_compute_region_ssl_policy` warnings
  * `tls_settings`: an array of `google_compute_region_ssl_policy` tls_settings
  * `regions`: an array of `google_compute_region_ssl_policy` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
