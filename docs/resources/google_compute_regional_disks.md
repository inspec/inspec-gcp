---
title: About the google_compute_regional_disks resource
platform: gcp
---

## Syntax
A `google_compute_regional_disks` is used to test a Google Regional Disk resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
most_recent_image = google_compute_image(project: 'debian-cloud', name: 'debian-10-buster-v20191014')
describe google_compute_regional_disks(project: 'chef-gcp-inspec', region: 'region') do
  it { should exist }
  its('names') { should include 'inspec-snapshot-disk' }
  its('source_images') { should include most_recent_image.self_link }
end
```

## Properties
Properties that can be accessed from the `google_compute_regional_disks` resource:

See [google_compute_regional_disk.md](google_compute_regional_disk.md) for more detailed information
  * `ids`: an array of `google_compute_regional_disk` id
  * `creation_timestamps`: an array of `google_compute_regional_disk` creation_timestamp
  * `names`: an array of `google_compute_regional_disk` name
  * `descriptions`: an array of `google_compute_regional_disk` description
  * `size_gbs`: an array of `google_compute_regional_disk` size_gb
  * `zones`: an array of `google_compute_zoneal_disk` zone
  * `source_snapshots`: an array of `google_compute_regional_disk` source_snapshot
  * `source_snapshot_encryption_keys`: an array of `google_compute_regional_disk` source_snapshot_encryption_key
  * `source_snapshot_ids`: an array of `google_compute_regional_disk` source_snapshot_id
  * `source_images`: an array of `google_compute_regional_disk` source_image
  * `source_image_ids`: an array of `google_compute_regional_disk` source_image_id
  * `source_image_encryption_keys`: an array of `google_compute_regional_disk` source_image_encryption_key
  * `types`: an array of `google_compute_regional_disk` type
  * `licenses`: an array of `google_compute_regional_disk` licenses
  * `last_attach_timestamps`: an array of `google_compute_regional_disk` last_attach_timestamp
  * `last_detach_timestamps`: an array of `google_compute_regional_disk` last_detach_timestamp
  * `users`: an array of `google_compute_regional_disk` users
  * `disk_encryption_keys`: an array of `google_compute_regional_disk` disk_encryption_key
  * `labels`: an array of `google_compute_regional_disk` labels
  * `label_fingerprints`: an array of `google_compute_regional_disk` label_fingerprint
  * `physical_block_size_bytes`: an array of `google_compute_regional_disk` physical_block_size_bytes
  * `regions`: an array of `google_compute_regional_disk` region
  * `replica_zones`: an array of `google_compute_regional_disk` replica_zone
  * `statuses`: an array of `google_compute_statusal_disk` status

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
