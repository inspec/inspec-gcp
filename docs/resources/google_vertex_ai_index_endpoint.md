+++
title = "google_vertex_ai_index_endpoint resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_index_endpoint"
identifier = "inspec/resources/gcp/google_vertex_ai_index_endpoint Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_index_endpoint` InSpec audit resource to to test a Google Cloud IndexEndpoint resource.

## Examples

```ruby
describe google_vertex_ai_index_endpoint(name: "projects/#{gcp_project_id}/locations/#{index_endpoint['region']}/indexEndpoints/#{index_endpoint['name']}", region: ' value_region') do
	it { should exist }
	its('display_name') { should cmp 'value_displayname' }
	its('create_time') { should cmp 'value_createtime' }
	its('name') { should cmp 'value_name' }
	its('network') { should cmp 'value_network' }
	its('update_time') { should cmp 'value_updatetime' }
	its('public_endpoint_domain_name') { should cmp 'value_publicendpointdomainname' }
	its('etag') { should cmp 'value_etag' }
	its('description') { should cmp 'value_description' }

end

describe google_vertex_ai_index_endpoint(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_index_endpoint` resource:


  * `deployed_indexes`: Output only. The indexes deployed in this endpoint.

    * `private_endpoints`: IndexPrivateEndpoints proto is used to provide paths for users to send requests via private endpoints (e.g. private service access, private service connect). To send request via private service access, use match_grpc_address. To send request via private service connect, use service_attachment.

      * `service_attachment`: Output only. The name of the service attachment resource. Populated if private service connect is enabled.

      * `match_grpc_address`: Output only. The ip address used to send match gRPC requests.

    * `deployment_group`: Optional. The deployment group can be no longer than 64 characters (eg: 'test', 'prod'). If not set, we will use the 'default' deployment group. Creating `deployment_groups` with `reserved_ip_ranges` is a recommended practice when the peered network has multiple peering ranges. This creates your deployments from predictable IP spaces for easier traffic administration. Also, one deployment_group (except 'default') can only be used with the same reserved_ip_ranges which means if the deployment_group has been used with reserved_ip_ranges: [a, b, c], using it with [a, b] or [d, e] is disallowed. Note: we only support up to 5 deployment groups(not including 'default').

    * `dedicated_resources`: A description of resources that are dedicated to a DeployedModel, and that need a higher degree of manual configuration.

      * `machine_spec`: Specification of a single machine.

        * `accelerator_type`: Immutable. The type of accelerator(s) that may be attached to the machine as per accelerator_count.
        Possible values:
          * ACCELERATOR_TYPE_UNSPECIFIED
          * NVIDIA_TESLA_K80
          * NVIDIA_TESLA_P100
          * NVIDIA_TESLA_V100
          * NVIDIA_TESLA_P4
          * NVIDIA_TESLA_T4
          * NVIDIA_TESLA_A100
          * NVIDIA_A100_80GB
          * NVIDIA_L4
          * TPU_V2
          * TPU_V3
          * TPU_V4_POD

        * `machine_type`: Immutable. The type of the machine. See the [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types) See the [list of machine types supported for custom training](https://cloud.google.com/vertex-ai/docs/training/configure-compute#machine-types). For DeployedModel this field is optional, and the default value is `n1-standard-2`. For BatchPredictionJob or as part of WorkerPoolSpec this field is required.

        * `accelerator_count`: The number of accelerators to attach to the machine.

      * `max_replica_count`: Immutable. The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale the model to that many replicas is guaranteed (barring service outages). If traffic against the DeployedModel increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, will use min_replica_count as the default value. The value of this field impacts the charge against Vertex CPU and GPU quotas. Specifically, you will be charged for (max_replica_count * number of cores in the selected machine type) and (max_replica_count * number of GPUs per replica in the selected machine type).

      * `autoscaling_metric_specs`: Immutable. The metric specifications that overrides a resource utilization metric (CPU utilization, accelerator's duty cycle, and so on) target value (default to 60 if not set). At most one entry is allowed per metric. If machine_spec.accelerator_count is above 0, the autoscaling will be based on both CPU utilization and accelerator's duty cycle metrics and scale up when either metrics exceeds its target value while scale down if both metrics are under their target value. The default target value is 60 for both metrics. If machine_spec.accelerator_count is 0, the autoscaling will be based on CPU utilization metric only with default target value 60 if not explicitly set. For example, in the case of Online Prediction, if you want to override target CPU utilization to 80, you should set autoscaling_metric_specs.metric_name to `aiplatform.googleapis.com/prediction/online/cpu/utilization` and autoscaling_metric_specs.target to `80`.

        * `target`: The target resource utilization in percentage (1% - 100%) for the given metric; once the real usage deviates from the target by a certain percentage, the machine replicas change. The default value is 60 (representing 60%) if not provided.

        * `metric_name`: Required. The resource metric name. Supported metrics: * For Online Prediction: * `aiplatform.googleapis.com/prediction/online/accelerator/duty_cycle` * `aiplatform.googleapis.com/prediction/online/cpu/utilization`

      * `min_replica_count`: Required. Immutable. The minimum number of machine replicas this DeployedModel will be always deployed on. This value must be greater than or equal to 1. If traffic against the DeployedModel increases, it may dynamically be deployed onto more replicas, and as traffic decreases, some of these extra replicas may be freed.

    * `deployed_index_auth_config`: Used to set up the auth on the DeployedIndex's private endpoint.

      * `auth_provider`: Configuration for an authentication provider, including support for [JSON Web Token (JWT)](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32).

        * `audiences`: The list of JWT [audiences](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#section-4.1.3). that are allowed to access. A JWT containing any of these audiences will be accepted.

        * `allowed_issuers`: A list of allowed JWT issuers. Each entry must be a valid Google service account, in the following format: `service-account-name@project-id.iam.gserviceaccount.com`

    * `id`: Required. The user specified ID of the DeployedIndex. The ID can be up to 128 characters long and must start with a letter and only contain letters, numbers, and underscores. The ID must be unique within the project it is created in.

    * `index_sync_time`: Output only. The DeployedIndex may depend on various data on its original Index. Additionally when certain changes to the original Index are being done (e.g. when what the Index contains is being changed) the DeployedIndex may be asynchronously updated in the background to reflect these changes. If this timestamp's value is at least the Index.update_time of the original Index, it means that this DeployedIndex and the original Index are in sync. If this timestamp is older, then to see which updates this DeployedIndex already contains (and which it does not), one must list the operations that are running on the original Index. Only the successfully completed Operations with update_time equal or before this sync time are contained in this DeployedIndex.

    * `automatic_resources`: A description of resources that to large degree are decided by Vertex AI, and require only a modest additional configuration. Each Model supporting these resources documents its specific guidelines.

      * `max_replica_count`: Immutable. The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale the model to that many replicas is guaranteed (barring service outages). If traffic against the DeployedModel increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, a no upper bound for scaling under heavy traffic will be assume, though Vertex AI may be unable to scale beyond certain replica number.

      * `min_replica_count`: Immutable. The minimum number of replicas this DeployedModel will be always deployed on. If traffic against it increases, it may dynamically be deployed onto more replicas up to max_replica_count, and as traffic decreases, some of these extra replicas may be freed. If the requested value is too large, the deployment will error.

    * `enable_access_logging`: Optional. If true, private endpoint's access logs are sent to Cloud Logging. These logs are like standard server access logs, containing information like timestamp and latency for each MatchRequest. Note that logs may incur a cost, especially if the deployed index receives a high queries per second rate (QPS). Estimate your costs before enabling this option.

    * `create_time`: Output only. Timestamp when the DeployedIndex was created.

    * `reserved_ip_ranges`: Optional. A list of reserved ip ranges under the VPC network that can be used for this DeployedIndex. If set, we will deploy the index within the provided ip ranges. Otherwise, the index might be deployed to any ip ranges under the provided VPC network. The value should be the name of the address (https://cloud.google.com/compute/docs/reference/rest/v1/addresses) Example: 'vertex-ai-ip-range'.

    * `index`: Required. The name of the Index this is the deployment of. We may refer to this Index as the DeployedIndex's "original" Index.

    * `display_name`: The display name of the DeployedIndex. If not provided upon creation, the Index's display_name is used.

  * `private_service_connect_config`: Represents configuration for private service connect.

    * `project_allowlist`: A list of Projects from which the forwarding rule will target the service attachment.

    * `enable_private_service_connect`: Required. If true, expose the IndexEndpoint via private service connect.

  * `display_name`: Required. The display name of the IndexEndpoint. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `public_endpoint_enabled`: Optional. If true, the deployed index will be accessible through public endpoint.

  * `labels`: The labels with user-defined metadata to organize your IndexEndpoints. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `create_time`: Output only. Timestamp when this IndexEndpoint was created.

  * `name`: Output only. The resource name of the IndexEndpoint.

  * `network`: Optional. The full name of the Google Compute Engine [network](https://cloud.google.com/compute/docs/networks-and-firewalls#networks) to which the IndexEndpoint should be peered. Private services access must already be configured for the network. If left unspecified, the Endpoint is not peered with any network. network and private_service_connect_config are mutually exclusive. [Format](https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert): `projects/{project}/global/networks/{network}`. Where {project} is a project number, as in '12345', and {network} is network name.

  * `update_time`: Output only. Timestamp when this IndexEndpoint was last updated. This timestamp is not updated when the endpoint's DeployedIndexes are updated, e.g. due to updates of the original Indexes they are the deployments of.

  * `public_endpoint_domain_name`: Output only. If public_endpoint_enabled is true, this field will be populated with the domain name to use for this index endpoint.

  * `enable_private_service_connect`: Optional. Deprecated: If true, expose the IndexEndpoint via private service connect. Only one of the fields, network or enable_private_service_connect, can be set.

  * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `description`: The description of the IndexEndpoint.


## GCP permissions
