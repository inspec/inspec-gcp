+++
title = "google_compute_accelerator_type resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_accelerator_type"
identifier = "inspec/resources/gcp/google_compute_accelerator_type Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_accelerator_type` is used to test a Google AcceleratorType resource

## Examples
```
describe google_compute_accelerator_type(project: 'chef-gcp-inspec', zone: 'us-east1-b', name: 'accelerator_id') do
  it { should exist }
  it { should be_up }
end
```

## Properties
Properties that can be accessed from the `google_compute_accelerator_type` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `deprecated`: The deprecation status associated with this accelerator type.

    * `state`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DELETED. This is only informational and the status will not change unless the client explicitly changes it.

    * `deprecated`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DEPRECATED. This is only informational and the status will not change unless the client explicitly changes it.

    * `obsolete`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to OBSOLETE. This is only informational and the status will not change unless the client explicitly changes it.

    * `replacement`: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

    * `state`: The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.
    Possible values:
      * DEPRECATED
      * OBSOLETE
      * DELETED

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `zone`: The name of the zone where the accelerator type resides.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
