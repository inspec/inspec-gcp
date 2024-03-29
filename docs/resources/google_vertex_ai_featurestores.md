---
title: About the google_vertex_ai_featurestores resource
platform: gcp
---

## Syntax
A `google_vertex_ai_featurestores` is used to test a Google Featurestore resource

## Examples
```
    describe google_vertex_ai_featurestores(parent: "projects/#{gcp_project_id}/locations/#{featurestore['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_featurestores` resource:

See [google_vertex_ai_featurestore.md](google_vertex_ai_featurestore.md) for more detailed information
  * `states`: an array of `google_vertex_ai_featurestore` state
  * `create_times`: an array of `google_vertex_ai_featurestore` create_time
  * `etags`: an array of `google_vertex_ai_featurestore` etag
  * `online_storage_ttl_days`: an array of `google_vertex_ai_featurestore` online_storage_ttl_days
  * `encryption_specs`: an array of `google_vertex_ai_featurestore` encryption_spec
  * `labels`: an array of `google_vertex_ai_featurestore` labels
  * `update_times`: an array of `google_vertex_ai_featurestore` update_time
  * `names`: an array of `google_vertex_ai_featurestore` name
  * `online_serving_configs`: an array of `google_vertex_ai_featurestore` online_serving_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
