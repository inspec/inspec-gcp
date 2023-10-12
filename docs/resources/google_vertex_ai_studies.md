---
title: About the google_vertex_ai_studies resource
platform: gcp
---

## Syntax
A `google_vertex_ai_studies` is used to test a Google Study resource

## Examples
```
    describe google_vertex_ai_studies(parent: "projects/#{gcp_project_id}/locations/#{study['region']}/tensorboards/#{study['tensorboard']}/experiments/#{study['experiment']}/runs/#{study['run']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_studies` resource:

See [google_vertex_ai_study.md](google_vertex_ai_study.md) for more detailed information
  * `study_specs`: an array of `google_vertex_ai_study` study_spec
  * `names`: an array of `google_vertex_ai_study` name
  * `display_names`: an array of `google_vertex_ai_study` display_name
  * `states`: an array of `google_vertex_ai_study` state
  * `create_times`: an array of `google_vertex_ai_study` create_time
  * `inactive_reasons`: an array of `google_vertex_ai_study` inactive_reason

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
