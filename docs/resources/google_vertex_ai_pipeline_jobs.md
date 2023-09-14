---
title: About the google_vertex_ai_pipeline_jobs resource
platform: gcp
---

## Syntax
A `google_vertex_ai_pipeline_jobs` is used to test a Google PipelineJob resource

## Examples
```
    describe google_vertex_ai_pipeline_jobs(parent: "projects/#{gcp_project_id}/locations/#{pipeline_job['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_pipeline_jobs` resource:

See [google_vertex_ai_pipeline_job.md](google_vertex_ai_pipeline_job.md) for more detailed information
  * `encryption_specs`: an array of `google_vertex_ai_pipeline_job` encryption_spec
  * `end_times`: an array of `google_vertex_ai_pipeline_job` end_time
  * `errors`: an array of `google_vertex_ai_pipeline_job` error
  * `update_times`: an array of `google_vertex_ai_pipeline_job` update_time
  * `job_details`: an array of `google_vertex_ai_pipeline_job` job_detail
  * `template_metadata`: an array of `google_vertex_ai_pipeline_job` template_metadata
  * `states`: an array of `google_vertex_ai_pipeline_job` state
  * `create_times`: an array of `google_vertex_ai_pipeline_job` create_time
  * `names`: an array of `google_vertex_ai_pipeline_job` name
  * `schedule_names`: an array of `google_vertex_ai_pipeline_job` schedule_name
  * `reserved_ip_ranges`: an array of `google_vertex_ai_pipeline_job` reserved_ip_ranges
  * `start_times`: an array of `google_vertex_ai_pipeline_job` start_time
  * `service_accounts`: an array of `google_vertex_ai_pipeline_job` service_account
  * `display_names`: an array of `google_vertex_ai_pipeline_job` display_name
  * `template_uris`: an array of `google_vertex_ai_pipeline_job` template_uri
  * `pipeline_specs`: an array of `google_vertex_ai_pipeline_job` pipeline_spec
  * `networks`: an array of `google_vertex_ai_pipeline_job` network
  * `labels`: an array of `google_vertex_ai_pipeline_job` labels
  * `runtime_configs`: an array of `google_vertex_ai_pipeline_job` runtime_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
