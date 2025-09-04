+++
title = "google_compute_region_network_endpoint_groups resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_region_network_endpoint_groups"
identifier = "inspec/resources/gcp/google_compute_region_network_endpoint_groups Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_region_network_endpoint_groups` is used to test a Google RegionNetworkEndpointGroup resource

## Examples
```
    describe google_compute_region_network_endpoint_groups(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_region_network_endpoint_groups` resource:

See [google_compute_region_network_endpoint_group.md](google_compute_region_network_endpoint_group.md) for more detailed information
  * `kinds`: an array of `google_compute_region_network_endpoint_group` kind
  * `ids`: an array of `google_compute_region_network_endpoint_group` id
  * `creation_timestamps`: an array of `google_compute_region_network_endpoint_group` creation_timestamp
  * `self_links`: an array of `google_compute_region_network_endpoint_group` self_link
  * `names`: an array of `google_compute_region_network_endpoint_group` name
  * `descriptions`: an array of `google_compute_region_network_endpoint_group` description
  * `network_endpoint_types`: an array of `google_compute_region_network_endpoint_group` network_endpoint_type
  * `sizes`: an array of `google_compute_region_network_endpoint_group` size
  * `regions`: an array of `google_compute_region_network_endpoint_group` region
  * `zones`: an array of `google_compute_region_network_endpoint_group` zone
  * `networks`: an array of `google_compute_region_network_endpoint_group` network
  * `subnetworks`: an array of `google_compute_region_network_endpoint_group` subnetwork
  * `default_ports`: an array of `google_compute_region_network_endpoint_group` default_port
  * `annotations`: an array of `google_compute_region_network_endpoint_group` annotations
  * `cloud_runs`: an array of `google_compute_region_network_endpoint_group` cloud_run
  * `app_engines`: an array of `google_compute_region_network_endpoint_group` app_engine
  * `cloud_functions`: an array of `google_compute_region_network_endpoint_group` cloud_function
  * `psc_target_services`: an array of `google_compute_region_network_endpoint_group` psc_target_service
  * `psc_data`: an array of `google_compute_region_network_endpoint_group` psc_data

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
