---
title: About the google_dataproc_project_region_clusters resource
platform: gcp
---

## Syntax
A `google_dataproc_project_region_clusters` is used to test a Google ProjectRegionCluster resource

## Examples
```
    describe google_dataproc_project_region_clusters(projectId: ' ', region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_dataproc_project_region_clusters` resource:

See [google_dataproc_project_region_cluster.md](google_dataproc_project_region_cluster.md) for more detailed information
  * `project_ids`: an array of `google_dataproc_project_region_cluster` project_id
  * `cluster_names`: an array of `google_dataproc_project_region_cluster` cluster_name
  * `configs`: an array of `google_dataproc_project_region_cluster` config
  * `virtual_cluster_configs`: an array of `google_dataproc_project_region_cluster` virtual_cluster_config
  * `labels`: an array of `google_dataproc_project_region_cluster` labels
  * `statuses`: an array of `google_dataproc_project_region_cluster` status
  * `status_histories`: an array of `google_dataproc_project_region_cluster` status_history
  * `cluster_uuids`: an array of `google_dataproc_project_region_cluster` cluster_uuid
  * `metrics`: an array of `google_dataproc_project_region_cluster` metrics

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
