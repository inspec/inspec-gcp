---
title: About the google_compute_packet_mirrorings resource
platform: gcp
---

## Syntax
A `google_compute_packet_mirrorings` is used to test a Google PacketMirroring resource

## Examples
```
    describe google_compute_packet_mirrorings(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_packet_mirrorings` resource:

See [google_compute_packet_mirroring.md](google_compute_packet_mirroring.md) for more detailed information
  * `kinds`: an array of `google_compute_packet_mirroring` kind
  * `ids`: an array of `google_compute_packet_mirroring` id
  * `creation_timestamps`: an array of `google_compute_packet_mirroring` creation_timestamp
  * `self_links`: an array of `google_compute_packet_mirroring` self_link
  * `self_link_with_ids`: an array of `google_compute_packet_mirroring` self_link_with_id
  * `names`: an array of `google_compute_packet_mirroring` name
  * `descriptions`: an array of `google_compute_packet_mirroring` description
  * `regions`: an array of `google_compute_packet_mirroring` region
  * `networks`: an array of `google_compute_packet_mirroring` network
  * `priorities`: an array of `google_compute_packet_mirroring` priority
  * `collector_ilbs`: an array of `google_compute_packet_mirroring` collector_ilb
  * `mirrored_resources`: an array of `google_compute_packet_mirroring` mirrored_resources
  * `filters`: an array of `google_compute_packet_mirroring` filter
  * `enables`: an array of `google_compute_packet_mirroring` enable

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
