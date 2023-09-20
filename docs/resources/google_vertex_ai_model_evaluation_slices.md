---
title: About the google_vertex_ai_model_evaluation_slices resource
platform: gcp
---

## Syntax
A `google_vertex_ai_model_evaluation_slices` is used to test a Google ModelEvaluationSlice resource

## Examples
```
    describe google_vertex_ai_model_evaluation_slices(parent: "projects/#{gcp_project_id}/locations/#{model_evaluation_slice['region']}/models/#{model_evaluation_slice['model']}/evaluations/#{model_evaluation_slice['evaluation']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_model_evaluation_slices` resource:

See [google_vertex_ai_model_evaluation_slice.md](google_vertex_ai_model_evaluation_slice.md) for more detailed information
  * `create_times`: an array of `google_vertex_ai_model_evaluation_slice` create_time
  * `model_explanations`: an array of `google_vertex_ai_model_evaluation_slice` model_explanation
  * `names`: an array of `google_vertex_ai_model_evaluation_slice` name
  * `metrics`: an array of `google_vertex_ai_model_evaluation_slice` metrics
  * `slices`: an array of `google_vertex_ai_model_evaluation_slice` slice
  * `metrics_schema_uris`: an array of `google_vertex_ai_model_evaluation_slice` metrics_schema_uri

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
