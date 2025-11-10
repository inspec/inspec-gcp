+++
title = "google_compute_instance_templates resource"

draft = false


[menu.gcp]
title = "google_compute_instance_templates"
identifier = "inspec/resources/gcp/google_compute_instance_templates resource"
parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instance_templates` is used to test a Google InstanceTemplate resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource.

## Examples

```ruby
describe google_compute_instance_templates(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-instance-template' }
end
```

## Properties

Properties that can be accessed from the `google_compute_instance_templates` resource:

See [google_compute_instance_template](google_compute_instance_template) for more detailed information.

  * `creation_timestamps`: an array of `google_compute_instance_template` creation_timestamp
  * `descriptions`: an array of `google_compute_instance_template` description
  * `ids`: an array of `google_compute_instance_template` id
  * `names`: an array of `google_compute_instance_template` name
  * `properties`: an array of `google_compute_instance_template` properties

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
