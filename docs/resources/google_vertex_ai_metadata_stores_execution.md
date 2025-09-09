+++
title = "google_vertex_ai_metadata_stores_execution resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_metadata_stores_execution"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores_execution Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_metadata_stores_execution` InSpec audit resource to to test a Google Cloud MetadataStoresExecution resource.

## Examples

```ruby
describe google_vertex_ai_metadata_stores_execution(name: "projects/#{gcp_project_id}/locations/#{metadata_stores_execution['region']}/metadataStores/#{metadata_stores_execution['metadataStore']}/executions/#{metadata_stores_execution['name']}", region: ' value_region') do
	it { should exist }
	its('create_time') { should cmp 'value_createtime' }
	its('schema_version') { should cmp 'value_schemaversion' }
	its('state') { should cmp 'value_state' }
	its('name') { should cmp 'value_name' }
	its('etag') { should cmp 'value_etag' }
	its('display_name') { should cmp 'value_displayname' }
	its('schema_title') { should cmp 'value_schematitle' }
	its('description') { should cmp 'value_description' }
	its('update_time') { should cmp 'value_updatetime' }

end

describe google_vertex_ai_metadata_stores_execution(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_metadata_stores_execution` resource:


  * `labels`: The labels with user-defined metadata to organize your Executions. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Execution (System labels are excluded).

    * `additional_properties`: 

  * `create_time`: Output only. Timestamp when this Execution was created.

  * `schema_version`: The version of the schema in `schema_title` to use. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

  * `state`: The state of this Execution. This is a property of the Execution, and does not imply or capture any ongoing process. This property is managed by clients (such as Vertex AI Pipelines) and the system does not prescribe or check the validity of state transitions.
  Possible values:
    * STATE_UNSPECIFIED
    * NEW
    * RUNNING
    * COMPLETE
    * FAILED
    * CACHED
    * CANCELLED

  * `name`: Output only. The resource name of the Execution.

  * `etag`: An eTag used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `display_name`: User provided display name of the Execution. May be up to 128 Unicode characters.

  * `metadata`: Properties of the Execution. Top level metadata keys' heading and trailing spaces will be trimmed. The size of this field should not exceed 200KB.

    * `additional_properties`: Properties of the object.

  * `schema_title`: The title of the schema describing the metadata. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

  * `description`: Description of the Execution

  * `update_time`: Output only. Timestamp when this Execution was last updated.


## GCP permissions
