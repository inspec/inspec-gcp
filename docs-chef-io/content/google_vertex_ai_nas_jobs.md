+++
title = "google_vertex_ai_nas_jobs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_nas_jobs"
identifier = "inspec/resources/gcp/google_vertex_ai_nas_jobs resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_nas_jobs` InSpec audit resource to to test a Google Cloud NasJob resource.

## Examples

```ruby
    describe google_vertex_ai_nas_jobs(parent: "projects/#{gcp_project_id}/locations/#{nas_job['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_nas_jobs` resource:

See [google_vertex_ai_nas_job](google_vertex_ai_nas_job) for more detailed information.

  * `nas_job_outputs`: an array of `google_vertex_ai_nas_job` nas_job_output
  * `names`: an array of `google_vertex_ai_nas_job` name
  * `end_times`: an array of `google_vertex_ai_nas_job` end_time
  * `errors`: an array of `google_vertex_ai_nas_job` error
  * `states`: an array of `google_vertex_ai_nas_job` state
  * `create_times`: an array of `google_vertex_ai_nas_job` create_time
  * `display_names`: an array of `google_vertex_ai_nas_job` display_name
  * `nas_job_specs`: an array of `google_vertex_ai_nas_job` nas_job_spec
  * `enable_restricted_image_trainings`: an array of `google_vertex_ai_nas_job` enable_restricted_image_training
  * `start_times`: an array of `google_vertex_ai_nas_job` start_time
  * `encryption_specs`: an array of `google_vertex_ai_nas_job` encryption_spec
  * `labels`: an array of `google_vertex_ai_nas_job` labels
  * `update_times`: an array of `google_vertex_ai_nas_job` update_time

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
