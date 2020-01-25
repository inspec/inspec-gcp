---
title: About the google_dns_managed_zones resource
platform: gcp
---

## Syntax
A `google_dns_managed_zones` is used to test a Google ManagedZone resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_dns_managed_zones(project: 'chef-gcp-inspec') do
  it { should exist }
  its('zone_names') { should include 'example-zone' }
  its('zone_dns_names') { should include 'dns-zone-name.com.' }
end
```

## Properties
Properties that can be accessed from the `google_dns_managed_zones` resource:

See [google_dns_managed_zone.md](google_dns_managed_zone.md) for more detailed information
  * `descriptions`: an array of `google_dns_managed_zone` description
  * `zone_dns_names`: an array of `google_dns_managed_zone` dns_name
  * `dnssec_configs`: an array of `google_dns_managed_zone` dnssec_config
  * `zone_ids`: an array of `google_dns_managed_zone` id
  * `zone_names`: an array of `google_dns_managed_zone` name
  * `name_servers`: an array of `google_dns_managed_zone` name_servers
  * `name_server_sets`: an array of `google_dns_managed_zone` name_server_set
  * `creation_times`: an array of `google_dns_managed_zone` creation_time
  * `labels`: an array of `google_dns_managed_zone` labels
  * `visibilities`: an array of `google_dns_managed_zone` visibility
  * `private_visibility_configs`: an array of `google_dns_managed_zone` private_visibility_config
  * `forwarding_configs`: (Beta only) an array of `google_dns_managed_zone` forwarding_config
  * `peering_configs`: (Beta only) an array of `google_dns_managed_zone` peering_config
  * `reverse_lookups`: (Beta only) an array of `google_dns_managed_zone` reverse_lookup

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Google Cloud DNS API](https://console.cloud.google.com/apis/library/dns.googleapis.com/) is enabled for the current project.
