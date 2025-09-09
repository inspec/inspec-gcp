+++
title = "google_compute_target_grpc_proxies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_target_grpc_proxies"
identifier = "inspec/resources/gcp/google_compute_target_grpc_proxies Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_target_grpc_proxies` InSpec audit resource to to test a Google Cloud TargetGrpcProxy resource.

## Examples

```ruby
    describe google_compute_target_grpc_proxies(project: 'chef-gcp-inspec') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_target_grpc_proxies` resource:

See [google_compute_target_grpc_proxy](google_compute_target_grpc_proxy) for more detailed information.

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

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
