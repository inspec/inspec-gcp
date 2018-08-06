---
title: About the google_container_cluster Resource
platform: gcp
---

# google\_container\_cluster

Use the `google_container_cluster` InSpec audit resource to test properties of a single GCP container cluster.

<br>

## Availability

### Installation

This resource is available in the `inspec-gcp` [resource pack](https://www.inspec.io/docs/reference/glossary/#resource-pack).  To use it, add the following to your `inspec.yml` in your top-level profile:

    depends:
      inspec-gcp:
        git: https://github.com/inspec/inspec-gcp.git

You'll also need to setup your GCP credentials; see the resource pack [README](https://github.com/inspec/inspec-gcp#prerequisites).

### Version

This resource first became available in v0.3.0 of the inspec-gcp resource pack.

## Syntax

A `google_container_cluster` resource block declares the tests for a single GCP container cluster by project, zone and name.

    describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'inspec-gcp-kube-cluster') do
      it { should exist }
      its('name') { should eq 'inspec-gcp-kube-cluster' }
      its('zone') { should match 'europe-west2-a' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP container cluster is in a particular state e.g. "RUNNING"

    describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'inspec-gcp-kube-cluster') do
      its('status') { should eq 'RUNNING' }
    end

### Test that a GCP container cluster has the expected kube master user/password

    describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'inspec-gcp-kube-cluster') do
      its('master_auth.username'){ should eq "user_name"}
      its('master_auth.password'){ should eq "choose_something_strong"}
    end

### Test that the locations where the GCP container cluster is running match those expected

    describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'inspec-gcp-kube-cluster') do
      its('locations.sort'){should cmp ["europe-west2-a", "europe-west2-b", "europe-west2-c"].sort}
    end

### Test GCP container cluster network and subnetwork settings

    describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'inspec-gcp-kube-cluster') do
      its('network'){should eq "default"}
      its('subnetwork'){should eq "default"}
    end

### Test GCP container cluster node pool configuration settings

    describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'inspec-gcp-kube-cluster') do
      its('node_config.disk_size_gb'){should eq 100}
      its('node_config.image_type'){should eq "COS"}
      its('node_config.machine_type'){should eq "n1-standard-1"}
      its('node_ipv4_cidr_size'){should eq 24}
      its('node_pools.count'){should eq 1}
    end

<br>

## Properties

*  `addons_config`, `cluster_ipv4_cidr`, `create_time`, `current_master_version`, `current_node_count`, `current_node_version`, `endpoint`, `initial_cluster_version`, `initial_node_count`, `instance_group_urls`, `label_fingerprint`, `legacy_abac`, `locations`, `logging_service`, `master_auth`, `monitoring_service`, `name`, `network`, `node_config`, `node_ipv4_cidr_size`, `node_pools`, `services_ipv4_cidr`, `status`, `subnetwork`, `zone`

<br>


## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com) is enabled for the project where the resource is located.