+++
title = "google_compute_target_https_proxies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_target_https_proxies"
identifier = "inspec/resources/gcp/google_compute_target_https_proxies resource"
parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_https_proxies` is used to test a Google TargetHttpsProxy resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource.

## Examples

```ruby
describe google_compute_target_https_proxies(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-https-proxy' }
  its('descriptions') { should include 'A HTTPS target proxy' }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_https_proxies` resource:

See [google_compute_target_https_proxy](google_compute_target_https_proxy) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_target_https_proxy` creation_timestamp
  * `descriptions`: an array of `google_compute_target_https_proxy` description
  * `ids`: an array of `google_compute_target_https_proxy` id
  * `names`: an array of `google_compute_target_https_proxy` name
  * `quic_overrides`: an array of `google_compute_target_https_proxy` quic_override
  * `ssl_certificates`: an array of `google_compute_target_https_proxy` ssl_certificates
  * `ssl_policies`: an array of `google_compute_target_https_proxy` ssl_policy
  * `url_maps`: an array of `google_compute_target_https_proxy` url_map

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
