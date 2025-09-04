+++
title = "google_vertex_ai_dataset resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_dataset"
identifier = "inspec/resources/gcp/google_vertex_ai_dataset Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_dataset` is used to test a Google Dataset resource

## Examples
```
      describe google_vertex_ai_dataset(name: ' ', region: ' ') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_dataset` resource:


  * `saved_queries`: All SavedQueries belong to the Dataset will be returned in List/Get Dataset response. The annotation_specs field will not be populated except for UI cases which will only use annotation_spec_count. In CreateDataset request, a SavedQuery is created together if this field is set, up to one SavedQuery can be set in CreateDatasetRequest. The SavedQuery should not contain any AnnotationSpec.

    * `annotation_spec_count`: Output only. Number of AnnotationSpecs in the context of the SavedQuery.

    * `update_time`: Output only. Timestamp when SavedQuery was last updated.

    * `support_automl_training`: Output only. If the Annotations belonging to the SavedQuery can be used for AutoML training.

    * `metadata`: Some additional information about the SavedQuery.

    * `problem_type`: Required. Problem type of the SavedQuery. Allowed values: * IMAGE_CLASSIFICATION_SINGLE_LABEL * IMAGE_CLASSIFICATION_MULTI_LABEL * IMAGE_BOUNDING_POLY * IMAGE_BOUNDING_BOX * TEXT_CLASSIFICATION_SINGLE_LABEL * TEXT_CLASSIFICATION_MULTI_LABEL * TEXT_EXTRACTION * TEXT_SENTIMENT * VIDEO_CLASSIFICATION * VIDEO_OBJECT_TRACKING

    * `name`: Output only. Resource name of the SavedQuery.

    * `create_time`: Output only. Timestamp when this SavedQuery was created.

    * `etag`: Used to perform a consistent read-modify-write update. If not set, a blind "overwrite" update happens.

    * `display_name`: Required. The user-defined name of the SavedQuery. The name can be up to 128 characters long and can consist of any UTF-8 characters.

    * `annotation_filter`: Output only. Filters on the Annotations in the dataset.

  * `create_time`: Output only. Timestamp when this Dataset was created.

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `name`: Output only. The resource name of the Dataset.

  * `metadata`: Required. Additional information about the Dataset.

  * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `description`: The description of the Dataset.

  * `labels`: The labels with user-defined metadata to organize your Datasets. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Dataset (System labels are excluded). See https://goo.gl/xmQnxf for more information and examples of labels. System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable. Following system labels exist for each Dataset: * "aiplatform.googleapis.com/dataset_metadata_schema": output only, its value is the metadata_schema's title.

    * `additional_properties`: 

  * `metadata_schema_uri`: Required. Points to a YAML file stored on Google Cloud Storage describing additional information about the Dataset. The schema is defined as an OpenAPI 3.0.2 Schema Object. The schema files that can be used here are found in gs://google-cloud-aiplatform/schema/dataset/metadata/.

  * `metadata_artifact`: Output only. The resource name of the Artifact that was created in MetadataStore when creating the Dataset. The Artifact resource name pattern is `projects/{project}/locations/{location}/metadataStores/{metadata_store}/artifacts/{artifact}`.

  * `update_time`: Output only. Timestamp when this Dataset was last updated.

  * `data_item_count`: Output only. The number of DataItems in this Dataset. Only apply for non-structured Dataset.

  * `display_name`: Required. The user-defined name of the Dataset. The name can be up to 128 characters long and can consist of any UTF-8 characters.


## GCP Permissions
