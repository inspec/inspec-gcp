+++
title = "google_compute_reservations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_reservations"
identifier = "inspec/resources/gcp/google_compute_reservations Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_reservations` InSpec audit resource to to test a Google Cloud Reservation resource.

## Examples

```ruby
    describe google_compute_reservations(project: 'chef-gcp-inspec', zone: ' value_zone') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_reservations` resource:

See [google_compute_reservation](google_compute_reservation) for more detailed information.

  * `kinds`: an array of `google_compute_reservation` kind
  * `ids`: an array of `google_compute_reservation` id
  * `creation_timestamps`: an array of `google_compute_reservation` creation_timestamp
  * `self_links`: an array of `google_compute_reservation` self_link
  * `self_link_with_ids`: an array of `google_compute_reservation` self_link_with_id
  * `zones`: an array of `google_compute_reservation` zone
  * `descriptions`: an array of `google_compute_reservation` description
  * `names`: an array of `google_compute_reservation` name
  * `specific_reservations`: an array of `google_compute_reservation` specific_reservation
  * `aggregate_reservations`: an array of `google_compute_reservation` aggregate_reservation
  * `commitments`: an array of `google_compute_reservation` commitment
  * `specific_reservation_requireds`: an array of `google_compute_reservation` specific_reservation_required
  * `statuses`: an array of `google_compute_reservation` status
  * `share_settings`: an array of `google_compute_reservation` share_settings
  * `satisfies_pzs`: an array of `google_compute_reservation` satisfies_pzs
  * `resource_policies`: an array of `google_compute_reservation` resource_policies
  * `resource_statuses`: an array of `google_compute_reservation` resource_status
  * `delete_at_times`: an array of `google_compute_reservation` delete_at_time
  * `delete_after_durations`: an array of `google_compute_reservation` delete_after_duration

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
