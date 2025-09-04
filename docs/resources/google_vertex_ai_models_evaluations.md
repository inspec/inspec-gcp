+++
title = "google_vertex_ai_models_evaluations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_models_evaluations"
identifier = "inspec/resources/gcp/google_vertex_ai_models_evaluations Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_models_evaluations` is used to test a Google ModelsEvaluation resource

## Examples
```
    describe google_vertex_ai_models_evaluations(parent: "projects/#{gcp_project_id}/locations/#{models_evaluation['region']}/models/#{models_evaluation['model']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_models_evaluations` resource:

See [google_vertex_ai_models_evaluation.md](google_vertex_ai_models_evaluation.md) for more detailed information
  * `data_item_schema_uris`: an array of `google_vertex_ai_models_evaluation` data_item_schema_uri
  * `metadata`: an array of `google_vertex_ai_models_evaluation` metadata
  * `metrics_schema_uris`: an array of `google_vertex_ai_models_evaluation` metrics_schema_uri
  * `create_times`: an array of `google_vertex_ai_models_evaluation` create_time
  * `annotation_schema_uris`: an array of `google_vertex_ai_models_evaluation` annotation_schema_uri
  * `metrics`: an array of `google_vertex_ai_models_evaluation` metrics
  * `explanation_specs`: an array of `google_vertex_ai_models_evaluation` explanation_specs
  * `slice_dimensions`: an array of `google_vertex_ai_models_evaluation` slice_dimensions
  * `model_explanations`: an array of `google_vertex_ai_models_evaluation` model_explanation
  * `names`: an array of `google_vertex_ai_models_evaluation` name
  * `display_names`: an array of `google_vertex_ai_models_evaluation` display_name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
