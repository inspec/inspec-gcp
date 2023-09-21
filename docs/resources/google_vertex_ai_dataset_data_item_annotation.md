---
title: About the google_vertex_ai_dataset_data_item_annotation resource
platform: gcp
---

## Syntax
A `google_vertex_ai_dataset_data_item_annotation` is used to test a Google DatasetDataItemAnnotation resource

## Examples
```
describe google_vertex_ai_dataset_data_item_annotation(name: "projects/#{gcp_project_id}/locations/#{dataset_data_item_annotation['region']}/hyperparameterTuningJobs/#{dataset_data_item_annotation['hyperparameterTuningJob']}", region: ' value_region') do
	it { should exist }

end

describe google_vertex_ai_dataset_data_item_annotation(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_dataset_data_item_annotation` resource:


  * `payload_schema_uri`: Required. Google Cloud Storage URI points to a YAML file describing payload. The schema is defined as an [OpenAPI 3.0.2 Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). The schema files that can be used here are found in gs://google-cloud-aiplatform/schema/dataset/annotation/, note that the chosen schema must be consistent with the parent Dataset's metadata.

  * `create_time`: Output only. Timestamp when this Annotation was created.

  * `etag`: Optional. Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `labels`: Optional. The labels with user-defined metadata to organize your Annotations. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Annotation(System labels are excluded). See https://goo.gl/xmQnxf for more information and examples of labels. System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable. Following system labels exist for each Annotation: * "aiplatform.googleapis.com/annotation_set_name": optional, name of the UI's annotation set this Annotation belongs to. If not set, the Annotation is not visible in the UI. * "aiplatform.googleapis.com/payload_schema": output only, its value is the payload_schema's title.

    * `additional_properties`: 

  * `update_time`: Output only. Timestamp when this Annotation was last updated.

  * `payload`: Required. The schema of the payload can be found in payload_schema.

  * `annotation_source`: Output only. The source of the Annotation.

  * `name`: Output only. Resource name of the Annotation.


## GCP Permissions
