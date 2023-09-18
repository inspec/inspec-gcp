---
title: About the google_vertex_ai_datasets_data_item resource
platform: gcp
---

## Syntax
A `google_vertex_ai_datasets_data_item` is used to test a Google DatasetsDataItem resource

## Examples
```
describe google_vertex_ai_datasets_data_item() do
	it { should exist }
	its('update_time') { should cmp 'value_updatetime' }
	its('etag') { should cmp 'value_etag' }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }

end

describe google_vertex_ai_datasets_data_item() do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_datasets_data_item` resource:


  * `update_time`: Output only. Timestamp when this DataItem was last updated.

  * `etag`: Optional. Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `name`: Output only. The resource name of the DataItem.

  * `create_time`: Output only. Timestamp when this DataItem was created.

  * `payload`: Required. The data that the DataItem represents (for example, an image or a text snippet). The schema of the payload is stored in the parent Dataset's metadata schema's dataItemSchemaUri field.

  * `labels`: Optional. The labels with user-defined metadata to organize your DataItems. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one DataItem(System labels are excluded). See https://goo.gl/xmQnxf for more information and examples of labels. System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable.

    * `additional_properties`: 


## GCP Permissions
