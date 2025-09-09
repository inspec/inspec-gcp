+++
title = "google_bigtableadmin_cluster Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_bigtableadmin_cluster"
identifier = "inspec/resources/gcp/google_bigtableadmin_cluster Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_bigtableadmin_cluster` InSpec audit resource to test the properties of a Google Cloud Cluster resource.

## Examples

```ruby
describe google_bigtableadmin_cluster(name: 'value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('location') { should cmp 'value_location' }
	its('state') { should cmp 'value_state' }
	its('default_storage_type') { should cmp 'value_defaultstoragetype' }
end

describe google_bigtableadmin_cluster(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters

Parameters that can be accessed from the `google_bigtableadmin_cluster` resource:

## Properties

Properties that can be accessed from the `google_bigtableadmin_cluster` resource:


  * `name`: The unique name of the cluster. Values are of the form `projects/{project}/instances/{instance}/clusters/a-z*`.

  * `location`: Immutable. The location where this cluster's nodes and storage reside. For best performance, clients should be located as close as possible to this cluster. Currently only zones are supported, so values should be of the form `projects/{project}/locations/{zone}`.

  * `state`: Output only. The current state of the cluster.
  Possible values:
    * STATE_NOT_KNOWN
    * READY
    * CREATING
    * RESIZING
    * DISABLED

  * `serve_nodes`: The number of nodes in the cluster. If no value is set, Cloud Bigtable automatically allocates nodes based on your data footprint and optimized for 50% storage utilization.

  * `cluster_config`: Configuration for a cluster.

    * `cluster_autoscaling_config`: Autoscaling config for a cluster.

      * `autoscaling_limits`: Limits for the number of nodes a Cluster can autoscale up/down to.

        * `min_serve_nodes`: Required. Minimum number of nodes to scale down to.

        * `max_serve_nodes`: Required. Maximum number of nodes to scale up to.

      * `autoscaling_targets`: The Autoscaling targets for a Cluster. These determine the recommended nodes.

        * `cpu_utilization_percent`: The cpu utilization that the Autoscaler should be trying to achieve. This number is on a scale from 0 (no utilization) to 100 (total utilization), and is limited between 10 and 80, otherwise it will return INVALID_ARGUMENT error.

        * `storage_utilization_gib_per_node`: The storage utilization that the Autoscaler should be trying to achieve. This number is limited between 2560 (2.5TiB) and 5120 (5TiB) for a SSD cluster and between 8192 (8TiB) and 16384 (16TiB) for an HDD cluster, otherwise it will return INVALID_ARGUMENT error. If this value is set to 0, it will be treated as if it were set to the default value: 2560 for SSD, 8192 for HDD.

  * `default_storage_type`: Immutable. The type of storage used by this cluster to serve its parent instance's tables, unless explicitly overridden.
  Possible values:
    * STORAGE_TYPE_UNSPECIFIED
    * SSD
    * HDD

  * `encryption_config`: Cloud Key Management Service (Cloud KMS) settings for a CMEK-protected cluster.

    * `kms_key_name`: Describes the Cloud KMS encryption key that will be used to protect the destination Bigtable cluster. The requirements for this key are: 1) The Cloud Bigtable service account associated with the project that contains this cluster must be granted the `cloudkms.cryptoKeyEncrypterDecrypter` role on the CMEK key. 2) Only regional keys can be used and the region of the CMEK key must match the region of the cluster. Values are of the form `projects/{project}/locations/{location}/keyRings/{keyring}/cryptoKeys/{key}`


## GCP permissions

Ensure the [https://bigtableadmin.googleapis.com/](https://console.cloud.google.com/apis/library/bigtableadmin.googleapis.com/) is enabled for the current project.
