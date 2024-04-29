---
title: About the google_compute_target_grpc_proxies resource
platform: gcp
---

## Syntax
A `google_compute_target_grpc_proxies` is used to test a Google TargetGrpcProxy resource

## Examples
```
    describe google_compute_target_grpc_proxies(project: 'chef-gcp-inspec') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_target_grpc_proxies` resource:

See [google_compute_target_grpc_proxy.md](google_compute_target_grpc_proxy.md) for more detailed information
  * `kinds`: an array of `google_compute_target_grpc_proxy` kind
  * `ids`: an array of `google_compute_target_grpc_proxy` id
  * `creation_timestamps`: an array of `google_compute_target_grpc_proxy` creation_timestamp
  * `names`: an array of `google_compute_target_grpc_proxy` name
  * `descriptions`: an array of `google_compute_target_grpc_proxy` description
  * `self_links`: an array of `google_compute_target_grpc_proxy` self_link
  * `self_link_with_ids`: an array of `google_compute_target_grpc_proxy` self_link_with_id
  * `url_maps`: an array of `google_compute_target_grpc_proxy` url_map
  * `validate_for_proxylesses`: an array of `google_compute_target_grpc_proxy` validate_for_proxyless
  * `fingerprints`: an array of `google_compute_target_grpc_proxy` fingerprint

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
