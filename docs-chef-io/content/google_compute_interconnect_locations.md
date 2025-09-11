+++
title = "google_compute_interconnect_locations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_interconnect_locations"
identifier = "inspec/resources/gcp/google_compute_interconnect_locations resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_interconnect_locations` InSpec audit resource to to test a Google Cloud InterconnectLocation resource.

## Examples

```ruby
describe google_compute_interconnect_locations(project: 'chef-gcp-inspec') do
  its('names') { should include 'akl-zone1-1353' }
  its('facility_provider_facility_ids') { should include 'Auckland - Albany' }
end
```

## Properties

Properties that can be accessed from the `google_compute_interconnect_locations` resource:

See [google_compute_interconnect_location](google_compute_interconnect_location) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_interconnect_location` creation_timestamp
  * `descriptions`: an array of `google_compute_interconnect_location` description
  * `ids`: an array of `google_compute_interconnect_location` id
  * `names`: an array of `google_compute_interconnect_location` name
  * `availability_zones`: an array of `google_compute_interconnect_location` availability_zone
  * `client_operation_ids`: an array of `google_compute_interconnect_location` client_operation_id
  * `facility_providers`: an array of `google_compute_interconnect_location` facility_provider
  * `facility_provider_facility_ids`: an array of `google_compute_interconnect_location` facility_provider_facility_id
  * `statuses`: an array of `google_compute_interconnect_location` status

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
