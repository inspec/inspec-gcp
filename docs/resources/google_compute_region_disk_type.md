+++
title = "google_compute_region_disk_type resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_region_disk_type"
identifier = "inspec/resources/gcp/google_compute_region_disk_type Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_region_disk_type` is used to test a Google RegionDiskType resource

## Examples
```
describe google_compute_region_disk_type(disk_type: 'value_name', project: 'chef-gcp-inspec', region: 'value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('valid_disk_size') { should cmp 'value_validdisksize' }
	its('zone') { should cmp 'value_zone' }
	its('self_link') { should cmp 'value_selflink' }
	its('default_disk_size_gb') { should cmp 'value_defaultdisksizegb' }
	its('region') { should cmp 'value_region' }

end

describe google_compute_region_disk_type(disk_type: 'value_name', project: 'chef-gcp-inspec', region: 'value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_disk_type` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#diskType for disk types.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: [Output Only] Name of the resource.

  * `description`: [Output Only] An optional description of this resource.

  * `valid_disk_size`: [Output Only] An optional textual description of the valid disk size, such as "10GB-10TB".

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

  * `zone`: [Output Only] URL of the zone where the disk type resides. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `default_disk_size_gb`: [Output Only] Server-defined default disk size in GB.

  * `region`: [Output Only] URL of the region where the disk type resides. Only applicable for regional resources. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
