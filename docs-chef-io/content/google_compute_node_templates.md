+++
title = "google_compute_node_templates resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_node_templates"
identifier = "inspec/resources/gcp/google_compute_node_templates resource"
parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_node_templates` is used to test a Google NodeTemplate resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource.

## Examples

```ruby
describe google_compute_node_templates(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('names') { should include 'inspec-node-template' }
end
```

## Properties

Properties that can be accessed from the `google_compute_node_templates` resource:

See [google_compute_node_template](google_compute_node_template) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_node_template` creation_timestamp
  * `descriptions`: an array of `google_compute_node_template` description
  * `names`: an array of `google_compute_node_template` name
  * `node_affinity_labels`: an array of `google_compute_node_template` node_affinity_labels
  * `node_types`: an array of `google_compute_node_template` node_type
  * `node_type_flexibilities`: an array of `google_compute_node_template` node_type_flexibility
  * `server_bindings`: (Beta only) an array of `google_compute_node_template` server_binding
  * `cpu_overcommit_types`: (Beta only) an array of `google_compute_node_template` cpu_overcommit_type
  * `regions`: an array of `google_compute_node_template` region

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
