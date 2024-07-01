+++

title = "google_bigtableadmin_clusters Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_bigtableadmin_clusters"
identifier = "inspec/resources/gcp/google_bigtableadmin_clusters Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_bigtableadmin_clusters` InSpec audit resource to test the properties of a test a Google Cluster.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_bigtableadmin_clusters` is used to test a Google Cluster resource

## Examples
```
  describe google_bigtableadmin_clusters(parent: ' value_parent') do
    it { should exist }
    its('names') { should include 'value_name' }
    its('locations') { should include 'value_location' }
    its('states') { should include 'value_state' }
    its('default_storage_types') { should include 'value_defaultstoragetype' }
  end
```

## Parameters
Properties that can be accessed from the `google_bigtableadmin_clusters` resource:

See [google_bigtableadmin_cluster.md](google_bigtableadmin_cluster.md) for more detailed information
* `names`: an array of `google_bigtableadmin_cluster` name
* `locations`: an array of `google_bigtableadmin_cluster` location
* `states`: an array of `google_bigtableadmin_cluster` state
* `serve_nodes`: an array of `google_bigtableadmin_cluster` serve_nodes
* `cluster_configs`: an array of `google_bigtableadmin_cluster` cluster_config
* `default_storage_types`: an array of `google_bigtableadmin_cluster` default_storage_type
* `encryption_configs`: an array of `google_bigtableadmin_cluster` encryption_config
## Properties
Properties that can be accessed from the `google_bigtableadmin_clusters` resource:

See [google_bigtableadmin_cluster.md](google_bigtableadmin_cluster.md) for more detailed information
* `names`: an array of `google_bigtableadmin_cluster` name
* `locations`: an array of `google_bigtableadmin_cluster` location
* `states`: an array of `google_bigtableadmin_cluster` state
* `serve_nodes`: an array of `google_bigtableadmin_cluster` serve_nodes
* `cluster_configs`: an array of `google_bigtableadmin_cluster` cluster_config
* `default_storage_types`: an array of `google_bigtableadmin_cluster` default_storage_type
* `encryption_configs`: an array of `google_bigtableadmin_cluster` encryption_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://bigtableadmin.googleapis.com/](https://console.cloud.google.com/apis/library/bigtableadmin.googleapis.com/) is enabled for the current project.
