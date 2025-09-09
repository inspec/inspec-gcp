+++
title = "google_compute_region_target_http_proxies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_target_http_proxies"
identifier = "inspec/resources/gcp/google_compute_region_target_http_proxies Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_target_http_proxies` InSpec audit resource to to test a Google Cloud RegionTargetHttpProxy resource.

## Examples

```ruby
    describe google_compute_region_target_http_proxies(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_region_target_http_proxies` resource:

See [google_compute_region_target_http_proxy](google_compute_region_target_http_proxy) for more detailed information.

  * `kinds`: an array of `google_compute_region_target_http_proxy` kind
  * `ids`: an array of `google_compute_region_target_http_proxy` id
  * `creation_timestamps`: an array of `google_compute_region_target_http_proxy` creation_timestamp
  * `names`: an array of `google_compute_region_target_http_proxy` name
  * `descriptions`: an array of `google_compute_region_target_http_proxy` description
  * `self_links`: an array of `google_compute_region_target_http_proxy` self_link
  * `self_link_with_ids`: an array of `google_compute_region_target_http_proxy` self_link_with_id
  * `url_maps`: an array of `google_compute_region_target_http_proxy` url_map
  * `regions`: an array of `google_compute_region_target_http_proxy` region
  * `proxy_binds`: an array of `google_compute_region_target_http_proxy` proxy_bind
  * `http_filters`: an array of `google_compute_region_target_http_proxy` http_filters
  * `fingerprints`: an array of `google_compute_region_target_http_proxy` fingerprint
  * `http_keep_alive_timeout_secs`: an array of `google_compute_region_target_http_proxy` http_keep_alive_timeout_sec

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
