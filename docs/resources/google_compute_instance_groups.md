---
title: About the google_compute_instance_groups resource
platform: gcp
---

## Syntax
A `google_compute_instance_groups` is used to test a Google InstanceGroup resource

## Examples
```

describe google_compute_instance_groups(project: 'chef-gcp-inspec', zone: 'zone') do
  its('instance_group_names') { should include 'inspec-instance-group' }
end
```

## Properties
Properties that can be accessed from the `google_compute_instance_groups` resource:

See [google_compute_instance_group.md](google_compute_instance_group.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_instance_group` creation_timestamp
  * `descriptions`: an array of `google_compute_instance_group` description
  * `instance_group_ids`: an array of `google_compute_instance_group` id
  * `instance_group_names`: an array of `google_compute_instance_group` name
  * `named_ports`: an array of `google_compute_instance_group` named_ports
  * `networks`: an array of `google_compute_instance_group` network
  * `regions`: an array of `google_compute_instance_group` region
  * `subnetworks`: an array of `google_compute_instance_group` subnetwork
  * `zones`: an array of `google_compute_instance_group` zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
