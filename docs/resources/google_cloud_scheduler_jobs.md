+++
title = "google_cloud_scheduler_jobs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_cloud_scheduler_jobs"
identifier = "inspec/resources/gcp/google_cloud_scheduler_jobs Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_cloud_scheduler_jobs` InSpec audit resource to to test a Google Cloud Job resource.

## Examples

```ruby
google_cloud_scheduler_jobs(project: 'chef-gcp-inspec', region: ).names.each do |name|
  describe google_cloud_scheduler_job(project: 'chef-gcp-inspec', region: us-central1, name: name) do
	  it { should exist }

	  its('description') { should cmp 'A description' }
	  its('schedule') { should cmp '*/8 * * * *' }
	  its('time_zone') { should cmp 'America/New_York' }
	  its('http_target.http_method') { should cmp 'POST' }
	  its('http_target.uri') { should cmp 'https://example.com/ping' }
	end
end
```

## Properties

Properties that can be accessed from the `google_cloud_scheduler_jobs` resource:

See [google_cloud_scheduler_job](google_cloud_scheduler_job) for more detailed information.

  * `names`: an array of `google_cloud_scheduler_job` name
  * `descriptions`: an array of `google_cloud_scheduler_job` description
  * `schedules`: an array of `google_cloud_scheduler_job` schedule
  * `time_zones`: an array of `google_cloud_scheduler_job` time_zone
  * `states`: an array of `google_cloud_scheduler_job` state
  * `attempt_deadlines`: an array of `google_cloud_scheduler_job` attempt_deadline
  * `retry_configs`: an array of `google_cloud_scheduler_job` retry_config
  * `pubsub_targets`: an array of `google_cloud_scheduler_job` pubsub_target
  * `app_engine_http_targets`: an array of `google_cloud_scheduler_job` app_engine_http_target
  * `http_targets`: an array of `google_cloud_scheduler_job` http_target
  * `regions`: an array of `google_cloud_scheduler_job` region

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Scheduler](https://console.cloud.google.com/apis/library/cloudscheduler.googleapis.com/) is enabled for the current project.
