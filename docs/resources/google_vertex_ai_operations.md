---
title: About the google_vertex_ai_operations resource
platform: gcp
---

## Syntax
A `google_vertex_ai_operations` is used to test a Google Operation resource

## Examples
```
    describe google_vertex_ai_operations(name: "projects/#{gcp_project_id}/locations/#{operation['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_operations` resource:

See [google_vertex_ai_operation.md](google_vertex_ai_operation.md) for more detailed information
  * `names`: an array of `google_vertex_ai_operation` name
  * `responses`: an array of `google_vertex_ai_operation` response
  * `metadata`: an array of `google_vertex_ai_operation` metadata
  * `errors`: an array of `google_vertex_ai_operation` error
  * `dones`: an array of `google_vertex_ai_operation` done

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
