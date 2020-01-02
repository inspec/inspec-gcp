---
title: About the google_compute_region_instance_group_managers resource
platform: gcp
---

## Syntax
A `google_compute_region_instance_group_managers` is used to test a Google RegionInstanceGroupManager resource

## Examples
```
describe google_compute_region_instance_group_managers(project: 'chef-gcp-inspec', region: 'europe-west2') do
	its('instance_group_manager_names') { should include 'inspec-rigm' }
  its('base_instance_names') { should include 'rigm1' }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_instance_group_managers` resource:

See [google_compute_region_instance_group_manager.md](google_compute_region_instance_group_manager.md) for more detailed information
  * `base_instance_names`: an array of `google_compute_region_instance_group_manager` base_instance_name
  * `creation_timestamps`: an array of `google_compute_region_instance_group_manager` creation_timestamp
  * `current_actions`: an array of `google_compute_region_instance_group_manager` current_actions
  * `descriptions`: an array of `google_compute_region_instance_group_manager` description
  * `instance_group_manager_ids`: an array of `google_compute_region_instance_group_manager` id
  * `instance_groups`: an array of `google_compute_region_instance_group_manager` instance_group
  * `instance_templates`: an array of `google_compute_region_instance_group_manager` instance_template
  * `instance_group_manager_names`: an array of `google_compute_region_instance_group_manager` name
  * `named_ports`: an array of `google_compute_region_instance_group_manager` named_ports
  * `target_pools`: an array of `google_compute_region_instance_group_manager` target_pools
  * `target_sizes`: an array of `google_compute_region_instance_group_manager` target_size
  * `auto_healing_policies`: an array of `google_compute_region_instance_group_manager` auto_healing_policies
  * `regions`: an array of `google_compute_region_instance_group_manager` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
