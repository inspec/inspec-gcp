---
title: About the google_compute_region_health_check_services resource
platform: gcp
---

## Syntax
A `google_compute_region_health_check_services` is used to test a Google RegionHealthCheckService resource

## Examples
```
    describe google_compute_region_health_check_services(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_region_health_check_services` resource:

See [google_compute_region_health_check_service.md](google_compute_region_health_check_service.md) for more detailed information
  * `kinds`: an array of `google_compute_region_health_check_service` kind
  * `ids`: an array of `google_compute_region_health_check_service` id
  * `creation_timestamps`: an array of `google_compute_region_health_check_service` creation_timestamp
  * `self_links`: an array of `google_compute_region_health_check_service` self_link
  * `self_link_with_ids`: an array of `google_compute_region_health_check_service` self_link_with_id
  * `names`: an array of `google_compute_region_health_check_service` name
  * `descriptions`: an array of `google_compute_region_health_check_service` description
  * `regions`: an array of `google_compute_region_health_check_service` region
  * `health_status_aggregation_strategies`: an array of `google_compute_region_health_check_service` health_status_aggregation_strategy
  * `health_status_aggregation_policies`: an array of `google_compute_region_health_check_service` health_status_aggregation_policy
  * `health_checks`: an array of `google_compute_region_health_check_service` health_checks
  * `network_endpoint_groups`: an array of `google_compute_region_health_check_service` network_endpoint_groups
  * `notification_endpoints`: an array of `google_compute_region_health_check_service` notification_endpoints
  * `fingerprints`: an array of `google_compute_region_health_check_service` fingerprint

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
