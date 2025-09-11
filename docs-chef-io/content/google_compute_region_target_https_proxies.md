+++
title = "google_compute_region_target_https_proxies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_target_https_proxies"
identifier = "inspec/resources/gcp/google_compute_region_target_https_proxies resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_target_https_proxies` InSpec audit resource to to test a Google Cloud RegionTargetHttpsProxy resource.

## Examples

```ruby
    describe google_compute_region_target_https_proxies(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_region_target_https_proxies` resource:

See [google_compute_region_target_https_proxy](google_compute_region_target_https_proxy) for more detailed information.

  * `kinds`: an array of `google_compute_region_target_https_proxy` kind
  * `ids`: an array of `google_compute_region_target_https_proxy` id
  * `creation_timestamps`: an array of `google_compute_region_target_https_proxy` creation_timestamp
  * `names`: an array of `google_compute_region_target_https_proxy` name
  * `descriptions`: an array of `google_compute_region_target_https_proxy` description
  * `self_links`: an array of `google_compute_region_target_https_proxy` self_link
  * `self_link_with_ids`: an array of `google_compute_region_target_https_proxy` self_link_with_id
  * `url_maps`: an array of `google_compute_region_target_https_proxy` url_map
  * `ssl_certificates`: an array of `google_compute_region_target_https_proxy` ssl_certificates
  * `certificate_maps`: an array of `google_compute_region_target_https_proxy` certificate_map
  * `quic_overrides`: an array of `google_compute_region_target_https_proxy` quic_override
  * `ssl_policies`: an array of `google_compute_region_target_https_proxy` ssl_policy
  * `regions`: an array of `google_compute_region_target_https_proxy` region
  * `proxy_binds`: an array of `google_compute_region_target_https_proxy` proxy_bind
  * `http_filters`: an array of `google_compute_region_target_https_proxy` http_filters
  * `server_tls_policies`: an array of `google_compute_region_target_https_proxy` server_tls_policy
  * `authentications`: an array of `google_compute_region_target_https_proxy` authentication
  * `authorization_policies`: an array of `google_compute_region_target_https_proxy` authorization_policy
  * `authorizations`: an array of `google_compute_region_target_https_proxy` authorization
  * `fingerprints`: an array of `google_compute_region_target_https_proxy` fingerprint
  * `http_keep_alive_timeout_secs`: an array of `google_compute_region_target_https_proxy` http_keep_alive_timeout_sec
  * `tls_early_data`: an array of `google_compute_region_target_https_proxy` tls_early_data

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
