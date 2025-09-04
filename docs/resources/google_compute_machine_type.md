+++
title = "google_compute_machine_type resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_machine_type"
identifier = "inspec/resources/gcp/google_compute_machine_type Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_machine_type` is used to test a Google MachineType resource

## Examples
```
describe google_compute_machine_type(name: 'value_name', project: 'chef-gcp-inspec', zone: ' value_zone') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('maximum_persistent_disks_size_gb') { should cmp 'value_maximumpersistentdiskssizegb' }
	its('zone') { should cmp 'value_zone' }
	its('self_link') { should cmp 'value_selflink' }

end

describe google_compute_machine_type(name: 'value_name', project: 'chef-gcp-inspec', zone: ' value_zone') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_machine_type` resource:


  * `kind`: [Output Only] The type of the resource. Always compute#machineType for machine types.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: [Output Only] Name of the resource.

  * `description`: [Output Only] An optional textual description of the resource.

  * `guest_cpus`: [Output Only] The number of virtual CPUs that are available to the instance.

  * `memory_mb`: [Output Only] The amount of physical memory available to the instance, defined in MB.

  * `image_space_gb`: [Deprecated] This property is deprecated and will never be populated with any relevant values.

  * `scratch_disks`: [Output Only] A list of extended scratch disks assigned to the instance.

    * `disk_gb`: Size of the scratch disk, defined in GB.

  * `maximum_persistent_disks`: [Output Only] Maximum persistent disks allowed.

  * `maximum_persistent_disks_size_gb`: [Output Only] Maximum total persistent disks size (GB) allowed.

  * `deprecated`: Deprecation status for a public resource.

    * `state`: The deprecation state of this resource. This can be ACTIVE, DEPRECATED, OBSOLETE, or DELETED. Operations which communicate the end of life date for an image, can use ACTIVE. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.
    Possible values:
      * ACTIVE
      * DELETED
      * DEPRECATED
      * OBSOLETE

    * `replacement`: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

    * `deprecated`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DEPRECATED. This is only informational and the status will not change unless the client explicitly changes it.

    * `obsolete`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to OBSOLETE. This is only informational and the status will not change unless the client explicitly changes it.

    * `deleted`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DELETED. This is only informational and the status will not change unless the client explicitly changes it.

  * `zone`: [Output Only] The name of the zone where the machine type resides, such as us-central1-a.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `is_shared_cpu`: [Output Only] Whether this machine type has a shared CPU. See Shared-core machine types for more information.

  * `accelerators`: [Output Only] A list of accelerator configurations assigned to this machine type.

    * `guest_accelerator_type`: The accelerator type resource name, not a full URL, e.g. nvidia-tesla-t4.

    * `guest_accelerator_count`: Number of accelerator cards exposed to the guest.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
