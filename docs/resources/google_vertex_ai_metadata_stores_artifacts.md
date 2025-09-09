+++
title = "google_vertex_ai_metadata_stores_artifacts resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_metadata_stores_artifacts"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores_artifacts Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_metadata_stores_artifacts` InSpec audit resource to to test a Google Cloud MetadataStoresArtifact resource.

## Examples

```ruby
    describe google_vertex_ai_metadata_stores_artifacts(parent: "projects/#{gcp_project_id}/locations/#{metadata_stores_artifact['region']}/metadataStores/#{metadata_stores_artifact['metadataStore']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_metadata_stores_artifacts` resource:

See [google_vertex_ai_metadata_stores_artifact](google_vertex_ai_metadata_stores_artifact) for more detailed information.

  * `schema_versions`: an array of `google_vertex_ai_metadata_stores_artifact` schema_version
  * `display_names`: an array of `google_vertex_ai_metadata_stores_artifact` display_name
  * `etags`: an array of `google_vertex_ai_metadata_stores_artifact` etag
  * `names`: an array of `google_vertex_ai_metadata_stores_artifact` name
  * `update_times`: an array of `google_vertex_ai_metadata_stores_artifact` update_time
  * `states`: an array of `google_vertex_ai_metadata_stores_artifact` state
  * `metadata`: an array of `google_vertex_ai_metadata_stores_artifact` metadata
  * `uris`: an array of `google_vertex_ai_metadata_stores_artifact` uri
  * `create_times`: an array of `google_vertex_ai_metadata_stores_artifact` create_time
  * `schema_titles`: an array of `google_vertex_ai_metadata_stores_artifact` schema_title
  * `descriptions`: an array of `google_vertex_ai_metadata_stores_artifact` description
  * `labels`: an array of `google_vertex_ai_metadata_stores_artifact` labels

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
