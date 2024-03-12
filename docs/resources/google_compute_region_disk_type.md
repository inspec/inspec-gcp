---
title: About the google_compute_region_disk_type resource
platform: gcp
---

## Syntax
A `google_compute_region_disk_type` is used to test a Google RegionDiskType resource

## Examples
```
describe google_compute_region_disk_type(diskType: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }

end

describe google_compute_region_disk_type(diskType: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_disk_type` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `default_disk_size_gb`: Server-defined default disk size in GB.

  * `deprecated`: The deprecation status associated with this disk type.

    * `deleted`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DELETED.

    * `deprecated`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DEPRECATED.

    * `obsolete`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to OBSOLETE.

    * `replacement`: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

    * `state`: The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.
    Possible values:
      * DEPRECATED
      * OBSOLETE
      * DELETED

  * `description`: An optional description of this resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `valid_disk_size`: An optional textual description of the valid disk size, such as "10GB-10TB".

  * `region`: A reference to the region where the disk type resides.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
