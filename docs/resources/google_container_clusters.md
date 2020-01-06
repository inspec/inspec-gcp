---
title: About the google_container_clusters resource
platform: gcp
---

## Syntax
A `google_container_clusters` is used to test a Google Cluster resource

## Examples
```
describe google_container_clusters(project: 'chef-gcp-inspec', location: 'europe-west2-a') do
  its('cluster_names') { should include 'gcp-inspec-kube-cluster' }
end
```

## Properties
Properties that can be accessed from the `google_container_clusters` resource:

See [google_container_cluster.md](google_container_cluster.md) for more detailed information
  * `cluster_names`: an array of `google_container_cluster` name
  * `descriptions`: an array of `google_container_cluster` description
  * `initial_node_counts`: an array of `google_container_cluster` initial_node_count
  * `node_configs`: an array of `google_container_cluster` node_config
  * `master_auths`: an array of `google_container_cluster` master_auth
  * `logging_services`: an array of `google_container_cluster` logging_service
  * `monitoring_services`: an array of `google_container_cluster` monitoring_service
  * `cluster_networks`: an array of `google_container_cluster` network
  * `private_cluster_configs`: an array of `google_container_cluster` private_cluster_config
  * `cluster_ipv4_cidrs`: an array of `google_container_cluster` cluster_ipv4_cidr
  * `enable_tpus`: an array of `google_container_cluster` enable_tpu
  * `tpu_ipv4_cidr_blocks`: an array of `google_container_cluster` tpu_ipv4_cidr_block
  * `addons_configs`: an array of `google_container_cluster` addons_config
  * `subnetworks`: an array of `google_container_cluster` subnetwork
  * `locations`: an array of `google_container_cluster` locations
  * `resource_labels`: an array of `google_container_cluster` resource_labels
  * `label_fingerprints`: an array of `google_container_cluster` label_fingerprint
  * `legacy_abacs`: an array of `google_container_cluster` legacy_abac
  * `network_policies`: an array of `google_container_cluster` network_policy
  * `default_max_pods_constraints`: an array of `google_container_cluster` default_max_pods_constraint
  * `ip_allocation_policies`: an array of `google_container_cluster` ip_allocation_policy
  * `endpoints`: an array of `google_container_cluster` endpoint
  * `initial_cluster_versions`: an array of `google_container_cluster` initial_cluster_version
  * `current_master_versions`: an array of `google_container_cluster` current_master_version
  * `current_node_versions`: an array of `google_container_cluster` current_node_version
  * `create_times`: an array of `google_container_cluster` create_time
  * `cluster_statuses`: an array of `google_container_cluster` status
  * `status_messages`: an array of `google_container_cluster` status_message
  * `node_ipv4_cidr_sizes`: an array of `google_container_cluster` node_ipv4_cidr_size
  * `services_ipv4_cidrs`: an array of `google_container_cluster` services_ipv4_cidr
  * `current_node_counts`: an array of `google_container_cluster` current_node_count
  * `expire_times`: an array of `google_container_cluster` expire_time
  * `conditions`: an array of `google_container_cluster` conditions
  * `master_authorized_networks_configs`: an array of `google_container_cluster` master_authorized_networks_config
  * `node_pools`: an array of `google_container_cluster` node_pools
  * `locations`: an array of `google_container_cluster` location

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
