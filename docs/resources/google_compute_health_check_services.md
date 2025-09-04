+++
title = "google_compute_health_check_services resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_health_check_services"
identifier = "inspec/resources/gcp/google_compute_health_check_services Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_health_check_services` is used to test a Google HealthCheckService resource

## Examples
```
describe google_compute_health_check_services(project: 'chef-gcp-inspec', region: 'us-central1') do
	it { should exist }
	its('names') { should include 'instance-group-2' }
	its('health_status_aggregation_policies') { should include 'NO_AGGREGATION' }
end
```

## Properties
Properties that can be accessed from the `google_compute_health_check_services` resource:

See [google_compute_health_check_service.md](google_compute_health_check_service.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_health_check_service` creation_timestamp
  * `descriptions`: an array of `google_compute_health_check_service` description
  * `ids`: an array of `google_compute_health_check_service` id
  * `names`: an array of `google_compute_health_check_service` name
  * `health_status_aggregation_policies`: an array of `google_compute_health_check_service` health_status_aggregation_policy
  * `health_checks`: an array of `google_compute_health_check_service` health_checks
  * `network_endpoint_groups`: an array of `google_compute_health_check_service` network_endpoint_groups
  * `notification_endpoints`: an array of `google_compute_health_check_service` notification_endpoints
  * `fingerprints`: an array of `google_compute_health_check_service` fingerprint
  * `next_page_tokens`: an array of `google_compute_health_check_service` next_page_token

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
