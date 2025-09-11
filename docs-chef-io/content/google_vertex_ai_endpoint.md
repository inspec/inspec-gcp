+++
title = "google_vertex_ai_endpoint resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_endpoint"
identifier = "inspec/resources/gcp/google_vertex_ai_endpoint resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_endpoint` InSpec audit resource to to test a Google Cloud Endpoint resource.

## Examples

```ruby
describe google_vertex_ai_endpoint(name: "projects/#{gcp_project_id}/locations/#{endpoint['region']}/endpoints/#{endpoint['name']}", region: ' value_region') do
it { should exist }
	its('update_time') { should cmp 'value_updatetime' }
	its('model_deployment_monitoring_job') { should cmp 'value_modeldeploymentmonitoringjob' }
	its('description') { should cmp 'value_description' }
	its('network') { should cmp 'value_network' }
	its('display_name') { should cmp 'value_displayname' }
	its('etag') { should cmp 'value_etag' }
	its('create_time') { should cmp 'value_createtime' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_endpoint(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_endpoint` resource:


  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `enable_private_service_connect`: Deprecated: If true, expose the Endpoint via private service connect. Only one of the fields, network or enable_private_service_connect, can be set.

  * `update_time`: Output only. Timestamp when this Endpoint was last updated.

  * `model_deployment_monitoring_job`: Output only. Resource name of the Model Monitoring job associated with this Endpoint if monitoring is enabled by JobService.CreateModelDeploymentMonitoringJob. Format: `projects/{project}/locations/{location}/modelDeploymentMonitoringJobs/{model_deployment_monitoring_job}`

  * `description`: The description of the Endpoint.

  * `deployed_models`: Output only. The models deployed in this Endpoint. To add or remove DeployedModels use EndpointService.DeployModel and EndpointService.UndeployModel respectively.

    * `create_time`: Output only. Timestamp when the DeployedModel was created.

    * `private_endpoints`: PrivateEndpoints proto is used to provide paths for users to send requests privately. To send request via private service access, use predict_http_uri, explain_http_uri or health_http_uri. To send request via private service connect, use service_attachment.

      * `health_http_uri`: Output only. Http(s) path to send health check requests.

      * `explain_http_uri`: Output only. Http(s) path to send explain requests.

      * `predict_http_uri`: Output only. Http(s) path to send prediction requests.

      * `service_attachment`: Output only. The name of the service attachment resource. Populated if private service connect is enabled.

    * `disable_container_logging`: For custom-trained Models and AutoML Tabular Models, the container of the DeployedModel instances will send `stderr` and `stdout` streams to Cloud Logging by default. Please note that the logs incur cost, which are subject to [Cloud Logging pricing](https://cloud.google.com/logging/pricing). User can disable container logging by setting this flag to true.

    * `model_version_id`: Output only. The version ID of the model that is deployed.

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

    * `enable_access_logging`: If true, online prediction access logs are sent to Cloud Logging. These logs are like standard server access logs, containing information like timestamp and latency for each prediction request. Note that logs may incur a cost, especially if your project receives prediction requests at a high queries per second rate (QPS). Estimate your costs before enabling this option.

    * `service_account`: The service account that the DeployedModel's container runs as. Specify the email address of the service account. If this service account is not specified, the container runs as a service account that doesn't have access to the resource project. Users deploying the Model must have the `iam.serviceAccounts.actAs` permission on this service account.

    * `dedicated_resources`: A description of resources that are dedicated to a DeployedModel, and that need a higher degree of manual configuration.

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

      * `max_replica_count`: Immutable. The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale the model to that many replicas is guaranteed (barring service outages). If traffic against the DeployedModel increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, will use min_replica_count as the default value. The value of this field impacts the charge against Vertex CPU and GPU quotas. Specifically, you will be charged for (max_replica_count * number of cores in the selected machine type) and (max_replica_count * number of GPUs per replica in the selected machine type).

      * `autoscaling_metric_specs`: Immutable. The metric specifications that overrides a resource utilization metric (CPU utilization, accelerator's duty cycle, and so on) target value (default to 60 if not set). At most one entry is allowed per metric. If machine_spec.accelerator_count is above 0, the autoscaling will be based on both CPU utilization and accelerator's duty cycle metrics and scale up when either metrics exceeds its target value while scale down if both metrics are under their target value. The default target value is 60 for both metrics. If machine_spec.accelerator_count is 0, the autoscaling will be based on CPU utilization metric only with default target value 60 if not explicitly set. For example, in the case of Online Prediction, if you want to override target CPU utilization to 80, you should set autoscaling_metric_specs.metric_name to `aiplatform.googleapis.com/prediction/online/cpu/utilization` and autoscaling_metric_specs.target to `80`.

        * `target`: The target resource utilization in percentage (1% - 100%) for the given metric; once the real usage deviates from the target by a certain percentage, the machine replicas change. The default value is 60 (representing 60%) if not provided.

        * `metric_name`: Required. The resource metric name. Supported metrics: * For Online Prediction: * `aiplatform.googleapis.com/prediction/online/accelerator/duty_cycle` * `aiplatform.googleapis.com/prediction/online/cpu/utilization`

      * `min_replica_count`: Required. Immutable. The minimum number of machine replicas this DeployedModel will be always deployed on. This value must be greater than or equal to 1. If traffic against the DeployedModel increases, it may dynamically be deployed onto more replicas, and as traffic decreases, some of these extra replicas may be freed.

    * `automatic_resources`: A description of resources that to large degree are decided by Vertex AI, and require only a modest additional configuration. Each Model supporting these resources documents its specific guidelines.

      * `max_replica_count`: Immutable. The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale the model to that many replicas is guaranteed (barring service outages). If traffic against the DeployedModel increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, a no upper bound for scaling under heavy traffic will be assume, though Vertex AI may be unable to scale beyond certain replica number.

      * `min_replica_count`: Immutable. The minimum number of replicas this DeployedModel will be always deployed on. If traffic against it increases, it may dynamically be deployed onto more replicas up to max_replica_count, and as traffic decreases, some of these extra replicas may be freed. If the requested value is too large, the deployment will error.

    * `display_name`: The display name of the DeployedModel. If not provided upon creation, the Model's display_name is used.

    * `model`: Required. The resource name of the Model that this is the deployment of. Note that the Model may be in a different location than the DeployedModel's Endpoint. The resource name may contain version id or version alias to specify the version. Example: `projects/{project}/locations/{location}/models/{model}@2` or `projects/{project}/locations/{location}/models/{model}@golden` if no version is specified, the default version will be deployed.

    * `id`: Immutable. The ID of the DeployedModel. If not provided upon deployment, Vertex AI will generate a value for this ID. This value should be 1-10 characters, and valid characters are /[0-9]/.

  * `network`: Optional. The full name of the Google Compute Engine [network](https://cloud.google.com//compute/docs/networks-and-firewalls#networks) to which the Endpoint should be peered. Private services access must already be configured for the network. If left unspecified, the Endpoint is not peered with any network. Only one of the fields, network or enable_private_service_connect, can be set. [Format](https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert): `projects/{project}/global/networks/{network}`. Where `{project}` is a project number, as in `12345`, and `{network}` is network name.

  * `traffic_split`: A map from a DeployedModel's ID to the percentage of this Endpoint's traffic that should be forwarded to that DeployedModel. If a DeployedModel's ID is not listed in this map, then it receives no traffic. The traffic percentage values must add up to 100, or map must be empty if the Endpoint is to not accept any traffic at a moment.

    * `additional_properties`: 

  * `labels`: The labels with user-defined metadata to organize your Endpoints. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `display_name`: Required. The display name of the Endpoint. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `predict_request_response_logging_config`: Configuration for logging request-response to a BigQuery table.

    * `sampling_rate`: Percentage of requests to be logged, expressed as a fraction in range(0,1].

    * `enabled`: If logging is enabled or not.

    * `bigquery_destination`: The BigQuery location for the output content.

      * `output_uri`: Required. BigQuery URI to a project or table, up to 2000 characters long. When only the project is specified, the Dataset and Table is created. When the full table reference is specified, the Dataset must exist and table must not exist. Accepted forms: * BigQuery path. For example: `bq://projectId` or `bq://projectId.bqDatasetId` or `bq://projectId.bqDatasetId.bqTableId`.

  * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `create_time`: Output only. Timestamp when this Endpoint was created.

  * `name`: Output only. The resource name of the Endpoint.


## GCP permissions
