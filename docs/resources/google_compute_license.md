
+++
title = "google_compute_license resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_license"
identifier = "inspec/resources/gcp/google_compute_license Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_license` is used to test a Google License resource

## Examples
```
describe google_compute_license(name: 'value_license_id', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('name') { should cmp 'value_name' }
	its('id') { should cmp 'value_id' }
	its('license_code') { should cmp 'value_licensecode' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
end
describe google_compute_license(name: 'value_license_id', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_license` resource:


  * `kind`: [Output Only] Type of resource. Always compute#license for licenses.

  * `name`: Name of the resource. The name must be 1-63 characters long and comply with RFC1035.

  * `charges_use_fee`: [Output Only] Deprecated. This field no longer reflects whether a license charges a usage fee.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `license_code`: [Output Only] The unique code used to attach this license to images, snapshots, and disks.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `description`: An optional textual description of the resource; provided by the client when the resource is created.

  * `transferable`: If false, licenses will not be copied from the source resource when creating an image from a disk, disk from snapshot, or snapshot from disk.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `resource_requirements`:

    * `min_guest_cpu_count`: Minimum number of guest cpus required to use the Instance. Enforced at Instance creation and Instance start.

    * `min_memory_mb`: Minimum memory required to use the Instance. Enforced at Instance creation and Instance start.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
