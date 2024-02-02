---
title: About the google_compute_accelerator_type resource
platform: gcp
---

## Syntax
A `google_compute_accelerator_type` is used to test a Google AcceleratorType resource

## Examples
```
describe google_compute_v1_accelerator_type(acceleratorType: ' ', project: 'chef-gcp-inspec', zone: ' ') do
	it { should exist }
	its('kind') { should cmp '' }
	its('id') { should cmp '' }
	its('creation_timestamp') { should cmp '' }
	its('name') { should cmp 'accelerator_id' }
	its('description') { should cmp '' }
	its('zone') { should cmp '' }
	its('self_link') { should cmp '' }

end

describe google_compute_v1_accelerator_type(acceleratorType: ' ', project: 'chef-gcp-inspec', zone: ' ') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_accelerator_type` resource:


  * `kind`: [Output Only] The type of the resource. Always compute#acceleratorType for accelerator types.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: [Output Only] Name of the resource.

  * `description`: [Output Only] An optional textual description of the resource.

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

  * `zone`: [Output Only] The name of the zone where the accelerator type resides, such as us-central1-a. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `self_link`: [Output Only] Server-defined, fully qualified URL for this resource.

  * `maximum_cards_per_instance`: [Output Only] Maximum number of accelerator cards allowed per instance.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
