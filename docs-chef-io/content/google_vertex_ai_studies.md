+++
title = "google_vertex_ai_studies resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_studies"
identifier = "inspec/resources/gcp/google_vertex_ai_studies resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_studies` InSpec audit resource to to test a Google Cloud Study resource.

## Examples

```ruby
    describe google_vertex_ai_studies(parent: "projects/#{gcp_project_id}/locations/#{study['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_studies` resource:

See [google_vertex_ai_study](google_vertex_ai_study) for more detailed information.

  * `study_specs`: an array of `google_vertex_ai_study` study_spec
  * `names`: an array of `google_vertex_ai_study` name
  * `display_names`: an array of `google_vertex_ai_study` display_name
  * `states`: an array of `google_vertex_ai_study` state
  * `create_times`: an array of `google_vertex_ai_study` create_time
  * `inactive_reasons`: an array of `google_vertex_ai_study` inactive_reason

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
