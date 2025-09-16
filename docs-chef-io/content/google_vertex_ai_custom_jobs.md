+++
title = "google_vertex_ai_custom_jobs resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_custom_jobs"
identifier = "inspec/resources/gcp/google_vertex_ai_custom_jobs resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_custom_jobs` InSpec audit resource to to test a Google Cloud CustomJob resource.

## Examples

```ruby
    describe google_vertex_ai_custom_job(parent: ' value_parent', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_custom_jobs` resource:

See [google_vertex_ai_custom_job](google_vertex_ai_custom_job) for more detailed information.

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

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
