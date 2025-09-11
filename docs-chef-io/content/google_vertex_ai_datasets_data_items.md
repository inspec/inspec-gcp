+++
title = "google_vertex_ai_datasets_data_items resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_datasets_data_items"
identifier = "inspec/resources/gcp/google_vertex_ai_datasets_data_items resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_datasets_data_items` InSpec audit resource to to test a Google Cloud DatasetsDataItem resource.

## Examples

```ruby
    describe google_vertex_ai_datasets_data_items(parent: "projects/#{gcp_project_id}/locations/#{datasets_data_item['region']}/datasets/#{datasets_data_item['dataset']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_datasets_data_items` resource:

See [google_vertex_ai_datasets_data_item](google_vertex_ai_datasets_data_item) for more detailed information.

  * `update_times`: an array of `google_vertex_ai_datasets_data_item` update_time
  * `etags`: an array of `google_vertex_ai_datasets_data_item` etag
  * `names`: an array of `google_vertex_ai_datasets_data_item` name
  * `create_times`: an array of `google_vertex_ai_datasets_data_item` create_time
  * `payloads`: an array of `google_vertex_ai_datasets_data_item` payload
  * `labels`: an array of `google_vertex_ai_datasets_data_item` labels

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
