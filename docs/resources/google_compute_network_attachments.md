---
title: About the google_compute_network_attachments resource
platform: gcp
---

## Syntax
A `google_compute_network_attachments` is used to test a Google NetworkAttachment resource

## Examples
```
    describe google_compute_v1_network_attachments(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_network_attachments` resource:

See [google_compute_network_attachment.md](google_compute_network_attachment.md) for more detailed information
  * `kinds`: an array of `google_compute_network_attachment` kind
  * `ids`: an array of `google_compute_network_attachment` id
  * `creation_timestamps`: an array of `google_compute_network_attachment` creation_timestamp
  * `names`: an array of `google_compute_network_attachment` name
  * `descriptions`: an array of `google_compute_network_attachment` description
  * `self_links`: an array of `google_compute_network_attachment` self_link
  * `self_link_with_ids`: an array of `google_compute_network_attachment` self_link_with_id
  * `regions`: an array of `google_compute_network_attachment` region
  * `connection_preferences`: an array of `google_compute_network_attachment` connection_preference
  * `connection_endpoints`: an array of `google_compute_network_attachment` connection_endpoints
  * `subnetworks`: an array of `google_compute_network_attachment` subnetworks
  * `producer_reject_lists`: an array of `google_compute_network_attachment` producer_reject_lists
  * `producer_accept_lists`: an array of `google_compute_network_attachment` producer_accept_lists
  * `fingerprints`: an array of `google_compute_network_attachment` fingerprint
  * `networks`: an array of `google_compute_network_attachment` network

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
