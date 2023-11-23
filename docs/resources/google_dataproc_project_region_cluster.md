---
title: About the google_dataproc_project_region_cluster resource
platform: gcp
---

## Syntax
A `google_dataproc_project_region_cluster` is used to test a Google ProjectRegionCluster resource

## Examples
```
describe google_dataproc_project_region_cluster(clusterName: ' ', projectId: ' ', region: ' value_region') do
	it { should exist }

end

describe google_dataproc_project_region_cluster(clusterName: ' ', projectId: ' ', region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_dataproc_project_region_cluster` resource:


  * `project_id`: Required. The Google Cloud Platform project ID that the cluster belongs to.

  * `cluster_name`: Required. The cluster name, which must be unique within a project. The name must start with a lowercase letter, and can contain up to 51 lowercase letters, numbers, and hyphens. It cannot end with a hyphen. The name of a deleted cluster can be reused.

  * `config`: Optional. The cluster config for a cluster of Compute Engine Instances. Note that Dataproc may set default values, and values may change when clusters are updated.Exactly one of ClusterConfig or VirtualClusterConfig must be specified.

  * `virtual_cluster_config`: Optional. The virtual cluster config is used when creating a Dataproc cluster that does not directly control the underlying compute resources, for example, when creating a Dataproc-on-GKE cluster (https://cloud.google.com/dataproc/docs/guides/dpgke/dataproc-gke-overview). Dataproc may set default values, and values may change when clusters are updated. Exactly one of config or virtual_cluster_config must be specified.

  * `labels`: Optional. The labels to associate with this cluster. Label keys must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). Label values may be empty, but, if present, must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a cluster.

    * `additional_properties`: 

  * `status`: Output only. Cluster status.

  * `status_history`: Output only. The previous cluster status.

  * `cluster_uuid`: Output only. A cluster UUID (Unique Universal Identifier). Dataproc generates this value when it creates the cluster.

  * `metrics`: Output only. Contains cluster daemon metrics such as HDFS and YARN stats.Beta Feature: This report is available for testing purposes only. It may be changed before final release.


## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
