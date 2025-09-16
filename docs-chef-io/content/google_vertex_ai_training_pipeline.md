+++
title = "google_vertex_ai_training_pipeline resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_training_pipeline"
identifier = "inspec/resources/gcp/google_vertex_ai_training_pipeline resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_training_pipeline` InSpec audit resource to to test a Google Cloud TrainingPipeline resource.

## Examples

```ruby
      describe google_vertex_ai_training_pipeline(name: "projects/#{gcp_project_id}/locations/#{training_pipeline['region']}/trainingPipelines/#{training_pipeline['name']}", region: ' value_region') do
     it { should exist }
   end
   describe google_vertex_ai_training_pipeline(name: "does_not_exit", region: ' value_region') do
     it { should_not exist }
   end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_training_pipeline` resource:


  * `end_time`: Output only. Time when the TrainingPipeline entered any of the following states: `PIPELINE_STATE_SUCCEEDED`, `PIPELINE_STATE_FAILED`, `PIPELINE_STATE_CANCELLED`.

  * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

  * `display_name`: Required. The user-defined name of this TrainingPipeline.

  * `name`: Output only. Resource name of the TrainingPipeline.

  * `input_data_config`: Specifies Vertex AI owned input data to be used for training, and possibly evaluating, the Model.

    * `fraction_split`: Assigns the input data to training, validation, and test sets as per the given fractions. Any of `training_fraction`, `validation_fraction` and `test_fraction` may optionally be provided, they must sum to up to 1. If the provided ones sum to less than 1, the remainder is assigned to sets as decided by Vertex AI. If none of the fractions are set, by default roughly 80% of data is used for training, 10% for validation, and 10% for test.

      * `training_fraction`: The fraction of the input data that is to be used to train the Model.

      * `test_fraction`: The fraction of the input data that is to be used to evaluate the Model.

      * `validation_fraction`: The fraction of the input data that is to be used to validate the Model.

    * `persist_ml_use_assignment`: Whether to persist the ML use assignment to data item system labels.

    * `saved_query_id`: Only applicable to Datasets that have SavedQueries. The ID of a SavedQuery (annotation set) under the Dataset specified by dataset_id used for filtering Annotations for training. Only Annotations that are associated with this SavedQuery are used in respectively training. When used in conjunction with annotations_filter, the Annotations used for training are filtered by both saved_query_id and annotations_filter. Only one of saved_query_id and annotation_schema_uri should be specified as both of them represent the same thing: problem type.

    * `annotations_filter`: Applicable only to Datasets that have DataItems and Annotations. A filter on Annotations of the Dataset. Only Annotations that both match this filter and belong to DataItems not ignored by the split method are used in respectively training, validation or test role, depending on the role of the DataItem they are on (for the auto-assigned that role is decided by Vertex AI). A filter with same syntax as the one used in ListAnnotations may be used, but note here it filters across all Annotations of the Dataset, and not just within a single DataItem.

    * `gcs_destination`: The Google Cloud Storage location where the output is to be written to.

      * `output_uri_prefix`: Required. Google Cloud Storage URI to output directory. If the uri doesn't end with '/', a '/' will be automatically appended. The directory is created if it doesn't exist.

    * `bigquery_destination`: The BigQuery location for the output content.

      * `output_uri`: Required. BigQuery URI to a project or table, up to 2000 characters long. When only the project is specified, the Dataset and Table is created. When the full table reference is specified, the Dataset must exist and table must not exist. Accepted forms: * BigQuery path. For example: `bq://projectId` or `bq://projectId.bqDatasetId` or `bq://projectId.bqDatasetId.bqTableId`.

    * `stratified_split`: Assigns input data to the training, validation, and test sets so that the distribution of values found in the categorical column (as specified by the `key` field) is mirrored within each split. The fraction values determine the relative sizes of the splits. For example, if the specified column has three values, with 50% of the rows having value "A", 25% value "B", and 25% value "C", and the split fractions are specified as 80/10/10, then the training set will constitute 80% of the training data, with about 50% of the training set rows having the value "A" for the specified column, about 25% having the value "B", and about 25% having the value "C". Only the top 500 occurring values are used; any values not in the top 500 values are randomly assigned to a split. If less than three rows contain a specific value, those rows are randomly assigned. Supported only for tabular Datasets.

      * `training_fraction`: The fraction of the input data that is to be used to train the Model.

      * `test_fraction`: The fraction of the input data that is to be used to evaluate the Model.

      * `key`: Required. The key is a name of one of the Dataset's data columns. The key provided must be for a categorical column.

      * `validation_fraction`: The fraction of the input data that is to be used to validate the Model.

    * `annotation_schema_uri`: Applicable only to custom training with Datasets that have DataItems and Annotations. Cloud Storage URI that points to a YAML file describing the annotation schema. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). The schema files that can be used here are found in gs://google-cloud-aiplatform/schema/dataset/annotation/ , note that the chosen schema must be consistent with metadata of the Dataset specified by dataset_id. Only Annotations that both match this schema and belong to DataItems not ignored by the split method are used in respectively training, validation or test role, depending on the role of the DataItem they are on. When used in conjunction with annotations_filter, the Annotations used for training are filtered by both annotations_filter and annotation_schema_uri.

    * `predefined_split`: Assigns input data to training, validation, and test sets based on the value of a provided key. Supported only for tabular Datasets.

      * `key`: Required. The key is a name of one of the Dataset's data columns. The value of the key (either the label's value or value in the column) must be one of {`training`, `validation`, `test`}, and it defines to which set the given piece of data is assigned. If for a piece of data the key is not present or has an invalid value, that piece is ignored by the pipeline.

    * `filter_split`: Assigns input data to training, validation, and test sets based on the given filters, data pieces not matched by any filter are ignored. Currently only supported for Datasets containing DataItems. If any of the filters in this message are to match nothing, then they can be set as '-' (the minus sign). Supported only for unstructured Datasets. 

      * `validation_filter`: Required. A filter on DataItems of the Dataset. DataItems that match this filter are used to validate the Model. A filter with same syntax as the one used in DatasetService.ListDataItems may be used. If a single DataItem is matched by more than one of the FilterSplit filters, then it is assigned to the first set that applies to it in the training, validation, test order.

      * `test_filter`: Required. A filter on DataItems of the Dataset. DataItems that match this filter are used to test the Model. A filter with same syntax as the one used in DatasetService.ListDataItems may be used. If a single DataItem is matched by more than one of the FilterSplit filters, then it is assigned to the first set that applies to it in the training, validation, test order.

      * `training_filter`: Required. A filter on DataItems of the Dataset. DataItems that match this filter are used to train the Model. A filter with same syntax as the one used in DatasetService.ListDataItems may be used. If a single DataItem is matched by more than one of the FilterSplit filters, then it is assigned to the first set that applies to it in the training, validation, test order.

    * `timestamp_split`: Assigns input data to training, validation, and test sets based on a provided timestamps. The youngest data pieces are assigned to training set, next to validation set, and the oldest to the test set. Supported only for tabular Datasets.

      * `test_fraction`: The fraction of the input data that is to be used to evaluate the Model.

      * `training_fraction`: The fraction of the input data that is to be used to train the Model.

      * `validation_fraction`: The fraction of the input data that is to be used to validate the Model.

      * `key`: Required. The key is a name of one of the Dataset's data columns. The values of the key (the values in the column) must be in RFC 3339 `date-time` format, where `time-offset` = `"Z"` (e.g. 1985-04-12T23:20:50.52Z). If for a piece of data the key is not present or has an invalid value, that piece is ignored by the pipeline.

    * `dataset_id`: Required. The ID of the Dataset in the same Project and Location which data will be used to train the Model. The Dataset must use schema compatible with Model being trained, and what is compatible should be described in the used TrainingPipeline's training_task_definition. For tabular Datasets, all their data is exported to training, to pick and choose from.

  * `parent_model`: Optional. When specify this field, the `model_to_upload` will not be uploaded as a new model, instead, it will become a new version of this `parent_model`.

  * `update_time`: Output only. Time when the TrainingPipeline was most recently updated.

  * `state`: Output only. The detailed state of the pipeline.
  Possible values:
    * PIPELINE_STATE_UNSPECIFIED
    * PIPELINE_STATE_QUEUED
    * PIPELINE_STATE_PENDING
    * PIPELINE_STATE_RUNNING
    * PIPELINE_STATE_SUCCEEDED
    * PIPELINE_STATE_FAILED
    * PIPELINE_STATE_CANCELLING
    * PIPELINE_STATE_CANCELLED
    * PIPELINE_STATE_PAUSED

  * `labels`: The labels with user-defined metadata to organize TrainingPipelines. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `training_task_definition`: Required. A Google Cloud Storage path to the YAML file that defines the training task which is responsible for producing the model artifact, and may also include additional auxiliary work. The definition files that can be used here are found in gs://google-cloud-aiplatform/schema/trainingjob/definition/. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

  * `start_time`: Output only. Time when the TrainingPipeline for the first time entered the `PIPELINE_STATE_RUNNING` state.

  * `create_time`: Output only. Time when the TrainingPipeline was created.

  * `training_task_metadata`: Output only. The metadata information as specified in the training_task_definition's `metadata`. This metadata is an auxiliary runtime and final information about the training task. While the pipeline is running this information is populated only at a best effort basis. Only present if the pipeline's training_task_definition contains `metadata` object.

  * `training_task_inputs`: Required. The training task's parameter(s), as specified in the training_task_definition's `inputs`.

  * `model_id`: Optional. The ID to use for the uploaded Model, which will become the final component of the model resource name. This value may be up to 63 characters, and valid characters are `[a-z0-9_-]`. The first character cannot be a number or hyphen.

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `model_to_upload`: A trained machine learning Model.

    * `model_source_info`: Detail description of the source information of the model.

      * `copy`: If this Model is copy of another Model. If true then source_type pertains to the original.

      * `source_type`: Type of the model source.
      Possible values:
        * MODEL_SOURCE_TYPE_UNSPECIFIED
        * AUTOML
        * CUSTOM
        * BQML
        * MODEL_GARDEN
        * GENIE

    * `name`: The resource name of the Model.

    * `metadata`: Immutable. An additional information about the Model; the schema of the metadata can be found in metadata_schema. Unset if the Model does not have any additional information.

    * `update_time`: Output only. Timestamp when this Model was most recently updated.

    * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

    * `description`: The description of the Model.

    * `deployed_models`: Output only. The pointers to DeployedModels created from this Model. Note that Model could have been deployed to Endpoints in different Locations.

      * `deployed_model_id`: Immutable. An ID of a DeployedModel in the above Endpoint.

      * `endpoint`: Immutable. A resource name of an Endpoint.

    * `create_time`: Output only. Timestamp when this Model was uploaded into Vertex AI.

    * `explanation_spec`: Specification of Model explanation.

      * `parameters`: Parameters to configure explaining for Model's predictions.

        * `output_indices`: If populated, only returns attributions that have output_index contained in output_indices. It must be an ndarray of integers, with the same shape of the output it's explaining. If not populated, returns attributions for top_k indices of outputs. If neither top_k nor output_indices is populated, returns the argmax index of the outputs. Only applicable to Models that predict multiple outputs (e,g, multi-class Models that predict multiple classes).

        * `examples`: Example-based explainability that returns the nearest neighbors from the provided dataset.

          * `presets`: Preset configuration for example-based explanations

            * `modality`: The modality of the uploaded model, which automatically configures the distance measurement and feature normalization for the underlying example index and queries. If your model does not precisely fit one of these types, it is okay to choose the closest type.
            Possible values:
              * MODALITY_UNSPECIFIED
              * IMAGE
              * TEXT
              * TABULAR

            * `query`: Preset option controlling parameters for speed-precision trade-off when querying for examples. If omitted, defaults to `PRECISE`.
            Possible values:
              * PRECISE
              * FAST

          * `neighbor_count`: The number of neighbors to return when querying for examples.

          * `example_gcs_source`: The Cloud Storage input instances.

            * `gcs_source`: The Google Cloud Storage location for the input content.

              * `uris`: Required. Google Cloud Storage URI(-s) to the input file(s). May contain wildcards. For more information on wildcards, see https://cloud.google.com/storage/docs/gsutil/addlhelp/WildcardNames.

            * `data_format`: The format in which instances are given, if not specified, assume it's JSONL format. Currently only JSONL format is supported.
            Possible values:
              * DATA_FORMAT_UNSPECIFIED
              * JSONL

          * `nearest_neighbor_search_config`: The full configuration for the generated index, the semantics are the same as metadata and should match [NearestNeighborSearchConfig](https://cloud.google.com/vertex-ai/docs/explainable-ai/configuring-explanations-example-based#nearest-neighbor-search-config).

        * `xrai_attribution`: An explanation method that redistributes Integrated Gradients attributions to segmented regions, taking advantage of the model's fully differentiable structure. Refer to this paper for more details: https://arxiv.org/abs/1906.02825 Supported only by image Models.

          * `smooth_grad_config`: Config for SmoothGrad approximation of gradients. When enabled, the gradients are approximated by averaging the gradients from noisy samples in the vicinity of the inputs. Adding noise can help improve the computed gradients. Refer to this paper for more details: https://arxiv.org/pdf/1706.03825.pdf

            * `feature_noise_sigma`: Noise sigma by features. Noise sigma represents the standard deviation of the gaussian kernel that will be used to add noise to interpolated inputs prior to computing gradients.

              * `noise_sigma`: Noise sigma per feature. No noise is added to features that are not set.

                * `name`: The name of the input feature for which noise sigma is provided. The features are defined in explanation metadata inputs.

                * `sigma`: This represents the standard deviation of the Gaussian kernel that will be used to add noise to the feature prior to computing gradients. Similar to noise_sigma but represents the noise added to the current feature. Defaults to 0.1.

            * `noise_sigma`: This is a single float value and will be used to add noise to all the features. Use this field when all features are normalized to have the same distribution: scale to range [0, 1], [-1, 1] or z-scoring, where features are normalized to have 0-mean and 1-variance. Learn more about [normalization](https://developers.google.com/machine-learning/data-prep/transform/normalization). For best results the recommended value is about 10% - 20% of the standard deviation of the input feature. Refer to section 3.2 of the SmoothGrad paper: https://arxiv.org/pdf/1706.03825.pdf. Defaults to 0.1. If the distribution is different per feature, set feature_noise_sigma instead for each feature.

            * `noisy_sample_count`: The number of gradient samples to use for approximation. The higher this number, the more accurate the gradient is, but the runtime complexity increases by this factor as well. Valid range of its value is [1, 50]. Defaults to 3.

          * `step_count`: Required. The number of steps for approximating the path integral. A good value to start is 50 and gradually increase until the sum to diff property is met within the desired error range. Valid range of its value is [1, 100], inclusively.

          * `blur_baseline_config`: Config for blur baseline. When enabled, a linear path from the maximally blurred image to the input image is created. Using a blurred baseline instead of zero (black image) is motivated by the BlurIG approach explained here: https://arxiv.org/abs/2004.03383

            * `max_blur_sigma`: The standard deviation of the blur kernel for the blurred baseline. The same blurring parameter is used for both the height and the width dimension. If not set, the method defaults to the zero (i.e. black for images) baseline.

        * `top_k`: If populated, returns attributions for top K indices of outputs (defaults to 1). Only applies to Models that predicts more than one outputs (e,g, multi-class Models). When set to -1, returns explanations for all outputs.

        * `integrated_gradients_attribution`: An attribution method that computes the Aumann-Shapley value taking advantage of the model's fully differentiable structure. Refer to this paper for more details: https://arxiv.org/abs/1703.01365

          * `step_count`: Required. The number of steps for approximating the path integral. A good value to start is 50 and gradually increase until the sum to diff property is within the desired error range. Valid range of its value is [1, 100], inclusively.

          * `smooth_grad_config`: Config for SmoothGrad approximation of gradients. When enabled, the gradients are approximated by averaging the gradients from noisy samples in the vicinity of the inputs. Adding noise can help improve the computed gradients. Refer to this paper for more details: https://arxiv.org/pdf/1706.03825.pdf

            * `feature_noise_sigma`: Noise sigma by features. Noise sigma represents the standard deviation of the gaussian kernel that will be used to add noise to interpolated inputs prior to computing gradients.

              * `noise_sigma`: Noise sigma per feature. No noise is added to features that are not set.

                * `name`: The name of the input feature for which noise sigma is provided. The features are defined in explanation metadata inputs.

                * `sigma`: This represents the standard deviation of the Gaussian kernel that will be used to add noise to the feature prior to computing gradients. Similar to noise_sigma but represents the noise added to the current feature. Defaults to 0.1.

            * `noise_sigma`: This is a single float value and will be used to add noise to all the features. Use this field when all features are normalized to have the same distribution: scale to range [0, 1], [-1, 1] or z-scoring, where features are normalized to have 0-mean and 1-variance. Learn more about [normalization](https://developers.google.com/machine-learning/data-prep/transform/normalization). For best results the recommended value is about 10% - 20% of the standard deviation of the input feature. Refer to section 3.2 of the SmoothGrad paper: https://arxiv.org/pdf/1706.03825.pdf. Defaults to 0.1. If the distribution is different per feature, set feature_noise_sigma instead for each feature.

            * `noisy_sample_count`: The number of gradient samples to use for approximation. The higher this number, the more accurate the gradient is, but the runtime complexity increases by this factor as well. Valid range of its value is [1, 50]. Defaults to 3.

          * `blur_baseline_config`: Config for blur baseline. When enabled, a linear path from the maximally blurred image to the input image is created. Using a blurred baseline instead of zero (black image) is motivated by the BlurIG approach explained here: https://arxiv.org/abs/2004.03383

            * `max_blur_sigma`: The standard deviation of the blur kernel for the blurred baseline. The same blurring parameter is used for both the height and the width dimension. If not set, the method defaults to the zero (i.e. black for images) baseline.

        * `sampled_shapley_attribution`: An attribution method that approximates Shapley values for features that contribute to the label being predicted. A sampling strategy is used to approximate the value rather than considering all subsets of features.

          * `path_count`: Required. The number of feature permutations to consider when approximating the Shapley values. Valid range of its value is [1, 50], inclusively.

      * `metadata`: Metadata describing the Model's input and output for explanation.

        * `feature_attributions_schema_uri`: Points to a YAML file stored on Google Cloud Storage describing the format of the feature attributions. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML tabular Models always have this field populated by Vertex AI. Note: The URI given on output may be different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

        * `latent_space_source`: Name of the source to generate embeddings for example based explanations.

        * `outputs`: Required. Map from output names to output metadata. For Vertex AI-provided Tensorflow images, keys can be any user defined string that consists of any UTF-8 characters. For custom images, keys are the name of the output field in the prediction to be explained. Currently only one key is allowed.

          * `additional_properties`: Metadata of the prediction output to be explained.

        * `inputs`: Required. Map from feature names to feature input metadata. Keys are the name of the features. Values are the specification of the feature. An empty InputMetadata is valid. It describes a text feature which has the name specified as the key in ExplanationMetadata.inputs. The baseline of the empty feature is chosen by Vertex AI. For Vertex AI-provided Tensorflow images, the key can be any friendly name of the feature. Once specified, featureAttributions are keyed by this key (if not grouped with another feature). For custom images, the key must match with the key in instance.

          * `additional_properties`: Metadata of the input of a feature. Fields other than InputMetadata.input_baselines are applicable only for Models that are using Vertex AI-provided images for Tensorflow.

    * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

      * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

    * `pipeline_job`: Optional. This field is populated if the model is produced by a pipeline job.

    * `predict_schemata`: Contains the schemata used in Model's predictions and explanations via PredictionService.Predict, PredictionService.Explain and BatchPredictionJob.

      * `instance_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing the format of a single instance, which are used in PredictRequest.instances, ExplainRequest.instances and BatchPredictionJob.input_config. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

      * `parameters_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing the parameters of prediction and explanation via PredictRequest.parameters, ExplainRequest.parameters and BatchPredictionJob.model_parameters. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI, if no parameters are supported, then it is set to an empty string. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

      * `prediction_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing the format of a single prediction produced by this Model, which are returned via PredictResponse.predictions, ExplainResponse.explanations, and BatchPredictionJob.output_config. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

    * `version_update_time`: Output only. Timestamp when this version was most recently updated.

    * `supported_export_formats`: Output only. The formats in which this Model may be exported. If empty, this Model is not available for export.

      * `exportable_contents`: Output only. The content of this Model that may be exported.

      * `id`: Output only. The ID of the export format. The possible format IDs are: * `tflite` Used for Android mobile devices. * `edgetpu-tflite` Used for [Edge TPU](https://cloud.google.com/edge-tpu/) devices. * `tf-saved-model` A tensorflow model in SavedModel format. * `tf-js` A [TensorFlow.js](https://www.tensorflow.org/js) model that can be used in the browser and in Node.js using JavaScript. * `core-ml` Used for iOS mobile devices. * `custom-trained` A Model that was uploaded or trained by custom code.

    * `original_model_info`: Contains information about the original Model if this Model is a copy.

      * `model`: Output only. The resource name of the Model this Model is a copy of, including the revision. Format: `projects/{project}/locations/{location}/models/{model_id}@{version_id}`

    * `metadata_artifact`: Output only. The resource name of the Artifact that was created in MetadataStore when creating the Model. The Artifact resource name pattern is `projects/{project}/locations/{location}/metadataStores/{metadata_store}/artifacts/{artifact}`.

    * `supported_input_storage_formats`: Output only. The formats this Model supports in BatchPredictionJob.input_config. If PredictSchemata.instance_schema_uri exists, the instances should be given as per that schema. The possible formats are: * `jsonl` The JSON Lines format, where each instance is a single line. Uses GcsSource. * `csv` The CSV format, where each instance is a single comma-separated line. The first line in the file is the header, containing comma-separated field names. Uses GcsSource. * `tf-record` The TFRecord format, where each instance is a single record in tfrecord syntax. Uses GcsSource. * `tf-record-gzip` Similar to `tf-record`, but the file is gzipped. Uses GcsSource. * `bigquery` Each instance is a single row in BigQuery. Uses BigQuerySource. * `file-list` Each line of the file is the location of an instance to process, uses `gcs_source` field of the InputConfig object. If this Model doesn't support any of these formats it means it cannot be used with a BatchPredictionJob. However, if it has supported_deployment_resources_types, it could serve online predictions by using PredictionService.Predict or PredictionService.Explain.

    * `metadata_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing additional information about the Model, that is specific to it. Unset if the Model does not have any additional information. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI, if no additional metadata is needed, this field is set to an empty string. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

    * `container_spec`: Specification of a container for serving predictions. Some fields in this message correspond to fields in the [Kubernetes Container v1 core specification](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core).

      * `predict_route`: Immutable. HTTP path on the container to send prediction requests to. Vertex AI forwards requests sent using projects.locations.endpoints.predict to this path on the container's IP address and port. Vertex AI then returns the container's response in the API response. For example, if you set this field to `/foo`, then when Vertex AI receives a prediction request, it forwards the request body in a POST request to the `/foo` path on the port of your container specified by the first value of this `ModelContainerSpec`'s ports field. If you don't specify this field, it defaults to the following value when you deploy this Model to an Endpoint: /v1/endpoints/ENDPOINT/deployedModels/DEPLOYED_MODEL:predict The placeholders in this value are replaced as follows: * ENDPOINT: The last segment (following `endpoints/`)of the Endpoint.name][] field of the Endpoint where this Model has been deployed. (Vertex AI makes this value available to your container code as the [`AIP_ENDPOINT_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).) * DEPLOYED_MODEL: DeployedModel.id of the `DeployedModel`. (Vertex AI makes this value available to your container code as the [`AIP_DEPLOYED_MODEL_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).)

      * `image_uri`: Required. Immutable. URI of the Docker image to be used as the custom container for serving predictions. This URI must identify an image in Artifact Registry or Container Registry. Learn more about the [container publishing requirements](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#publishing), including permissions requirements for the Vertex AI Service Agent. The container image is ingested upon ModelService.UploadModel, stored internally, and this original path is afterwards not used. To learn about the requirements for the Docker image itself, see [Custom container requirements](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#). You can use the URI to one of Vertex AI's [pre-built container images for prediction](https://cloud.google.com/vertex-ai/docs/predictions/pre-built-containers) in this field.

      * `env`: Immutable. List of environment variables to set in the container. After the container starts running, code running in the container can read these environment variables. Additionally, the command and args fields can reference these variables. Later entries in this list can also reference earlier entries. For example, the following example sets the variable `VAR_2` to have the value `foo bar`: ```json [ { "name": "VAR_1", "value": "foo" }, { "name": "VAR_2", "value": "$(VAR_1) bar" } ] ``` If you switch the order of the variables in the example, then the expansion does not occur. This field corresponds to the `env` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core).

        * `name`: Required. Name of the environment variable. Must be a valid C identifier.

        * `value`: Required. Variables that reference a $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not.

      * `args`: Immutable. Specifies arguments for the command that runs when the container starts. This overrides the container's [`CMD`](https://docs.docker.com/engine/reference/builder/#cmd). Specify this field as an array of executable and arguments, similar to a Docker `CMD`'s "default parameters" form. If you don't specify this field but do specify the command field, then the command from the `command` field runs without any additional arguments. See the [Kubernetes documentation about how the `command` and `args` fields interact with a container's `ENTRYPOINT` and `CMD`](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#notes). If you don't specify this field and don't specify the `command` field, then the container's [`ENTRYPOINT`](https://docs.docker.com/engine/reference/builder/#cmd) and `CMD` determine what runs based on their default behavior. See the Docker documentation about [how `CMD` and `ENTRYPOINT` interact](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact). In this field, you can reference [environment variables set by Vertex AI](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables) and environment variables set in the env field. You cannot reference environment variables set in the Docker image. In order for environment variables to be expanded, reference them by using the following syntax: $( VARIABLE_NAME) Note that this differs from Bash variable expansion, which does not use parentheses. If a variable cannot be resolved, the reference in the input string is used unchanged. To avoid variable expansion, you can escape this syntax with `$$`; for example: $$(VARIABLE_NAME) This field corresponds to the `args` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core).

      * `command`: Immutable. Specifies the command that runs when the container starts. This overrides the container's [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint). Specify this field as an array of executable and arguments, similar to a Docker `ENTRYPOINT`'s "exec" form, not its "shell" form. If you do not specify this field, then the container's `ENTRYPOINT` runs, in conjunction with the args field or the container's [`CMD`](https://docs.docker.com/engine/reference/builder/#cmd), if either exists. If this field is not specified and the container does not have an `ENTRYPOINT`, then refer to the Docker documentation about [how `CMD` and `ENTRYPOINT` interact](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact). If you specify this field, then you can also specify the `args` field to provide additional arguments for this command. However, if you specify this field, then the container's `CMD` is ignored. See the [Kubernetes documentation about how the `command` and `args` fields interact with a container's `ENTRYPOINT` and `CMD`](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#notes). In this field, you can reference [environment variables set by Vertex AI](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables) and environment variables set in the env field. You cannot reference environment variables set in the Docker image. In order for environment variables to be expanded, reference them by using the following syntax: $( VARIABLE_NAME) Note that this differs from Bash variable expansion, which does not use parentheses. If a variable cannot be resolved, the reference in the input string is used unchanged. To avoid variable expansion, you can escape this syntax with `$$`; for example: $$(VARIABLE_NAME) This field corresponds to the `command` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core).

      * `ports`: Immutable. List of ports to expose from the container. Vertex AI sends any prediction requests that it receives to the first port on this list. Vertex AI also sends [liveness and health checks](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#liveness) to this port. If you do not specify this field, it defaults to following value: ```json [ { "containerPort": 8080 } ] ``` Vertex AI does not use ports other than the first one listed. This field corresponds to the `ports` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core).

        * `container_port`: The number of the port to expose on the pod's IP address. Must be a valid port number, between 1 and 65535 inclusive.

      * `health_route`: Immutable. HTTP path on the container to send health checks to. Vertex AI intermittently sends GET requests to this path on the container's IP address and port to check that the container is healthy. Read more about [health checks](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#health). For example, if you set this field to `/bar`, then Vertex AI intermittently sends a GET request to the `/bar` path on the port of your container specified by the first value of this `ModelContainerSpec`'s ports field. If you don't specify this field, it defaults to the following value when you deploy this Model to an Endpoint: /v1/endpoints/ENDPOINT/deployedModels/ DEPLOYED_MODEL:predict The placeholders in this value are replaced as follows: * ENDPOINT: The last segment (following `endpoints/`)of the Endpoint.name][] field of the Endpoint where this Model has been deployed. (Vertex AI makes this value available to your container code as the [`AIP_ENDPOINT_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).) * DEPLOYED_MODEL: DeployedModel.id of the `DeployedModel`. (Vertex AI makes this value available to your container code as the [`AIP_DEPLOYED_MODEL_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).)

    * `version_id`: Output only. Immutable. The version ID of the model. A new version is committed when a new model version is uploaded or trained under an existing model id. It is an auto-incrementing decimal number in string representation.

    * `artifact_uri`: Immutable. The path to the directory containing the Model artifact and any of its supporting files. Not present for AutoML Models or Large Models.

    * `training_pipeline`: Output only. The resource name of the TrainingPipeline that uploaded this Model, if any.

    * `display_name`: Required. The display name of the Model. The name can be up to 128 characters long and can consist of any UTF-8 characters.

    * `supported_deployment_resources_types`: Output only. When this Model is deployed, its prediction resources are described by the `prediction_resources` field of the Endpoint.deployed_models object. Because not all Models support all resource configuration types, the configuration types this Model supports are listed here. If no configuration types are listed, the Model cannot be deployed to an Endpoint and does not support online predictions (PredictionService.Predict or PredictionService.Explain). Such a Model can serve predictions by using a BatchPredictionJob, if it has at least one entry each in supported_input_storage_formats and supported_output_storage_formats.

    * `supported_output_storage_formats`: Output only. The formats this Model supports in BatchPredictionJob.output_config. If both PredictSchemata.instance_schema_uri and PredictSchemata.prediction_schema_uri exist, the predictions are returned together with their instances. In other words, the prediction has the original instance data first, followed by the actual prediction content (as per the schema). The possible formats are: * `jsonl` The JSON Lines format, where each prediction is a single line. Uses GcsDestination. * `csv` The CSV format, where each prediction is a single comma-separated line. The first line in the file is the header, containing comma-separated field names. Uses GcsDestination. * `bigquery` Each prediction is a single row in a BigQuery table, uses BigQueryDestination . If this Model doesn't support any of these formats it means it cannot be used with a BatchPredictionJob. However, if it has supported_deployment_resources_types, it could serve online predictions by using PredictionService.Predict or PredictionService.Explain.

    * `version_aliases`: User provided version aliases so that a model version can be referenced via alias (i.e. `projects/{project}/locations/{location}/models/{model_id}@{version_alias}` instead of auto-generated version id (i.e. `projects/{project}/locations/{location}/models/{model_id}@{version_id})`. The format is a-z{0,126}[a-z0-9] to distinguish from version_id. A default version alias will be created for the first version of the model, and there must be exactly one default version alias for a model.

    * `version_create_time`: Output only. Timestamp when this version was created.

    * `version_description`: The description of this version.

    * `labels`: The labels with user-defined metadata to organize your Models. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

      * `additional_properties`: 


## GCP permissions
