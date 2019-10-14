---
title: About the google_compute_node_group resource
platform: gcp
---

## Syntax
A `google_compute_node_group` is used to test a Google NodeGroup resource

## Examples
```

describe google_compute_node_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-node-group') do
  it { should exist }
  its('description') { should cmp 'A description of the node group' }
  its('size') { should cmp '0' }
end

describe google_compute_node_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_node_group` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional textual description of the resource.

  * `name`: Name of the resource.

  * `node_template`: The URL of the node template to which this node group belongs.

  * `size`: The total number of nodes in the node group.

  * `zone`: Zone where this node group is located


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
