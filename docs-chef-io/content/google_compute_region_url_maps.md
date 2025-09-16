+++
title = "google_compute_region_url_maps resource"

draft = false


[menu.gcp]
title = "google_compute_region_url_maps"
identifier = "inspec/resources/gcp/google_compute_region_url_maps resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_url_maps` InSpec audit resource to to test a Google Cloud RegionUrlMap resource.

## Examples

```ruby
    describe google_compute_region_url_maps(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_region_url_maps` resource:

See [google_compute_region_url_map](google_compute_region_url_map) for more detailed information.

  * `kinds`: an array of `google_compute_region_url_map` kind
  * `ids`: an array of `google_compute_region_url_map` id
  * `creation_timestamps`: an array of `google_compute_region_url_map` creation_timestamp
  * `names`: an array of `google_compute_region_url_map` name
  * `descriptions`: an array of `google_compute_region_url_map` description
  * `self_links`: an array of `google_compute_region_url_map` self_link
  * `host_rules`: an array of `google_compute_region_url_map` host_rules
  * `path_matchers`: an array of `google_compute_region_url_map` path_matchers
  * `tests`: an array of `google_compute_region_url_map` tests
  * `default_services`: an array of `google_compute_region_url_map` default_service
  * `default_route_actions`: an array of `google_compute_region_url_map` default_route_action
  * `default_url_redirects`: an array of `google_compute_region_url_map` default_url_redirect
  * `header_actions`: an array of `google_compute_region_url_map` header_action
  * `default_custom_error_response_policies`: an array of `google_compute_region_url_map` default_custom_error_response_policy
  * `fingerprints`: an array of `google_compute_region_url_map` fingerprint
  * `regions`: an array of `google_compute_region_url_map` region

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
