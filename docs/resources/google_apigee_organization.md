+++
title = "google_apigee_organization resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_apigee_organization"
identifier = "inspec/resources/gcp/google_apigee_organization Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization` InSpec audit resource to to test a Google Cloud Organization resource.

## Examples

```ruby
describe google_apigee_organization(name: ' value_name') do
	it { should exist }
	its('api_consumer_data_encryption_key_name') { should cmp 'value_apiconsumerdataencryptionkeyname' }
	its('runtime_database_encryption_key_name') { should cmp 'value_runtimedatabaseencryptionkeyname' }
	its('runtime_type') { should cmp 'value_runtimetype' }
	its('type') { should cmp 'value_type' }
	its('authorized_network') { should cmp 'value_authorizednetwork' }
	its('project_id') { should cmp 'value_projectid' }
	its('description') { should cmp 'value_description' }
	its('ca_certificate') { should cmp 'value_cacertificate' }
	its('subscription_type') { should cmp 'value_subscriptiontype' }
	its('customer_name') { should cmp 'value_customername' }
	its('created_at') { should cmp 'value_createdat' }
	its('last_modified_at') { should cmp 'value_lastmodifiedat' }
	its('subscription_plan') { should cmp 'value_subscriptionplan' }
	its('state') { should cmp 'value_state' }
	its('name') { should cmp 'value_name' }
	its('control_plane_encryption_key_name') { should cmp 'value_controlplaneencryptionkeyname' }
	its('analytics_region') { should cmp 'value_analyticsregion' }
	its('api_consumer_data_location') { should cmp 'value_apiconsumerdatalocation' }
	its('display_name') { should cmp 'value_displayname' }
	its('apigee_project_id') { should cmp 'value_apigeeprojectid' }
	its('expires_at') { should cmp 'value_expiresat' }
	its('billing_type') { should cmp 'value_billingtype' }

end

describe google_apigee_organization(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_apigee_organization` resource:


  * `api_consumer_data_encryption_key_name`: Cloud KMS key name used for encrypting API consumer data. Required for US/EU regions when [BillingType](#BillingType) is `SUBSCRIPTION`. When [BillingType](#BillingType) is `EVALUATION` or the region is not US/EU, a Google-Managed encryption key will be used. Format: `projects/*/locations/*/keyRings/*/cryptoKeys/*`

  * `runtime_database_encryption_key_name`: Cloud KMS key name used for encrypting the data that is stored and replicated across runtime instances. Update is not allowed after the organization is created. Required when [RuntimeType](#RuntimeType) is `CLOUD`. If not specified when [RuntimeType](#RuntimeType) is `TRIAL`, a Google-Managed encryption key will be used. For example: "projects/foo/locations/us/keyRings/bar/cryptoKeys/baz". **Note:** Not supported for Apigee hybrid.

  * `environments`: Output only. List of environments in the Apigee organization.

  * `runtime_type`: Required. Runtime type of the Apigee organization based on the Apigee subscription purchased.
  Possible values:
    * RUNTIME_TYPE_UNSPECIFIED
    * CLOUD
    * HYBRID

  * `type`: Not used by Apigee.
  Possible values:
    * TYPE_UNSPECIFIED
    * TYPE_TRIAL
    * TYPE_PAID
    * TYPE_INTERNAL

  * `portal_disabled`: Configuration for the Portals settings.

  * `authorized_network`: Compute Engine network used for Service Networking to be peered with Apigee runtime instances. See [Getting started with the Service Networking API](https://cloud.google.com/service-infrastructure/docs/service-networking/getting-started). Valid only when [RuntimeType](#RuntimeType) is set to `CLOUD`. The value must be set before the creation of a runtime instance and can be updated only when there are no runtime instances. For example: `default`. Apigee also supports shared VPC (that is, the host network project is not the same as the one that is peering with Apigee). See [Shared VPC overview](https://cloud.google.com/vpc/docs/shared-vpc). To use a shared VPC network, use the following format: `projects/{host-project-id}/{region}/networks/{network-name}`. For example: `projects/my-sharedvpc-host/global/networks/mynetwork` **Note:** Not supported for Apigee hybrid.

  * `project_id`: Output only. Project ID associated with the Apigee organization.

  * `description`: Description of the Apigee organization.

  * `ca_certificate`: Output only. Base64-encoded public certificate for the root CA of the Apigee organization. Valid only when [RuntimeType](#RuntimeType) is `CLOUD`.

  * `subscription_type`: Output only. DEPRECATED: This will eventually be replaced by BillingType. Subscription type of the Apigee organization. Valid values include trial (free, limited, and for evaluation purposes only) or paid (full subscription has been purchased). See [Apigee pricing](https://cloud.google.com/apigee/pricing/).
  Possible values:
    * SUBSCRIPTION_TYPE_UNSPECIFIED
    * PAID
    * TRIAL

  * `addons_config`: Add-on configurations for the Apigee organization.

    * `integration_config`: Configuration for the Integration add-on.

      * `enabled`: Flag that specifies whether the Integration add-on is enabled.

    * `api_security_config`: Configurations of the API Security add-on.

      * `enabled`: Flag that specifies whether the API security add-on is enabled.

      * `expires_at`: Output only. Time at which the API Security add-on expires in in milliseconds since epoch. If unspecified, the add-on will never expire.

    * `monetization_config`: Configuration for the Monetization add-on.

      * `enabled`: Flag that specifies whether the Monetization add-on is enabled.

    * `connectors_platform_config`: Configuration for the Connectors Platform add-on.

      * `expires_at`: Output only. Time at which the Connectors Platform add-on expires in milliseconds since epoch. If unspecified, the add-on will never expire.

      * `enabled`: Flag that specifies whether the Connectors Platform add-on is enabled.

    * `analytics_config`: Configuration for the Analytics add-on.

      * `expire_time_millis`: Output only. Time at which the Analytics add-on expires in milliseconds since epoch. If unspecified, the add-on will never expire.

      * `state`: Output only. The state of the Analytics add-on.
      Possible values:
        * ADDON_STATE_UNSPECIFIED
        * ENABLING
        * ENABLED
        * DISABLING
        * DISABLED

      * `enabled`: Whether the Analytics add-on is enabled.

      * `update_time`: Output only. The latest update time.

    * `advanced_api_ops_config`: Configuration for the Advanced API Ops add-on.

      * `enabled`: Flag that specifies whether the Advanced API Ops add-on is enabled.

  * `customer_name`: Not used by Apigee.

  * `created_at`: Output only. Time that the Apigee organization was created in milliseconds since epoch.

  * `last_modified_at`: Output only. Time that the Apigee organization was last modified in milliseconds since epoch.

  * `subscription_plan`: Output only. Subscription plan that the customer has purchased. Output only.
  Possible values:
    * SUBSCRIPTION_PLAN_UNSPECIFIED
    * SUBSCRIPTION_2021
    * SUBSCRIPTION_2024

  * `properties`: Message for compatibility with legacy Edge specification for Java Properties object in JSON.

    * `property`: List of all properties in the object

      * `value`: The property value

      * `name`: The property key

  * `state`: Output only. State of the organization. Values other than ACTIVE means the resource is not ready to use.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * DELETING
    * UPDATING

  * `name`: Output only. Name of the Apigee organization.

  * `disable_vpc_peering`: Optional. Flag that specifies whether the VPC Peering through Private Google Access should be disabled between the consumer network and Apigee. Valid only when RuntimeType is set to CLOUD. Required if an authorizedNetwork on the consumer project is not provided, in which case the flag should be set to true. The value must be set before the creation of any Apigee runtime instance and can be updated only when there are no runtime instances. **Note:** Apigee will be deprecating the vpc peering model that requires you to provide 'authorizedNetwork', by making the non-peering model as the default way of provisioning Apigee organization in future. So, this will be a temporary flag to enable the transition. Not supported for Apigee hybrid.

  * `control_plane_encryption_key_name`: Cloud KMS key name used for encrypting control plane data that is stored in a multi region. Required when [BillingType](#BillingType) is `SUBSCRIPTION`. When [BillingType](#BillingType) is `EVALUATION`, a Google-Managed encryption key will be used. Format: `projects/*/locations/*/keyRings/*/cryptoKeys/*`

  * `analytics_region`: Required. DEPRECATED: This field will eventually be deprecated and replaced with a differently-named field. Primary Google Cloud region for analytics data storage. For valid values, see [Create an Apigee organization](https://cloud.google.com/apigee/docs/api-platform/get-started/create-org).

  * `api_consumer_data_location`: This field is needed only for customers with control plane in US or EU. Apigee stores some control plane data only in single region. This field determines which single region Apigee should use. For example: "us-west1" when control plane is in US or "europe-west2" when control plane is in EU.

  * `display_name`: Display name for the Apigee organization. Unused, but reserved for future use.

  * `apigee_project_id`: Output only. Apigee Project ID associated with the organization. Use this project to allowlist Apigee in the Service Attachment when using private service connect with Apigee.

  * `expires_at`: Output only. Time that the Apigee organization is scheduled for deletion.

  * `attributes`: Not used by Apigee.

  * `billing_type`: Billing type of the Apigee organization. See [Apigee pricing](https://cloud.google.com/apigee/pricing).
  Possible values:
    * BILLING_TYPE_UNSPECIFIED
    * SUBSCRIPTION
    * EVALUATION
    * PAYG


## GCP permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
