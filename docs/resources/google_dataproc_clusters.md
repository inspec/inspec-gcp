+++
title = "google_dataproc_clusters resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_dataproc_clusters"
identifier = "inspec/resources/gcp/google_dataproc_clusters Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_dataproc_clusters` is used to test a Google Cluster resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_dataproc_clusters(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('count') { should be >= 1 }
  its('cluster_names') { should include 'inspec-dataproc-cluster' }
end
```

## Properties
Properties that can be accessed from the `google_dataproc_clusters` resource:

See [google_dataproc_cluster.md](google_dataproc_cluster.md) for more detailed information
  * `cluster_names`: an array of `google_dataproc_cluster` cluster_name
  * `labels`: an array of `google_dataproc_cluster` labels
  * `configs`: an array of `google_dataproc_cluster` config
  * `regions`: an array of `google_dataproc_cluster` region
  * `project_ids`: an array of `google_dataproc_cluster` project_id
  * `virtual_cluster_configs`: an array of `google_dataproc_cluster` virtual_cluster_config
  * `statuses`: an array of `google_dataproc_cluster` status
  * `status_histories`: an array of `google_dataproc_cluster` status_history
  * `cluster_uuids`: an array of `google_dataproc_cluster` cluster_uuid
  * `metrics`: an array of `google_dataproc_cluster` metrics

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
