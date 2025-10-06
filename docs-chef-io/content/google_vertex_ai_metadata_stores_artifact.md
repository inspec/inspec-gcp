+++
title = "google_vertex_ai_metadata_stores_artifact resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_metadata_stores_artifact"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores_artifact resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_metadata_stores_artifact` InSpec audit resource to to test a Google Cloud MetadataStoresArtifact resource.

## Examples

```ruby
describe google_vertex_ai_metadata_stores_artifact(name: "projects/#{gcp_project_id}/locations/#{metadata_stores_artifact['region']}/metadataStores/#{metadata_stores_artifact['metadataStore']}/artifacts/#{metadata_stores_artifact['name']}", region: ' value_region') do
	it { should exist }
	its('schema_version') { should cmp 'value_schemaversion' }
	its('display_name') { should cmp 'value_displayname' }
	its('etag') { should cmp 'value_etag' }
	its('name') { should cmp 'value_name' }
	its('update_time') { should cmp 'value_updatetime' }
	its('state') { should cmp 'value_state' }
	its('uri') { should cmp 'value_uri' }
	its('create_time') { should cmp 'value_createtime' }
	its('schema_title') { should cmp 'value_schematitle' }
	its('description') { should cmp 'value_description' }

end

describe google_vertex_ai_metadata_stores_artifact(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_metadata_stores_artifact` resource:


  * `schema_version`: The version of the schema in schema_name to use. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

  * `display_name`: User provided display name of the Artifact. May be up to 128 Unicode characters.

  * `etag`: An eTag used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `name`: Output only. The resource name of the Artifact.

  * `update_time`: Output only. Timestamp when this Artifact was last updated.

  * `state`: The state of this Artifact. This is a property of the Artifact, and does not imply or capture any ongoing process. This property is managed by clients (such as Vertex AI Pipelines), and the system does not prescribe or check the validity of state transitions.
  Possible values:
    * STATE_UNSPECIFIED
    * PENDING
    * LIVE

  * `metadata`: Properties of the Artifact. Top level metadata keys' heading and trailing spaces will be trimmed. The size of this field should not exceed 200KB.

    * `additional_properties`: Properties of the object.

  * `uri`: The uniform resource identifier of the artifact file. May be empty if there is no actual artifact file.

  * `create_time`: Output only. Timestamp when this Artifact was created.

  * `schema_title`: The title of the schema describing the metadata. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

  * `description`: Description of the Artifact

  * `labels`: The labels with user-defined metadata to organize your Artifacts. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Artifact (System labels are excluded).

    * `additional_properties`: 


## GCP permissions
