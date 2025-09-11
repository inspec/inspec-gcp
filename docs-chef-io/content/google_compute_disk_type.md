+++
title = "google_compute_disk_type resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_disk_type"
identifier = "inspec/resources/gcp/google_compute_disk_type resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_disk_type` InSpec audit resource to to test a Google Cloud DiskType resource.

## Examples

```ruby
describe google_compute_disk_type(project: 'chef-gcp-inspec', zone: 'us-east1-b', name: 'disk_type_name') do
  it { should exist }
  it { should be_up }
end
```

## Properties

Properties that can be accessed from the `google_compute_disk_type` resource:


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

  * `zone`: A reference to the zone where the disk type resides.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
