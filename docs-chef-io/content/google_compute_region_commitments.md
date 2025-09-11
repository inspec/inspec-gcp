+++
title = "google_compute_region_commitments resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_commitments"
identifier = "inspec/resources/gcp/google_compute_region_commitments resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_commitments` InSpec audit resource to to test a Google Cloud RegionCommitment resource.

## Examples

```ruby
    describe google_compute_region_commitments(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_region_commitments` resource:

See [google_compute_region_commitment](google_compute_region_commitment) for more detailed information.

  * `kinds`: an array of `google_compute_region_commitment` kind
  * `ids`: an array of `google_compute_region_commitment` id
  * `creation_timestamps`: an array of `google_compute_region_commitment` creation_timestamp
  * `names`: an array of `google_compute_region_commitment` name
  * `descriptions`: an array of `google_compute_region_commitment` description
  * `regions`: an array of `google_compute_region_commitment` region
  * `self_links`: an array of `google_compute_region_commitment` self_link
  * `self_link_with_ids`: an array of `google_compute_region_commitment` self_link_with_id
  * `statuses`: an array of `google_compute_region_commitment` status
  * `status_messages`: an array of `google_compute_region_commitment` status_message
  * `plans`: an array of `google_compute_region_commitment` plan
  * `start_timestamps`: an array of `google_compute_region_commitment` start_timestamp
  * `end_timestamps`: an array of `google_compute_region_commitment` end_timestamp
  * `resources`: an array of `google_compute_region_commitment` resources
  * `types`: an array of `google_compute_region_commitment` type
  * `reservations`: an array of `google_compute_region_commitment` reservations
  * `categories`: an array of `google_compute_region_commitment` category
  * `license_resources`: an array of `google_compute_region_commitment` license_resource
  * `auto_renews`: an array of `google_compute_region_commitment` auto_renew
  * `merge_source_commitments`: an array of `google_compute_region_commitment` merge_source_commitments
  * `split_source_commitments`: an array of `google_compute_region_commitment` split_source_commitment
  * `resource_statuses`: an array of `google_compute_region_commitment` resource_status
  * `existing_reservations`: an array of `google_compute_region_commitment` existing_reservations

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
