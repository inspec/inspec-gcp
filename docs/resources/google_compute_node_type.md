---
title: About the google_compute_node_type resource
platform: gcp
---

## Syntax
A `google_compute_node_type` is used to test a Google NodeType resource

## Examples
```
describe google_compute_v1_node_type(nodeType: ' ', project: 'chef-gcp-inspec', zone: ' value_zone') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('cpu_platform') { should cmp 'value_cpuplatform' }
	its('zone') { should cmp 'value_zone' }
	its('self_link') { should cmp 'value_selflink' }

end

describe google_compute_v1_node_type(nodeType: ' ', project: 'chef-gcp-inspec', zone: ' value_zone') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_node_type` resource:


  * `kind`: [Output Only] The type of the resource. Always compute#nodeType for node types.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: [Output Only] Name of the resource.

  * `description`: [Output Only] An optional textual description of the resource.

  * `cpu_platform`: [Output Only] The CPU platform used by this node type.

  * `guest_cpus`: [Output Only] The number of virtual CPUs that are available to the node type.

  * `memory_mb`: [Output Only] The amount of physical memory available to the node type, defined in MB.

  * `local_ssd_gb`: [Output Only] Local SSD available to the node type, defined in GB.

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

  * `zone`: [Output Only] The name of the zone where the node type resides, such as us-central1-a.

  * `self_link`: [Output Only] Server-defined URL for the resource.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
