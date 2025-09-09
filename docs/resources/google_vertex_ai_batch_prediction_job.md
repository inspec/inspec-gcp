+++
title = "google_vertex_ai_batch_prediction_job resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_batch_prediction_job"
identifier = "inspec/resources/gcp/google_vertex_ai_batch_prediction_job Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_batch_prediction_job` InSpec audit resource to to test a Google Cloud BatchPredictionJob resource.

## Examples

```ruby
      describe google_vertex_ai_batch_prediction_job(name: ' value_name', region: ' value_region') do
     it { should exist }
   end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_batch_prediction_job` resource:


  * `create_time`: Output only. Time when the BatchPredictionJob was created.

  * `model_parameters`: The parameters that govern the predictions. The schema of the parameters may be specified via the Model's PredictSchemata's parameters_schema_uri.

  * `instance_config`: Configuration defining how to transform batch prediction input instances to the instances that the Model accepts.

    * `included_fields`: Fields that will be included in the prediction instance that is sent to the Model. If instance_type is `array`, the order of field names in included_fields also determines the order of the values in the array. When included_fields is populated, excluded_fields must be empty. The input must be JSONL with objects at each line, CSV, BigQuery or TfRecord.

    * `instance_type`: The format of the instance that the Model accepts. Vertex AI will convert compatible batch prediction input instance formats to the specified format. Supported values are: * `object`: Each input is converted to JSON object format. * For `bigquery`, each row is converted to an object. * For `jsonl`, each line of the JSONL input must be an object. * Does not apply to `csv`, `file-list`, `tf-record`, or `tf-record-gzip`. * `array`: Each input is converted to JSON array format. * For `bigquery`, each row is converted to an array. The order of columns is determined by the BigQuery column order, unless included_fields is populated. included_fields must be populated for specifying field orders. * For `jsonl`, if each line of the JSONL input is an object, included_fields must be populated for specifying field orders. * Does not apply to `csv`, `file-list`, `tf-record`, or `tf-record-gzip`. If not specified, Vertex AI converts the batch prediction input as follows: * For `bigquery` and `csv`, the behavior is the same as `array`. The order of columns is the same as defined in the file or table, unless included_fields is populated. * For `jsonl`, the prediction instance format is determined by each line of the input. * For `tf-record`/`tf-record-gzip`, each record will be converted to an object in the format of `{"b64": }`, where `` is the Base64-encoded string of the content of the record. * For `file-list`, each file in the list will be converted to an object in the format of `{"b64": }`, where `` is the Base64-encoded string of the content of the file.

    * `excluded_fields`: Fields that will be excluded in the prediction instance that is sent to the Model. Excluded will be attached to the batch prediction output if key_field is not specified. When excluded_fields is populated, included_fields must be empty. The input must be JSONL with objects at each line, CSV, BigQuery or TfRecord.

    * `key_field`: The name of the field that is considered as a key. The values identified by the key field is not included in the transformed instances that is sent to the Model. This is similar to specifying this name of the field in excluded_fields. In addition, the batch prediction output will not include the instances. Instead the output will only include the value of the key field, in a field named `key` in the output: * For `jsonl` output format, the output will have a `key` field instead of the `instance` field. * For `csv`/`bigquery` output format, the output will have have a `key` column instead of the instance feature columns. The input must be JSONL with objects at each line, CSV, BigQuery or TfRecord.

  * `model_version_id`: Output only. The version ID of the Model that produces the predictions via this job.

  * `dedicated_resources`: A description of resources that are used for performing batch operations, are dedicated to a Model, and need manual configuration.

    * `starting_replica_count`: Immutable. The number of machine replicas used at the start of the batch operation. If not set, Vertex AI decides starting number, not greater than max_replica_count

    * `max_replica_count`: Immutable. The maximum number of machine replicas the batch operation may be scaled to. The default value is 10.

    * `machine_spec`: Specification of a single machine.

      * `accelerator_type`: Immutable. The type of accelerator(s) that may be attached to the machine as per accelerator_count.
      Possible values:
        * ACCELERATOR_TYPE_UNSPECIFIED
        * NVIDIA_TESLA_K80
        * NVIDIA_TESLA_P100
        * NVIDIA_TESLA_V100
        * NVIDIA_TESLA_P4
        * NVIDIA_TESLA_T4
        * NVIDIA_TESLA_A100
        * NVIDIA_A100_80GB
        * NVIDIA_L4
        * TPU_V2
        * TPU_V3
        * TPU_V4_POD

      * `machine_type`: Immutable. The type of the machine. See the [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types) See the [list of machine types supported for custom training](https://cloud.google.com/vertex-ai/docs/training/configure-compute#machine-types). For DeployedModel this field is optional, and the default value is `n1-standard-2`. For BatchPredictionJob or as part of WorkerPoolSpec this field is required.

      * `accelerator_count`: The number of accelerators to attach to the machine.

  * `output_info`: Further describes this job's output. Supplements output_config.

    * `bigquery_output_dataset`: Output only. The path of the BigQuery dataset created, in `bq://projectId.bqDatasetId` format, into which the prediction output is written.

    * `gcs_output_directory`: Output only. The full path of the Cloud Storage directory created, into which the prediction output is written.

    * `bigquery_output_table`: Output only. The name of the BigQuery table created, in `predictions_` format, into which the prediction output is written. Can be used by UI to generate the BigQuery output path, for example.

  * `disable_container_logging`: For custom-trained Models and AutoML Tabular Models, the container of the DeployedModel instances will send `stderr` and `stdout` streams to Cloud Logging by default. Please note that the logs incur cost, which are subject to [Cloud Logging pricing](https://cloud.google.com/logging/pricing). User can disable container logging by setting this flag to true.

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

  * `end_time`: Output only. Time when the BatchPredictionJob entered any of the following states: `JOB_STATE_SUCCEEDED`, `JOB_STATE_FAILED`, `JOB_STATE_CANCELLED`.

  * `generate_explanation`: Generate explanation with the batch prediction results. When set to `true`, the batch prediction output changes based on the `predictions_format` field of the BatchPredictionJob.output_config object: * `bigquery`: output includes a column named `explanation`. The value is a struct that conforms to the Explanation object. * `jsonl`: The JSON objects on each line include an additional entry keyed `explanation`. The value of the entry is a JSON object that conforms to the Explanation object. * `csv`: Generating explanations for CSV format is not supported. If this field is set to true, either the Model.explanation_spec or explanation_spec must be populated.

  * `resources_consumed`: Statistics information about resource consumption.

    * `replica_hours`: Output only. The number of replica hours used. Note that many replicas may run in parallel, and additionally any given work may be queued for some time. Therefore this value is not strictly related to wall time.

  * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

  * `input_config`: Configures the input to BatchPredictionJob. See Model.supported_input_storage_formats for Model's supported input formats, and how instances should be expressed via any of them.

    * `instances_format`: Required. The format in which instances are given, must be one of the Model's supported_input_storage_formats.

    * `bigquery_source`: The BigQuery location for the input content.

      * `input_uri`: Required. BigQuery URI to a table, up to 2000 characters long. Accepted forms: * BigQuery path. For example: `bq://projectId.bqDatasetId.bqTableId`.

    * `gcs_source`: The Google Cloud Storage location for the input content.

      * `uris`: Required. Google Cloud Storage URI(-s) to the input file(s). May contain wildcards. For more information on wildcards, see https://cloud.google.com/storage/docs/gsutil/addlhelp/WildcardNames.

  * `unmanaged_container_model`: Contains model information necessary to perform batch prediction without requiring a full model import.

    * `artifact_uri`: The path to the directory containing the Model artifact and any of its supporting files.

    * `predict_schemata`: Contains the schemata used in Model's predictions and explanations via PredictionService.Predict, PredictionService.Explain and BatchPredictionJob.

      * `instance_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing the format of a single instance, which are used in PredictRequest.instances, ExplainRequest.instances and BatchPredictionJob.input_config. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

      * `parameters_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing the parameters of prediction and explanation via PredictRequest.parameters, ExplainRequest.parameters and BatchPredictionJob.model_parameters. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI, if no parameters are supported, then it is set to an empty string. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

      * `prediction_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing the format of a single prediction produced by this Model, which are returned via PredictResponse.predictions, ExplainResponse.explanations, and BatchPredictionJob.output_config. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). AutoML Models always have this field populated by Vertex AI. Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

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

  * `completion_stats`: Success and error statistics of processing multiple entities (for example, DataItems or structured data rows) in batch.

    * `successful_forecast_point_count`: Output only. The number of the successful forecast points that are generated by the forecasting model. This is ONLY used by the forecasting batch prediction.

    * `incomplete_count`: Output only. In cases when enough errors are encountered a job, pipeline, or operation may be failed as a whole. Below is the number of entities for which the processing had not been finished (either in successful or failed state). Set to -1 if the number is unknown (for example, the operation failed before the total entity number could be collected).

    * `failed_count`: Output only. The number of entities for which any error was encountered.

    * `successful_count`: Output only. The number of entities that had been processed successfully.

  * `start_time`: Output only. Time when the BatchPredictionJob for the first time entered the `JOB_STATE_RUNNING` state.

  * `manual_batch_tuning_parameters`: Manual batch tuning parameters.

    * `batch_size`: Immutable. The number of the records (e.g. instances) of the operation given in each batch to a machine replica. Machine type, and size of a single record should be considered when setting this parameter, higher value speeds up the batch operation's execution, but too high value will result in a whole batch not fitting in a machine's memory, and the whole operation will fail. The default value is 64.

  * `update_time`: Output only. Time when the BatchPredictionJob was most recently updated.

  * `name`: Output only. Resource name of the BatchPredictionJob.

  * `labels`: The labels with user-defined metadata to organize BatchPredictionJobs. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `state`: Output only. The detailed state of the job.
  Possible values:
    * JOB_STATE_UNSPECIFIED
    * JOB_STATE_QUEUED
    * JOB_STATE_PENDING
    * JOB_STATE_RUNNING
    * JOB_STATE_SUCCEEDED
    * JOB_STATE_FAILED
    * JOB_STATE_CANCELLING
    * JOB_STATE_CANCELLED
    * JOB_STATE_PAUSED
    * JOB_STATE_EXPIRED
    * JOB_STATE_UPDATING
    * JOB_STATE_PARTIALLY_SUCCEEDED

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `partial_failures`: Output only. Partial failures encountered. For example, single files that can't be read. This field never exceeds 20 entries. Status details fields contain standard Google Cloud error details.

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

  * `model`: The name of the Model resource that produces the predictions via this job, must share the same ancestor Location. Starting this job has no impact on any existing deployments of the Model and their resources. Exactly one of model and unmanaged_container_model must be set. The model resource name may contain version id or version alias to specify the version. Example: `projects/{project}/locations/{location}/models/{model}@2` or `projects/{project}/locations/{location}/models/{model}@golden` if no version is specified, the default version will be deployed. The model resource could also be a publisher model. Example: `publishers/{publisher}/models/{model}` or `projects/{project}/locations/{location}/publishers/{publisher}/models/{model}`

  * `output_config`: Configures the output of BatchPredictionJob. See Model.supported_output_storage_formats for supported output formats, and how predictions are expressed via any of them.

    * `gcs_destination`: The Google Cloud Storage location where the output is to be written to.

      * `output_uri_prefix`: Required. Google Cloud Storage URI to output directory. If the uri doesn't end with '/', a '/' will be automatically appended. The directory is created if it doesn't exist.

    * `predictions_format`: Required. The format in which Vertex AI gives the predictions, must be one of the Model's supported_output_storage_formats.

    * `bigquery_destination`: The BigQuery location for the output content.

      * `output_uri`: Required. BigQuery URI to a project or table, up to 2000 characters long. When only the project is specified, the Dataset and Table is created. When the full table reference is specified, the Dataset must exist and table must not exist. Accepted forms: * BigQuery path. For example: `bq://projectId` or `bq://projectId.bqDatasetId` or `bq://projectId.bqDatasetId.bqTableId`.

  * `display_name`: Required. The user-defined name of this BatchPredictionJob.

  * `service_account`: The service account that the DeployedModel's container runs as. If not specified, a system generated one will be used, which has minimal permissions and the custom container, if used, may not have enough permission to access other Google Cloud resources. Users deploying the Model must have the `iam.serviceAccounts.actAs` permission on this service account.


## GCP permissions
