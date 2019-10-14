---
title: About the google_compute_node_template resource
platform: gcp
---

## Syntax
A `google_compute_node_template` is used to test a Google NodeTemplate resource

## Examples
```

describe google_compute_node_template(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-node-template') do
  it { should exist }
  its('node_affinity_labels') { should include('key' => 'value') }
end

describe google_compute_node_template(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_node_template` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional textual description of the resource.

  * `name`: Name of the resource.

  * `node_affinity_labels`: Labels to use for node affinity, which will be used in instance scheduling.

  * `node_type`: Node type to use for nodes group that are created from this template. Only one of nodeTypeFlexibility and nodeType can be specified.

  * `node_type_flexibility`: Flexible properties for the desired node type. Node groups that use this node template will create nodes of a type that matches these properties. Only one of nodeTypeFlexibility and nodeType can be specified.

    * `cpus`: Number of virtual CPUs to use.

    * `memory`: Physical memory available to the node, defined in MB.

    * `local_ssd`: Use local SSD

  * `region`: Region where nodes using the node template will be created


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
