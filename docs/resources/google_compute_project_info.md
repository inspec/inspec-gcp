---
title: About the google_compute_project_info resource
platform: gcp
---

## Syntax
A `google_compute_project_info` is used to test a Google ProjectInfo resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_compute_project_info(project: 'chef-gcp-inspec') do
	it { should exist }
	its('default_service_account') { should match "developer.gserviceaccount.com" }
	it { should_not be_has_enabled_oslogin }
end
```

## Properties
Properties that can be accessed from the `google_compute_project_info` resource:


  * `name`: The name of this project

  * `common_instance_metadata`: Metadata shared for all instances in this project

    * `items`: Array of key/values

      * `key`: Key of the metadata key/value pair

      * `value`: Value of the metadata key/value pair

  * `enabled_features`: Restricted features enabled for use on this project

  * `default_service_account`: Default service account used by VMs in this project

  * `xpn_project_status`: The role this project has in a shared VPC configuration.

  * `default_network_tier`: The default network tier used for configuring resources in this project

  * `quotas`: Quotas applied to this project

    * `metric`: Name of the quota metric

    * `limit`: Quota limit for this metric

    * `usage`: Current usage of this metric

    * `owner`: Owning resource. This is the resource on which this quota is applied.

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
