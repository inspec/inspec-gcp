+++
title = "google_compute_node_types resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_node_types"
identifier = "inspec/resources/gcp/google_compute_node_types Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_node_types` is used to test a Google NodeType resource

## Examples
```
    describe google_compute_v1_node_types(project: 'chef-gcp-inspec', zone: ' value_zone') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_node_types` resource:

See [google_compute_node_type.md](google_compute_node_type.md) for more detailed information
  * `kinds`: an array of `google_compute_node_type` kind
  * `ids`: an array of `google_compute_node_type` id
  * `creation_timestamps`: an array of `google_compute_node_type` creation_timestamp
  * `names`: an array of `google_compute_node_type` name
  * `descriptions`: an array of `google_compute_node_type` description
  * `cpu_platforms`: an array of `google_compute_node_type` cpu_platform
  * `guest_cpus`: an array of `google_compute_node_type` guest_cpus
  * `memory_mbs`: an array of `google_compute_node_type` memory_mb
  * `local_ssd_gbs`: an array of `google_compute_node_type` local_ssd_gb
  * `deprecateds`: an array of `google_compute_node_type` deprecated
  * `zones`: an array of `google_compute_node_type` zone
  * `self_links`: an array of `google_compute_node_type` self_link

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
