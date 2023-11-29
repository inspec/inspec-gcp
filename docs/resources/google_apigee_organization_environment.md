---
title: About the google_apigee_organization_environment resource
platform: gcp
---

## Syntax
A `google_apigee_organization_environment` is used to test a Google OrganizationEnvironment resource

## Examples
```
describe google_apigee_organization_environment(name: ' value_name') do
	it { should exist }
	its('type') { should cmp 'value_type' }
	its('state') { should cmp 'value_state' }
	its('api_proxy_type') { should cmp 'value_apiproxytype' }
	its('forward_proxy_uri') { should cmp 'value_forwardproxyuri' }
	its('deployment_type') { should cmp 'value_deploymenttype' }
	its('last_modified_at') { should cmp 'value_lastmodifiedat' }
	its('display_name') { should cmp 'value_displayname' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('created_at') { should cmp 'value_createdat' }

end

describe google_apigee_organization_environment(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_apigee_organization_environment` resource:


  * `type`: Optional. EnvironmentType selected for the environment.
  Possible values:
    * ENVIRONMENT_TYPE_UNSPECIFIED
    * BASE
    * INTERMEDIATE
    * COMPREHENSIVE

  * `properties`: Optional. Key-value pairs that may be used for customizing the environment.

  * `has_attached_flow_hooks`: 

  * `state`: Output only. State of the environment. Values other than ACTIVE means the resource is not ready to use.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * DELETING
    * UPDATING

  * `api_proxy_type`: Optional. API Proxy type supported by the environment. The type can be set when creating the Environment and cannot be changed.
  Possible values:
    * API_PROXY_TYPE_UNSPECIFIED
    * PROGRAMMABLE
    * CONFIGURABLE

  * `forward_proxy_uri`: Optional. Url of the forward proxy to be applied to the runtime instances in this environment. Must be in the format of {scheme}://{hostname}:{port}. Note that scheme must be one of "http" or "https", and port must be supplied.

  * `node_config`: Optional. NodeConfig of the environment.

  * `deployment_type`: Optional. Deployment type supported by the environment. The deployment type can be set when creating the environment and cannot be changed. When you enable archive deployment, you will be **prevented from performing** a [subset of actions](/apigee/docs/api-platform/local-development/overview#prevented-actions) within the environment, including: * Managing the deployment of API proxy or shared flow revisions * Creating, updating, or deleting resource files * Creating, updating, or deleting target servers
  Possible values:
    * DEPLOYMENT_TYPE_UNSPECIFIED
    * PROXY
    * ARCHIVE

  * `last_modified_at`: Output only. Last modification time of this environment as milliseconds since epoch.

  * `display_name`: Optional. Display name for this environment.

  * `name`: Required. Name of the environment. Values must match the regular expression `^[.\\p{Alnum}-_]{1,255}$`

  * `description`: Optional. Description of the environment.

  * `created_at`: Output only. Creation time of this environment as milliseconds since epoch.


## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
