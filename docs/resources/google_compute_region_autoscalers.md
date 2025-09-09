+++
title = "google_compute_region_autoscalers resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_autoscalers"
identifier = "inspec/resources/gcp/google_compute_region_autoscalers Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_autoscalers` InSpec audit resource to to test a Google Cloud RegionAutoscaler resource.

## Examples

```ruby
  describe google_compute_region_autoscalers(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_region_autoscalers` resource:

See [google_compute_region_autoscaler](google_compute_region_autoscaler) for more detailed information.

  * `kinds`: an array of `google_compute_region_autoscaler` kind
  * `ids`: an array of `google_compute_region_autoscaler` id
  * `creation_timestamps`: an array of `google_compute_region_autoscaler` creation_timestamp
  * `names`: an array of `google_compute_region_autoscaler` name
  * `descriptions`: an array of `google_compute_region_autoscaler` description
  * `targets`: an array of `google_compute_region_autoscaler` target
  * `autoscaling_policies`: an array of `google_compute_region_autoscaler` autoscaling_policy
  * `zones`: an array of `google_compute_region_autoscaler` zone
  * `regions`: an array of `google_compute_region_autoscaler` region
  * `self_links`: an array of `google_compute_region_autoscaler` self_link
  * `self_link_with_ids`: an array of `google_compute_region_autoscaler` self_link_with_id
  * `statuses`: an array of `google_compute_region_autoscaler` status
  * `status_details`: an array of `google_compute_region_autoscaler` status_details
  * `recommended_sizes`: an array of `google_compute_region_autoscaler` recommended_size
  * `scaling_schedule_statuses`: an array of `google_compute_region_autoscaler` scaling_schedule_status

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
