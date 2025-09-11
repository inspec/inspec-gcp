+++
title = "google_vertex_ai_index resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_index"
identifier = "inspec/resources/gcp/google_vertex_ai_index resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_index` InSpec audit resource to to test a Google Cloud Index resource.

## Examples

```ruby
describe google_vertex_ai_index(name: "projects/#{gcp_project_id}/locations/#{index['region']}/indexes/#{index['name']}", region: ' value_region') do
	it { should exist }
	its('description') { should cmp 'value_description' }
	its('name') { should cmp 'value_name' }
	its('display_name') { should cmp 'value_displayname' }
	its('metadata_schema_uri') { should cmp 'value_metadataschemauri' }
	its('index_update_method') { should cmp 'value_indexupdatemethod' }
	its('update_time') { should cmp 'value_updatetime' }
	its('create_time') { should cmp 'value_createtime' }
	its('etag') { should cmp 'value_etag' }

end

describe google_vertex_ai_index(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_index` resource:


  * `description`: The description of the Index.

  * `metadata`: An additional information about the Index; the schema of the metadata can be found in metadata_schema.

  * `index_stats`: Output only. Stats of the index resource.

  * `name`: Output only. The resource name of the Index.

  * `deployed_indexes`: Output only. The pointers to DeployedIndexes created from this Index. An Index can be only deleted if all its DeployedIndexes had been undeployed first.

  * `display_name`: Required. The display name of the Index. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `metadata_schema_uri`: Immutable. Points to a YAML file stored on Google Cloud Storage describing additional information about the Index, that is specific to it. Unset if the Index does not have any additional information. The schema is defined as an OpenAPI 3.0.2 [Schema Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject). Note: The URI given on output will be immutable and probably different, including the URI scheme, than the one given on input. The output URI will point to a location where the user only has a read access.

  * `index_update_method`: Immutable. The update method to use with this Index. If not set, BATCH_UPDATE will be used by default.
  Possible values:
    * INDEX_UPDATE_METHOD_UNSPECIFIED
    * BATCH_UPDATE
    * STREAM_UPDATE

  * `update_time`: Output only. Timestamp when this Index was most recently updated. This also includes any update to the contents of the Index. Note that Operations working on this Index may have their Operations.metadata.generic_metadata.update_time a little after the value of this timestamp, yet that does not mean their results are not already reflected in the Index. Result of any successfully completed Operation on the Index is reflected in it.

  * `create_time`: Output only. Timestamp when this Index was created.

  * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `labels`: The labels with user-defined metadata to organize your Indexes. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 


## GCP permissions
