---
title: About the google_vertex_ai_model_evaluation_slice resource
platform: gcp
---

## Syntax
A `google_vertex_ai_model_evaluation_slice` is used to test a Google ModelEvaluationSlice resource

## Examples
```
describe google_vertex_ai_model_evaluation_slice(name: "projects/#{gcp_project_id}/locations/#{models_evaluations_slice['region']}/models/#{models_evaluations_slice['model']}/evaluations/#{models_evaluations_slice['evaluation']}/slices/#{models_evaluations_slice['slice']}", region: ' value_region') do
	it { should exist }
	its('create_time') { should cmp 'value_createtime' }
	its('name') { should cmp 'value_name' }
	its('metrics_schema_uri') { should cmp 'value_metricsschemauri' }

end

describe google_vertex_ai_model_evaluation_slice(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_model_evaluation_slice` resource:


  * `create_time`: Output only. Timestamp when this ModelEvaluationSlice was created.

  * `model_explanation`: Aggregated explanation metrics for a Model over a set of instances.

    * `mean_attributions`: Output only. Aggregated attributions explaining the Model's prediction outputs over the set of instances. The attributions are grouped by outputs. For Models that predict only one output, such as regression Models that predict only one score, there is only one attibution that explains the predicted output. For Models that predict multiple outputs, such as multiclass Models that predict multiple classes, each element explains one specific item. Attribution.output_index can be used to identify which output this attribution is explaining. The baselineOutputValue, instanceOutputValue and featureAttributions fields are averaged over the test data. NOTE: Currently AutoML tabular classification Models produce only one attribution, which averages attributions over all the classes it predicts. Attribution.approximation_error is not populated.

      * `output_display_name`: Output only. The display name of the output identified by output_index. For example, the predicted class name by a multi-classification Model. This field is only populated iff the Model predicts display names as a separate field along with the explained output. The predicted display name must has the same shape of the explained output, and can be located using output_index.

      * `baseline_output_value`: Output only. Model predicted output if the input instance is constructed from the baselines of all the features defined in ExplanationMetadata.inputs. The field name of the output is determined by the key in ExplanationMetadata.outputs. If the Model's predicted output has multiple dimensions (rank > 1), this is the value in the output located by output_index. If there are multiple baselines, their output values are averaged.

      * `output_name`: Output only. Name of the explain output. Specified as the key in ExplanationMetadata.outputs.

      * `feature_attributions`: Output only. Attributions of each explained feature. Features are extracted from the prediction instances according to explanation metadata for inputs. The value is a struct, whose keys are the name of the feature. The values are how much the feature in the instance contributed to the predicted result. The format of the value is determined by the feature's input format: * If the feature is a scalar value, the attribution value is a floating number. * If the feature is an array of scalar values, the attribution value is an array. * If the feature is a struct, the attribution value is a struct. The keys in the attribution value struct are the same as the keys in the feature struct. The formats of the values in the attribution struct are determined by the formats of the values in the feature struct. The ExplanationMetadata.feature_attributions_schema_uri field, pointed to by the ExplanationSpec field of the Endpoint.deployed_models object, points to the schema file that describes the features and their attribution values (if it is populated).

      * `output_index`: Output only. The index that locates the explained prediction output. If the prediction output is a scalar value, output_index is not populated. If the prediction output has multiple dimensions, the length of the output_index list is the same as the number of dimensions of the output. The i-th element in output_index is the element index of the i-th dimension of the output vector. Indices start from 0.

      * `instance_output_value`: Output only. Model predicted output on the corresponding explanation instance. The field name of the output is determined by the key in ExplanationMetadata.outputs. If the Model predicted output has multiple dimensions, this is the value in the output located by output_index.

      * `approximation_error`: Output only. Error of feature_attributions caused by approximation used in the explanation method. Lower value means more precise attributions. * For Sampled Shapley attribution, increasing path_count might reduce the error. * For Integrated Gradients attribution, increasing step_count might reduce the error. * For XRAI attribution, increasing step_count might reduce the error. See [this introduction](/vertex-ai/docs/explainable-ai/overview) for more information.

  * `name`: Output only. The resource name of the ModelEvaluationSlice.

  * `metrics`: Output only. Sliced evaluation metrics of the Model. The schema of the metrics is stored in metrics_schema_uri

  * `slice`: Definition of a slice.

    * `value`: Output only. The value of the dimension in this slice.

    * `dimension`: Output only. The dimension of the slice. Well-known dimensions are: * `annotationSpec`: This slice is on the test data that has either ground truth or prediction with AnnotationSpec.display_name equals to value. * `slice`: This slice is a user customized slice defined by its SliceSpec.

    * `slice_spec`: Specification for how the data should be sliced.

      * `configs`: Mapping configuration for this SliceSpec. The key is the name of the feature. By default, the key will be prefixed by "instance" as a dictionary prefix for Vertex Batch Predictions output format.

        * `additional_properties`: Specification message containing the config for this SliceSpec. When `kind` is selected as `value` and/or `range`, only a single slice will be computed. When `all_values` is present, a separate slice will be computed for each possible label/value for the corresponding key in `config`. Examples, with feature zip_code with values 12345, 23334, 88888 and feature country with values "US", "Canada", "Mexico" in the dataset: Example 1: { "zip_code": { "value": { "float_value": 12345.0 } } } A single slice for any data with zip_code 12345 in the dataset. Example 2: { "zip_code": { "range": { "low": 12345, "high": 20000 } } } A single slice containing data where the zip_codes between 12345 and 20000 For this example, data with the zip_code of 12345 will be in this slice. Example 3: { "zip_code": { "range": { "low": 10000, "high": 20000 } }, "country": { "value": { "string_value": "US" } } } A single slice containing data where the zip_codes between 10000 and 20000 has the country "US". For this example, data with the zip_code of 12345 and country "US" will be in this slice. Example 4: { "country": {"all_values": { "value": true } } } Three slices are computed, one for each unique country in the dataset. Example 5: { "country": { "all_values": { "value": true } }, "zip_code": { "value": { "float_value": 12345.0 } } } Three slices are computed, one for each unique country in the dataset where the zip_code is also 12345. For this example, data with zip_code 12345 and country "US" will be in one slice, zip_code 12345 and country "Canada" in another slice, and zip_code 12345 and country "Mexico" in another slice, totaling 3 slices.

  * `metrics_schema_uri`: Output only. Points to a YAML file stored on Google Cloud Storage describing the metrics of this ModelEvaluationSlice. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject).


## GCP Permissions
