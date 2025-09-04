+++
title = "google_vertex_ai_custom_jobs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_custom_jobs"
identifier = "inspec/resources/gcp/google_vertex_ai_custom_jobs Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_custom_jobs` is used to test a Google CustomJob resource

## Examples
```
    describe google_vertex_ai_custom_job(parent: ' value_parent', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_custom_jobs` resource:

See [google_vertex_ai_custom_job.md](google_vertex_ai_custom_job.md) for more detailed information
  * `errors`: an array of `google_vertex_ai_custom_job` error
  * `web_access_uris`: an array of `google_vertex_ai_custom_job` web_access_uris
  * `job_specs`: an array of `google_vertex_ai_custom_job` job_spec
  * `start_times`: an array of `google_vertex_ai_custom_job` start_time
  * `labels`: an array of `google_vertex_ai_custom_job` labels
  * `encryption_specs`: an array of `google_vertex_ai_custom_job` encryption_spec
  * `create_times`: an array of `google_vertex_ai_custom_job` create_time
  * `update_times`: an array of `google_vertex_ai_custom_job` update_time
  * `end_times`: an array of `google_vertex_ai_custom_job` end_time
  * `states`: an array of `google_vertex_ai_custom_job` state
  * `display_names`: an array of `google_vertex_ai_custom_job` display_name
  * `names`: an array of `google_vertex_ai_custom_job` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
