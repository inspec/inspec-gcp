---
title: About the google_compute_service_attachments resource
platform: gcp
---

## Syntax
A `google_compute_service_attachments` is used to test a Google ServiceAttachment resource

## Examples
```
    describe google_compute_service_attachments(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_service_attachments` resource:

See [google_compute_service_attachment.md](google_compute_service_attachment.md) for more detailed information
  * `kinds`: an array of `google_compute_service_attachment` kind
  * `ids`: an array of `google_compute_service_attachment` id
  * `creation_timestamps`: an array of `google_compute_service_attachment` creation_timestamp
  * `names`: an array of `google_compute_service_attachment` name
  * `descriptions`: an array of `google_compute_service_attachment` description
  * `self_links`: an array of `google_compute_service_attachment` self_link
  * `regions`: an array of `google_compute_service_attachment` region
  * `producer_forwarding_rules`: an array of `google_compute_service_attachment` producer_forwarding_rule
  * `target_services`: an array of `google_compute_service_attachment` target_service
  * `connection_preferences`: an array of `google_compute_service_attachment` connection_preference
  * `connected_endpoints`: an array of `google_compute_service_attachment` connected_endpoints
  * `nat_subnets`: an array of `google_compute_service_attachment` nat_subnets
  * `enable_proxy_protocols`: an array of `google_compute_service_attachment` enable_proxy_protocol
  * `consumer_reject_lists`: an array of `google_compute_service_attachment` consumer_reject_lists
  * `consumer_accept_lists`: an array of `google_compute_service_attachment` consumer_accept_lists
  * `psc_service_attachment_ids`: an array of `google_compute_service_attachment` psc_service_attachment_id
  * `fingerprints`: an array of `google_compute_service_attachment` fingerprint
  * `domain_names`: an array of `google_compute_service_attachment` domain_names
  * `reconcile_connections`: an array of `google_compute_service_attachment` reconcile_connections
  * `tunneling_configs`: an array of `google_compute_service_attachment` tunneling_config
  * `propagated_connection_limits`: an array of `google_compute_service_attachment` propagated_connection_limit

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
