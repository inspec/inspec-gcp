+++
title = "google_vertex_ai_schedules resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_schedules"
identifier = "inspec/resources/gcp/google_vertex_ai_schedules resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_schedules` InSpec audit resource to to test a Google Cloud Schedule resource.

## Examples

```ruby
    describe google_vertex_ai_schedules(parent: "projects/#{gcp_project_id}/locations/#{schedule['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_schedules` resource:

See [google_vertex_ai_schedule](google_vertex_ai_schedule) for more detailed information.

  * `started_run_counts`: an array of `google_vertex_ai_schedule` started_run_count
  * `allow_queueings`: an array of `google_vertex_ai_schedule` allow_queueing
  * `names`: an array of `google_vertex_ai_schedule` name
  * `crons`: an array of `google_vertex_ai_schedule` cron
  * `last_pause_times`: an array of `google_vertex_ai_schedule` last_pause_time
  * `create_times`: an array of `google_vertex_ai_schedule` create_time
  * `start_times`: an array of `google_vertex_ai_schedule` start_time
  * `max_run_counts`: an array of `google_vertex_ai_schedule` max_run_count
  * `next_run_times`: an array of `google_vertex_ai_schedule` next_run_time
  * `update_times`: an array of `google_vertex_ai_schedule` update_time
  * `last_scheduled_run_responses`: an array of `google_vertex_ai_schedule` last_scheduled_run_response
  * `last_resume_times`: an array of `google_vertex_ai_schedule` last_resume_time
  * `max_concurrent_run_counts`: an array of `google_vertex_ai_schedule` max_concurrent_run_count
  * `states`: an array of `google_vertex_ai_schedule` state
  * `create_pipeline_job_requests`: an array of `google_vertex_ai_schedule` create_pipeline_job_request
  * `display_names`: an array of `google_vertex_ai_schedule` display_name
  * `catch_ups`: an array of `google_vertex_ai_schedule` catch_up
  * `end_times`: an array of `google_vertex_ai_schedule` end_time

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
