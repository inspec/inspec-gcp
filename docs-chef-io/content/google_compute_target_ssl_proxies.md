+++
title = "google_compute_target_ssl_proxies resource"

draft = false


[menu.gcp]
title = "google_compute_target_ssl_proxies"
identifier = "inspec/resources/gcp/google_compute_target_ssl_proxies resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_target_ssl_proxies` InSpec audit resource to to test a Google Cloud TargetSslProxy resource.

## Examples

```ruby
    describe google_compute_target_ssl_proxies(project: 'chef-gcp-inspec') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_target_ssl_proxies` resource:

See [google_compute_target_ssl_proxy](google_compute_target_ssl_proxy) for more detailed information.

  * `kinds`: an array of `google_compute_target_ssl_proxy` kind
  * `ids`: an array of `google_compute_target_ssl_proxy` id
  * `creation_timestamps`: an array of `google_compute_target_ssl_proxy` creation_timestamp
  * `names`: an array of `google_compute_target_ssl_proxy` name
  * `descriptions`: an array of `google_compute_target_ssl_proxy` description
  * `self_links`: an array of `google_compute_target_ssl_proxy` self_link
  * `services`: an array of `google_compute_target_ssl_proxy` service
  * `ssl_certificates`: an array of `google_compute_target_ssl_proxy` ssl_certificates
  * `certificate_maps`: an array of `google_compute_target_ssl_proxy` certificate_map
  * `proxy_headers`: an array of `google_compute_target_ssl_proxy` proxy_header
  * `ssl_policies`: an array of `google_compute_target_ssl_proxy` ssl_policy

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
