---
title: About the google_vertex_ai_featurestore_entity_type_features resource
platform: gcp
---

## Syntax
A `google_vertex_ai_featurestore_entity_type_features` is used to test a Google FeaturestoreEntityTypeFeature resource

## Examples
```
    describe google_vertex_ai_featurestore_entity_type_features(parent: "projects/#{gcp_project_id}/locations/#{featurestore_entity_type_feature['region']}/featurestores/#{featurestore_entity_type_feature['featurestore']}/entityTypes/#{featurestore_entity_type_feature['entityType']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_featurestore_entity_type_features` resource:

See [google_vertex_ai_featurestore_entity_type_feature.md](google_vertex_ai_featurestore_entity_type_feature.md) for more detailed information
  * `descriptions`: an array of `google_vertex_ai_featurestore_entity_type_feature` description
  * `create_times`: an array of `google_vertex_ai_featurestore_entity_type_feature` create_time
  * `monitoring_stats_anomalies`: an array of `google_vertex_ai_featurestore_entity_type_feature` monitoring_stats_anomalies
  * `etags`: an array of `google_vertex_ai_featurestore_entity_type_feature` etag
  * `labels`: an array of `google_vertex_ai_featurestore_entity_type_feature` labels
  * `names`: an array of `google_vertex_ai_featurestore_entity_type_feature` name
  * `update_times`: an array of `google_vertex_ai_featurestore_entity_type_feature` update_time
  * `disable_monitorings`: an array of `google_vertex_ai_featurestore_entity_type_feature` disable_monitoring
  * `value_types`: an array of `google_vertex_ai_featurestore_entity_type_feature` value_type

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
