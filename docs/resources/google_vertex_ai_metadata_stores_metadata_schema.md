---
title: About the google_vertex_ai_metadata_stores_metadata_schema resource
platform: gcp
---

## Syntax
A `google_vertex_ai_metadata_stores_metadata_schema` is used to test a Google MetadataStoresMetadataSchema resource

## Examples
```
describe google_vertex_ai_metadata_stores_metadata_schema(name: "projects/#{gcp_project_id}/locations/#{metadata_stores_metadata_schema['region']}/metadataStores/#{metadata_stores_metadata_schema['metadataStore']}/metadataSchemas/#{metadata_stores_metadata_schema['name']}", region: ' value_region') do
	it { should exist }
	its('schema_type') { should cmp 'value_schematype' }
	its('description') { should cmp 'value_description' }
	its('schema_version') { should cmp 'value_schemaversion' }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }
	its('schema') { should cmp 'value_schema' }

end

describe google_vertex_ai_metadata_stores_metadata_schema(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_metadata_stores_metadata_schema` resource:


  * `schema_type`: The type of the MetadataSchema. This is a property that identifies which metadata types will use the MetadataSchema.
  Possible values:
    * METADATA_SCHEMA_TYPE_UNSPECIFIED
    * ARTIFACT_TYPE
    * EXECUTION_TYPE
    * CONTEXT_TYPE

  * `description`: Description of the Metadata Schema

  * `schema_version`: The version of the MetadataSchema. The version's format must match the following regular expression: `^[0-9]+.+.+$`, which would allow to order/compare different versions. Example: 1.0.0, 1.0.1, etc.

  * `name`: Output only. The resource name of the MetadataSchema.

  * `create_time`: Output only. Timestamp when this MetadataSchema was created.

  * `schema`: Required. The raw YAML string representation of the MetadataSchema. The combination of [MetadataSchema.version] and the schema name given by `title` in [MetadataSchema.schema] must be unique within a MetadataStore. The schema is defined as an OpenAPI 3.0.2 [MetadataSchema Object](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.2.md#schemaObject)


## GCP Permissions
