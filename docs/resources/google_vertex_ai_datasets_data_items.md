---
title: About the google_vertex_ai_datasets_data_items resource
platform: gcp
---

## Syntax
A `google_vertex_ai_datasets_data_items` is used to test a Google DatasetsDataItem resource

## Examples
```
    describe google_vertex_ai_datasets_data_items(parent: "projects/#{gcp_project_id}/locations/#{datasets_data_item['region']}/datasets/#{datasets_data_item['dataset']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_datasets_data_items` resource:

See [google_vertex_ai_datasets_data_item.md](google_vertex_ai_datasets_data_item.md) for more detailed information
  * `update_times`: an array of `google_vertex_ai_datasets_data_item` update_time
  * `etags`: an array of `google_vertex_ai_datasets_data_item` etag
  * `names`: an array of `google_vertex_ai_datasets_data_item` name
  * `create_times`: an array of `google_vertex_ai_datasets_data_item` create_time
  * `payloads`: an array of `google_vertex_ai_datasets_data_item` payload
  * `labels`: an array of `google_vertex_ai_datasets_data_item` labels

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
