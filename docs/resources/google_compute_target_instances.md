+++
title = "google_compute_target_instances resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_target_instances"
identifier = "inspec/resources/gcp/google_compute_target_instances Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_target_instances` InSpec audit resource to to test a Google Cloud TargetInstance resource.

## Examples

```ruby
    describe google_compute_target_instances(project: 'chef-gcp-inspec', zone: ' value_zone') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_target_instances` resource:

See [google_compute_target_instance](google_compute_target_instance) for more detailed information.

  * `kinds`: an array of `google_compute_target_instance` kind
  * `ids`: an array of `google_compute_target_instance` id
  * `creation_timestamps`: an array of `google_compute_target_instance` creation_timestamp
  * `names`: an array of `google_compute_target_instance` name
  * `descriptions`: an array of `google_compute_target_instance` description
  * `zones`: an array of `google_compute_target_instance` zone
  * `nat_policies`: an array of `google_compute_target_instance` nat_policy
  * `instances`: an array of `google_compute_target_instance` instance
  * `self_links`: an array of `google_compute_target_instance` self_link
  * `self_link_with_ids`: an array of `google_compute_target_instance` self_link_with_id
  * `networks`: an array of `google_compute_target_instance` network
  * `security_policies`: an array of `google_compute_target_instance` security_policy

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
