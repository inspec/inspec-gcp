+++
title = "google_vertex_ai_models_evaluation resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_models_evaluation"
identifier = "inspec/resources/gcp/google_vertex_ai_models_evaluation Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_models_evaluation` is used to test a Google ModelsEvaluation resource

## Examples
```
describe google_vertex_ai_models_evaluation(name: "projects/#{gcp_project_id}/locations/#{models_evaluation['region']}/models/#{models_evaluation['model']}/evaluations/#{models_evaluation['name']}", region: ' value_region') do
	it { should exist }
	its('data_item_schema_uri') { should cmp 'value_dataitemschemauri' }
	its('metrics_schema_uri') { should cmp 'value_metricsschemauri' }
	its('create_time') { should cmp 'value_createtime' }
	its('annotation_schema_uri') { should cmp 'value_annotationschemauri' }
	its('name') { should cmp 'value_name' }
	its('display_name') { should cmp 'value_displayname' }

end

describe google_vertex_ai_models_evaluation(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_models_evaluation` resource:


  * `data_item_schema_uri`: Points to a YAML file stored on Google Cloud Storage describing EvaluatedDataItemView.data_item_payload and EvaluatedAnnotation.data_item_payload. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). This field is not populated if there are neither EvaluatedDataItemViews nor EvaluatedAnnotations under this ModelEvaluation.

  * `metadata`: The metadata of the ModelEvaluation. For the ModelEvaluation uploaded from Managed Pipeline, metadata contains a structured value with keys of "pipeline_job_id", "evaluation_dataset_type", "evaluation_dataset_path".

  * `metrics_schema_uri`: Points to a YAML file stored on Google Cloud Storage describing the metrics of this ModelEvaluation. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject).

  * `create_time`: Output only. Timestamp when this ModelEvaluation was created.

  * `annotation_schema_uri`: Points to a YAML file stored on Google Cloud Storage describing EvaluatedDataItemView.predictions, EvaluatedDataItemView.ground_truths, EvaluatedAnnotation.predictions, and EvaluatedAnnotation.ground_truths. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). This field is not populated if there are neither EvaluatedDataItemViews nor EvaluatedAnnotations under this ModelEvaluation.

  * `metrics`: Evaluation metrics of the Model. The schema of the metrics is stored in metrics_schema_uri

  * `explanation_specs`: Describes the values of ExplanationSpec that are used for explaining the predicted values on the evaluated data.

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

    * `explanation_type`: Explanation type. For AutoML Image Classification models, possible values are: * `image-integrated-gradients` * `image-xrai`

  * `slice_dimensions`: All possible dimensions of ModelEvaluationSlices. The dimensions can be used as the filter of the ModelService.ListModelEvaluationSlices request, in the form of `slice.dimension = `.

  * `model_explanation`: Aggregated explanation metrics for a Model over a set of instances.

    * `mean_attributions`: Output only. Aggregated attributions explaining the Model's prediction outputs over the set of instances. The attributions are grouped by outputs. For Models that predict only one output, such as regression Models that predict only one score, there is only one attibution that explains the predicted output. For Models that predict multiple outputs, such as multiclass Models that predict multiple classes, each element explains one specific item. Attribution.output_index can be used to identify which output this attribution is explaining. The baselineOutputValue, instanceOutputValue and featureAttributions fields are averaged over the test data. NOTE: Currently AutoML tabular classification Models produce only one attribution, which averages attributions over all the classes it predicts. Attribution.approximation_error is not populated.

      * `output_display_name`: Output only. The display name of the output identified by output_index. For example, the predicted class name by a multi-classification Model. This field is only populated iff the Model predicts display names as a separate field along with the explained output. The predicted display name must has the same shape of the explained output, and can be located using output_index.

      * `baseline_output_value`: Output only. Model predicted output if the input instance is constructed from the baselines of all the features defined in ExplanationMetadata.inputs. The field name of the output is determined by the key in ExplanationMetadata.outputs. If the Model's predicted output has multiple dimensions (rank > 1), this is the value in the output located by output_index. If there are multiple baselines, their output values are averaged.

      * `output_name`: Output only. Name of the explain output. Specified as the key in ExplanationMetadata.outputs.

      * `feature_attributions`: Output only. Attributions of each explained feature. Features are extracted from the prediction instances according to explanation metadata for inputs. The value is a struct, whose keys are the name of the feature. The values are how much the feature in the instance contributed to the predicted result. The format of the value is determined by the feature's input format: * If the feature is a scalar value, the attribution value is a floating number. * If the feature is an array of scalar values, the attribution value is an array. * If the feature is a struct, the attribution value is a struct. The keys in the attribution value struct are the same as the keys in the feature struct. The formats of the values in the attribution struct are determined by the formats of the values in the feature struct. The ExplanationMetadata.feature_attributions_schema_uri field, pointed to by the ExplanationSpec field of the Endpoint.deployed_models object, points to the schema file that describes the features and their attribution values (if it is populated).

      * `output_index`: Output only. The index that locates the explained prediction output. If the prediction output is a scalar value, output_index is not populated. If the prediction output has multiple dimensions, the length of the output_index list is the same as the number of dimensions of the output. The i-th element in output_index is the element index of the i-th dimension of the output vector. Indices start from 0.

      * `instance_output_value`: Output only. Model predicted output on the corresponding explanation instance. The field name of the output is determined by the key in ExplanationMetadata.outputs. If the Model predicted output has multiple dimensions, this is the value in the output located by output_index.

      * `approximation_error`: Output only. Error of feature_attributions caused by approximation used in the explanation method. Lower value means more precise attributions. * For Sampled Shapley attribution, increasing path_count might reduce the error. * For Integrated Gradients attribution, increasing step_count might reduce the error. * For XRAI attribution, increasing step_count might reduce the error. See [this introduction](/vertex-ai/docs/explainable-ai/overview) for more information.

  * `name`: Output only. The resource name of the ModelEvaluation.

  * `display_name`: The display name of the ModelEvaluation.


## GCP Permissions
