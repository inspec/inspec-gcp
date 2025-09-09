+++
title = "google_bigtableadmin_instance_app_profile Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_bigtableadmin_instance_app_profile"
identifier = "inspec/resources/gcp/google_bigtableadmin_instance_app_profile Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_bigtableadmin_instance_app_profile` InSpec audit resource to test the properties of a Google Cloud InstanceAppProfile resource.

## Examples

```ruby
describe google_bigtableadmin_instance_app_profile(name: 'value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('etag') { should cmp 'value_etag' }
	its('description') { should cmp 'value_description' }
	its('priority') { should cmp 'value_priority' }

end

describe google_bigtableadmin_instance_app_profile(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters

Parameters that can be accessed from the `google_bigtableadmin_instance_app_profile` resource:

## Properties

Properties that can be accessed from the `google_bigtableadmin_instance_app_profile` resource:


  * `name`: The unique name of the app profile. Values are of the form `projects/{project}/instances/{instance}/appProfiles/_a-zA-Z0-9*`.

  * `etag`: Strongly validated etag for optimistic concurrency control. Preserve the value returned from `GetAppProfile` when calling `UpdateAppProfile` to fail the request if there has been a modification in the mean time. The `update_mask` of the request need not include `etag` for this protection to apply. See [Wikipedia](https://en.wikipedia.org/wiki/HTTP_ETag) and [RFC 7232](https://tools.ietf.org/html/rfc7232#section-2.3) for more details.

  * `description`: Long form description of the use case for this AppProfile.

  * `multi_cluster_routing_use_any`: Read/write requests are routed to the nearest cluster in the instance, and will fail over to the nearest cluster that is available in the event of transient errors or delays. Clusters in a region are considered equidistant. Choosing this option sacrifices read-your-writes consistency to improve availability.

    * `cluster_ids`: The set of clusters to route to. The order is ignored; clusters will be tried in order of distance. If left empty, all clusters are eligible.

  * `single_cluster_routing`: Unconditionally routes all read/write requests to a specific cluster. This option preserves read-your-writes consistency but does not improve availability.

    * `cluster_id`: The cluster to which read/write requests should be routed.

    * `allow_transactional_writes`: Whether or not `CheckAndMutateRow` and `ReadModifyWriteRow` requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters.

  * `priority`: This field has been deprecated in favor of `standard_isolation.priority`. If you set this field, `standard_isolation.priority` will be set instead. The priority of requests sent using this app profile.
  Possible values:
    * PRIORITY_UNSPECIFIED
    * PRIORITY_LOW
    * PRIORITY_MEDIUM
    * PRIORITY_HIGH

  * `standard_isolation`: Standard options for isolating this app profile's traffic from other use cases.

    * `priority`: The priority of requests sent using this app profile.
    Possible values:
      * PRIORITY_UNSPECIFIED
      * PRIORITY_LOW
      * PRIORITY_MEDIUM
      * PRIORITY_HIGH

  * `data_boost_isolation_read_only`: Data Boost is a serverless compute capability that lets you run high-throughput read jobs and queries on your Bigtable data, without impacting the performance of the clusters that handle your application traffic. Data Boost supports read-only use cases with single-cluster routing.

    * `compute_billing_owner`: The Compute Billing Owner for this Data Boost App Profile.
    Possible values:
      * COMPUTE_BILLING_OWNER_UNSPECIFIED
      * HOST_PAYS


## GCP permissions

Ensure the [https://bigtableadmin.googleapis.com/](https://console.cloud.google.com/apis/library/bigtableadmin.googleapis.com/) is enabled for the current project.
