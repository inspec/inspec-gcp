+++
title = "google_vertex_ai_metadata_stores_context resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_metadata_stores_context"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores_context resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_metadata_stores_context` InSpec audit resource to to test a Google Cloud MetadataStoresContext resource.

## Examples

```ruby
describe google_vertex_ai_metadata_stores_context(name: "projects/#{gcp_project_id}/locations/#{metadata_stores_context['region']}/metadataStores/#{metadata_stores_context['metadataStore']}/contexts/#{metadata_stores_context['name']}", region: ' value_region') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('schema_title') { should cmp 'value_schematitle' }
	its('etag') { should cmp 'value_etag' }
	its('description') { should cmp 'value_description' }
	its('display_name') { should cmp 'value_displayname' }
	its('schema_version') { should cmp 'value_schemaversion' }
	its('create_time') { should cmp 'value_createtime' }
	its('update_time') { should cmp 'value_updatetime' }

end

describe google_vertex_ai_metadata_stores_context(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_metadata_stores_context` resource:


  * `name`: Immutable. The resource name of the Context.

  * `schema_title`: The title of the schema describing the metadata. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

  * `etag`: An eTag used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `description`: Description of the Context

  * `display_name`: User provided display name of the Context. May be up to 128 Unicode characters.

  * `schema_version`: The version of the schema in schema_name to use. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

  * `create_time`: Output only. Timestamp when this Context was created.

  * `labels`: The labels with user-defined metadata to organize your Contexts. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Context (System labels are excluded).

    * `additional_properties`: 

  * `metadata`: Properties of the Context. Top level metadata keys' heading and trailing spaces will be trimmed. The size of this field should not exceed 200KB.

    * `additional_properties`: Properties of the object.

  * `update_time`: Output only. Timestamp when this Context was last updated.

  * `parent_contexts`: Output only. A list of resource names of Contexts that are parents of this Context. A Context may have at most 10 parent_contexts.


## GCP permissions
