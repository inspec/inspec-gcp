+++
title = "google_vertex_ai_model_evaluation_slices resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_model_evaluation_slices"
identifier = "inspec/resources/gcp/google_vertex_ai_model_evaluation_slices resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_model_evaluation_slices` InSpec audit resource to to test a Google Cloud ModelEvaluationSlice resource.

## Examples

```ruby
    describe google_vertex_ai_model_evaluation_slices(parent: "projects/#{gcp_project_id}/locations/#{models_evaluations_slice['region']}/models/#{models_evaluations_slice['model']}/evaluations/#{models_evaluations_slice['evaluation']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_model_evaluation_slices` resource:

See [google_vertex_ai_model_evaluation_slice](google_vertex_ai_model_evaluation_slice) for more detailed information.

  * `create_times`: an array of `google_vertex_ai_model_evaluation_slice` create_time
  * `model_explanations`: an array of `google_vertex_ai_model_evaluation_slice` model_explanation
  * `names`: an array of `google_vertex_ai_model_evaluation_slice` name
  * `metrics`: an array of `google_vertex_ai_model_evaluation_slice` metrics
  * `slices`: an array of `google_vertex_ai_model_evaluation_slice` slice
  * `metrics_schema_uris`: an array of `google_vertex_ai_model_evaluation_slice` metrics_schema_uri

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
