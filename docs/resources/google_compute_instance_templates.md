+++
title = "google_compute_instance_templates resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_instance_templates"
identifier = "inspec/resources/gcp/google_compute_instance_templates resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_instance_templates` InSpec audit resource to test the properties of a Google Cloud InstanceTemplate resource.

## Examples

```ruby
    describe google_compute_instance_templates(project: 'chef-gcp-inspec') do
    it { should exist }
  end```

## Parameters

Parameters that can be accessed from the `google_compute_instance_templates` resource:

* `kinds`: an array of `google_compute_instance_template` kind* `ids`: an array of `google_compute_instance_template` id* `creation_timestamps`: an array of `google_compute_instance_template` creation_timestamp* `names`: an array of `google_compute_instance_template` name* `descriptions`: an array of `google_compute_instance_template` description* `properties`: an array of `google_compute_instance_template` properties* `self_links`: an array of `google_compute_instance_template` self_link* `self_link_with_ids`: an array of `google_compute_instance_template` self_link_with_id* `source_instances`: an array of `google_compute_instance_template` source_instance* `source_instance_params`: an array of `google_compute_instance_template` source_instance_params* `regions`: an array of `google_compute_instance_template` region
See the [google_compute_instance_template](google_compute_instance_template) resource for more detailed information.

## Properties

Properties that can be accessed from the `google_compute_instance_templates` resource:

* `kinds`: an array of `google_compute_instance_template` kind* `ids`: an array of `google_compute_instance_template` id* `creation_timestamps`: an array of `google_compute_instance_template` creation_timestamp* `names`: an array of `google_compute_instance_template` name* `descriptions`: an array of `google_compute_instance_template` description* `properties`: an array of `google_compute_instance_template` properties* `self_links`: an array of `google_compute_instance_template` self_link* `self_link_with_ids`: an array of `google_compute_instance_template` self_link_with_id* `source_instances`: an array of `google_compute_instance_template` source_instance* `source_instance_params`: an array of `google_compute_instance_template` source_instance_params* `regions`: an array of `google_compute_instance_template` region
See the [google_compute_instance_template](google_compute_instance_template) resource for more detailed information.

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
