---
title: About the google_vertex_ai_models resource
platform: gcp
---

## Syntax
A `google_vertex_ai_models` is used to test a Google Model resource

## Examples
```
    describe google_vertex_ai_models(parent: "projects/#{gcp_project_id}/locations/#{model['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_models` resource:

See [google_vertex_ai_model.md](google_vertex_ai_model.md) for more detailed information
  * `model_source_infos`: an array of `google_vertex_ai_model` model_source_info
  * `names`: an array of `google_vertex_ai_model` name
  * `metadata`: an array of `google_vertex_ai_model` metadata
  * `update_times`: an array of `google_vertex_ai_model` update_time
  * `etags`: an array of `google_vertex_ai_model` etag
  * `descriptions`: an array of `google_vertex_ai_model` description
  * `deployed_models`: an array of `google_vertex_ai_model` deployed_models
  * `create_times`: an array of `google_vertex_ai_model` create_time
  * `explanation_specs`: an array of `google_vertex_ai_model` explanation_spec
  * `encryption_specs`: an array of `google_vertex_ai_model` encryption_spec
  * `pipeline_jobs`: an array of `google_vertex_ai_model` pipeline_job
  * `predict_schemata`: an array of `google_vertex_ai_model` predict_schemata
  * `version_update_times`: an array of `google_vertex_ai_model` version_update_time
  * `supported_export_formats`: an array of `google_vertex_ai_model` supported_export_formats
  * `original_model_infos`: an array of `google_vertex_ai_model` original_model_info
  * `metadata_artifacts`: an array of `google_vertex_ai_model` metadata_artifact
  * `supported_input_storage_formats`: an array of `google_vertex_ai_model` supported_input_storage_formats
  * `metadata_schema_uris`: an array of `google_vertex_ai_model` metadata_schema_uri
  * `container_specs`: an array of `google_vertex_ai_model` container_spec
  * `version_ids`: an array of `google_vertex_ai_model` version_id
  * `artifact_uris`: an array of `google_vertex_ai_model` artifact_uri
  * `training_pipelines`: an array of `google_vertex_ai_model` training_pipeline
  * `display_names`: an array of `google_vertex_ai_model` display_name
  * `supported_deployment_resources_types`: an array of `google_vertex_ai_model` supported_deployment_resources_types
  * `supported_output_storage_formats`: an array of `google_vertex_ai_model` supported_output_storage_formats
  * `version_aliases`: an array of `google_vertex_ai_model` version_aliases
  * `version_create_times`: an array of `google_vertex_ai_model` version_create_time
  * `version_descriptions`: an array of `google_vertex_ai_model` version_description
  * `labels`: an array of `google_vertex_ai_model` labels

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
