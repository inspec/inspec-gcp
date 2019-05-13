---
title: About the google_compute_region_backend_services resource
platform: gcp
---

## Syntax
A `google_compute_region_backend_services` is used to test a Google RegionBackendService resource

## Examples
```
describe google_compute_region_backend_services(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('count') { should be >= 1 }
  its('names') { should include 'inspec-gcp-region-backend-service' }
  its('protocols') { should include 'TCP' }
  its('timeout_secs') { should include '15' }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_backend_services` resource:

See [google_compute_region_backend_service.md](google_compute_region_backend_service.md) for more detailed information
  * `names`: an array of `google_compute_region_backend_service` name
  * `health_checks`: an array of `google_compute_region_backend_service` health_checks
  * `backends`: an array of `google_compute_region_backend_service` backends
  * `descriptions`: an array of `google_compute_region_backend_service` description
  * `fingerprints`: an array of `google_compute_region_backend_service` fingerprint
  * `protocols`: an array of `google_compute_region_backend_service` protocol
  * `session_affinities`: an array of `google_compute_region_backend_service` session_affinity
  * `regions`: an array of `google_compute_region_backend_service` region
  * `timeout_secs`: an array of `google_compute_region_backend_service` timeout_sec
  * `connection_drainings`: an array of `google_compute_region_backend_service` connection_draining
  * `load_balancing_schemes`: an array of `google_compute_region_backend_service` load_balancing_scheme

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
