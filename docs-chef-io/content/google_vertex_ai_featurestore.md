+++
title = "google_vertex_ai_featurestore resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_featurestore"
identifier = "inspec/resources/gcp/google_vertex_ai_featurestore resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_featurestore` InSpec audit resource to to test a Google Cloud Featurestore resource.

## Examples

```ruby
describe google_vertex_ai_featurestore(name: "projects/#{gcp_project_id}/locations/#{featurestore['region']}/featurestores/#{featurestore['name']}", region: ' value_region') do
	it { should exist }
	its('state') { should cmp 'value_state' }
	its('create_time') { should cmp 'value_createtime' }
	its('etag') { should cmp 'value_etag' }
	its('update_time') { should cmp 'value_updatetime' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_featurestore(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_featurestore` resource:


  * `state`: Output only. State of the featurestore.
  Possible values:
    * STATE_UNSPECIFIED
    * STABLE
    * UPDATING

  * `create_time`: Output only. Timestamp when this Featurestore was created.

  * `etag`: Optional. Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `online_storage_ttl_days`: Optional. TTL in days for feature values that will be stored in online serving storage. The Feature Store online storage periodically removes obsolete feature values older than `online_storage_ttl_days` since the feature generation time. Note that `online_storage_ttl_days` should be less than or equal to `offline_storage_ttl_days` for each EntityType under a featurestore. If not set, default to 4000 days

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `labels`: Optional. The labels with user-defined metadata to organize your Featurestore. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information on and examples of labels. No more than 64 user labels can be associated with one Featurestore(System labels are excluded)." System reserved label keys are prefixed with "aiplatform.googleapis.com/" and are immutable.

    * `additional_properties`: 

  * `update_time`: Output only. Timestamp when this Featurestore was last updated.

  * `name`: Output only. Name of the Featurestore. Format: `projects/{project}/locations/{location}/featurestores/{featurestore}`

  * `online_serving_config`: OnlineServingConfig specifies the details for provisioning online serving resources.

    * `fixed_node_count`: The number of nodes for the online store. The number of nodes doesn't scale automatically, but you can manually update the number of nodes. If set to 0, the featurestore will not have an online store and cannot be used for online serving.

    * `scaling`: Online serving scaling configuration. If min_node_count and max_node_count are set to the same value, the cluster will be configured with the fixed number of node (no auto-scaling).

      * `max_node_count`: The maximum number of nodes to scale up to. Must be greater than min_node_count, and less than or equal to 10 times of 'min_node_count'.

      * `min_node_count`: Required. The minimum number of nodes to scale down to. Must be greater than or equal to 1.

      * `cpu_utilization_target`: Optional. The cpu utilization that the Autoscaler should be trying to achieve. This number is on a scale from 0 (no utilization) to 100 (total utilization), and is limited between 10 and 80. When a cluster's CPU utilization exceeds the target that you have set, Bigtable immediately adds nodes to the cluster. When CPU utilization is substantially lower than the target, Bigtable removes nodes. If not set or set to 0, default to 50.


## GCP permissions
