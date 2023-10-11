---
title: About the google_vertex_ai_endpoint resource
platform: gcp
---

## Syntax
A `google_vertex_ai_endpoint` is used to test a Google Endpoint resource

## Examples
```
describe google_vertex_ai_endpoint(name: "projects/#{gcp_project_id}/locations/#{endpoint['region']}/endpoints/#{endpoint['name']}", region: ' value_region') do
it { should exist }
	its('update_time') { should cmp 'value_updatetime' }
	its('model_deployment_monitoring_job') { should cmp 'value_modeldeploymentmonitoringjob' }
	its('description') { should cmp 'value_description' }
	its('network') { should cmp 'value_network' }
	its('display_name') { should cmp 'value_displayname' }
	its('etag') { should cmp 'value_etag' }
	its('create_time') { should cmp 'value_createtime' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_endpoint(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_endpoint` resource:


  * `encryption_spec`: Customer-managed encryption key spec for an Endpoint. If set, this Endpoint and all sub-resources of this Endpoint will be secured by this key.

  * `enable_private_service_connect`: Deprecated: If true, expose the Endpoint via private service connect. Only one of the fields, network or enable_private_service_connect, can be set.

  * `update_time`: Output only. Timestamp when this Endpoint was last updated.

  * `model_deployment_monitoring_job`: Output only. Resource name of the Model Monitoring job associated with this Endpoint if monitoring is enabled by JobService.CreateModelDeploymentMonitoringJob. Format: `projects/{project}/locations/{location}/modelDeploymentMonitoringJobs/{model_deployment_monitoring_job}`

  * `description`: The description of the Endpoint.

  * `deployed_models`: Output only. The models deployed in this Endpoint. To add or remove DeployedModels use EndpointService.DeployModel and EndpointService.UndeployModel respectively.

  * `network`: Optional. The full name of the Google Compute Engine [network](https://cloud.google.com//compute/docs/networks-and-firewalls#networks) to which the Endpoint should be peered. Private services access must already be configured for the network. If left unspecified, the Endpoint is not peered with any network. Only one of the fields, network or enable_private_service_connect, can be set. [Format](https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert): `projects/{project}/global/networks/{network}`. Where `{project}` is a project number, as in `12345`, and `{network}` is network name.

  * `traffic_split`: A map from a DeployedModel's ID to the percentage of this Endpoint's traffic that should be forwarded to that DeployedModel. If a DeployedModel's ID is not listed in this map, then it receives no traffic. The traffic percentage values must add up to 100, or map must be empty if the Endpoint is to not accept any traffic at a moment.

    * `additional_properties`: 

  * `labels`: The labels with user-defined metadata to organize your Endpoints. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `display_name`: Required. The display name of the Endpoint. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `predict_request_response_logging_config`: Configures the request-response logging for online prediction.

  * `etag`: Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `create_time`: Output only. Timestamp when this Endpoint was created.

  * `name`: Output only. The resource name of the Endpoint.


## GCP Permissions
