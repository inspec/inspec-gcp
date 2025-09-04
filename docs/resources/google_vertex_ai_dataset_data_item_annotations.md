+++
title = "google_vertex_ai_dataset_data_item_annotations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_dataset_data_item_annotations"
identifier = "inspec/resources/gcp/google_vertex_ai_dataset_data_item_annotations Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_dataset_data_item_annotations` is used to test a Google DatasetDataItemAnnotation resource

## Examples
```
    describe google_vertex_ai_dataset_data_item_annotations(parent: "projects/#{gcp_project_id}/locations/#{dataset_data_item_annotation['region']}/datasets/#{dataset_data_item_annotation['dataset']}/dataItems/#{dataset_data_item_annotation['dataItem']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_dataset_data_item_annotations` resource:

See [google_vertex_ai_dataset_data_item_annotation.md](google_vertex_ai_dataset_data_item_annotation.md) for more detailed information
  * `payload_schema_uris`: an array of `google_vertex_ai_dataset_data_item_annotation` payload_schema_uri
  * `create_times`: an array of `google_vertex_ai_dataset_data_item_annotation` create_time
  * `etags`: an array of `google_vertex_ai_dataset_data_item_annotation` etag
  * `labels`: an array of `google_vertex_ai_dataset_data_item_annotation` labels
  * `update_times`: an array of `google_vertex_ai_dataset_data_item_annotation` update_time
  * `payloads`: an array of `google_vertex_ai_dataset_data_item_annotation` payload
  * `annotation_sources`: an array of `google_vertex_ai_dataset_data_item_annotation` annotation_source
  * `names`: an array of `google_vertex_ai_dataset_data_item_annotation` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
