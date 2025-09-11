+++
title = "google_vertex_ai_featurestore_entity_type_feature resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_featurestore_entity_type_feature"
identifier = "inspec/resources/gcp/google_vertex_ai_featurestore_entity_type_feature resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_featurestore_entity_type_feature` InSpec audit resource to to test a Google Cloud FeaturestoreEntityTypeFeature resource.

## Examples

```ruby
describe google_vertex_ai_featurestore_entity_type_feature(name: "projects/#{gcp_project_id}/locations/#{featurestore_entity_type_feature['region']}/featurestores/#{featurestore_entity_type_feature['featurestore']}/entityTypes/#{featurestore_entity_type_feature['entityType']}/features/#{featurestore_entity_type_feature['feature']}", region: ' value_region') do
	it { should exist }
	its('description') { should cmp 'value_description' }
	its('create_time') { should cmp 'value_createtime' }
	its('etag') { should cmp 'value_etag' }
	its('name') { should cmp 'value_name' }
	its('update_time') { should cmp 'value_updatetime' }
	its('value_type') { should cmp 'value_valuetype' }

end

describe google_vertex_ai_featurestore_entity_type_feature(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_featurestore_entity_type_feature` resource:


  * `description`: Description of the Feature.

  * `create_time`: Output only. Timestamp when this EntityType was created.

  * `monitoring_stats_anomalies`: Output only. The list of historical stats and anomalies with specified objectives.

  * `etag`: Used to perform a consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `labels`: Optional. The labels with user-defined metadata to organize your Features. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information on and examples of labels. No more than 64 user labels can be associated with one Feature (System labels are excluded)." System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable.

    * `additional_properties`: 

  * `name`: Immutable. Name of the Feature. Format: `projects/{project}/locations/{location}/featurestores/{featurestore}/entityTypes/{entity_type}/features/{feature}` The last part feature is assigned by the client. The feature can be up to 64 characters long and can consist only of ASCII Latin letters A-Z and a-z, underscore(_), and ASCII digits 0-9 starting with a letter. The value will be unique given an entity type.

  * `update_time`: Output only. Timestamp when this EntityType was most recently updated.

  * `disable_monitoring`: Optional. If not set, use the monitoring_config defined for the EntityType this Feature belongs to. Only Features with type (Feature.ValueType) BOOL, STRING, DOUBLE or INT64 can enable monitoring. If set to true, all types of data monitoring are disabled despite the config on EntityType.

  * `value_type`: Required. Immutable. Type of Feature value.
  Possible values:
    * VALUE_TYPE_UNSPECIFIED
    * BOOL
    * BOOL_ARRAY
    * DOUBLE
    * DOUBLE_ARRAY
    * INT64
    * INT64_ARRAY
    * STRING
    * STRING_ARRAY
    * BYTES


## GCP permissions
