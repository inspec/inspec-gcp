---
title: About the google_compute_projects resource
platform: gcp
---

## Syntax
A `google_compute_projects` is used to test a Google Project resource

## Examples
```
    describe google_compute_projects(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_projects` resource:

See [google_compute_project.md](google_compute_project.md) for more detailed information
  * `kinds`: an array of `google_compute_project` kind
  * `ids`: an array of `google_compute_project` id
  * `creation_timestamps`: an array of `google_compute_project` creation_timestamp
  * `names`: an array of `google_compute_project` name
  * `descriptions`: an array of `google_compute_project` description
  * `common_instance_metadata`: an array of `google_compute_project` common_instance_metadata
  * `quotas`: an array of `google_compute_project` quotas
  * `usage_export_locations`: an array of `google_compute_project` usage_export_location
  * `enabled_features`: an array of `google_compute_project` enabled_features
  * `self_links`: an array of `google_compute_project` self_link
  * `default_service_accounts`: an array of `google_compute_project` default_service_account
  * `xpn_project_statuses`: an array of `google_compute_project` xpn_project_status
  * `default_network_tiers`: an array of `google_compute_project` default_network_tier
  * `vm_dns_settings`: an array of `google_compute_project` vm_dns_setting

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
