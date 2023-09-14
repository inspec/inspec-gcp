---
title: About the google_vertex_ai_specialist_pools resource
platform: gcp
---

## Syntax
A `google_vertex_ai_specialist_pools` is used to test a Google SpecialistPool resource

## Examples
```
    describe google_vertex_ai_specialist_pools(parent: "projects/#{gcp_project_id}/locations/#{specialist_pool['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_specialist_pools` resource:

See [google_vertex_ai_specialist_pool.md](google_vertex_ai_specialist_pool.md) for more detailed information
  * `display_names`: an array of `google_vertex_ai_specialist_pool` display_name
  * `specialist_manager_emails`: an array of `google_vertex_ai_specialist_pool` specialist_manager_emails
  * `specialist_managers_counts`: an array of `google_vertex_ai_specialist_pool` specialist_managers_count
  * `names`: an array of `google_vertex_ai_specialist_pool` name
  * `specialist_worker_emails`: an array of `google_vertex_ai_specialist_pool` specialist_worker_emails
  * `pending_data_labeling_jobs`: an array of `google_vertex_ai_specialist_pool` pending_data_labeling_jobs

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
