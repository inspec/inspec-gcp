+++
title = "google_vertex_ai_metadata_stores resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_metadata_stores"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_stores Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_metadata_stores` InSpec audit resource to to test a Google Cloud MetadataStore resource.

## Examples

```ruby
    describe google_vertex_ai_metadata_stores(parent: "projects/#{gcp_project_id}/locations/#{metadata_store['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_metadata_stores` resource:

See [google_vertex_ai_metadata_store](google_vertex_ai_metadata_store) for more detailed information.

  * `descriptions`: an array of `google_vertex_ai_metadata_store` description
  * `create_times`: an array of `google_vertex_ai_metadata_store` create_time
  * `update_times`: an array of `google_vertex_ai_metadata_store` update_time
  * `encryption_specs`: an array of `google_vertex_ai_metadata_store` encryption_spec
  * `states`: an array of `google_vertex_ai_metadata_store` state
  * `names`: an array of `google_vertex_ai_metadata_store` name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
