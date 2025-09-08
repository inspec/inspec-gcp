+++

title = "google_data_fusion_instance Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_data_fusion_instance"
identifier = "inspec/resources/gcp/google_data_fusion_instance Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_data_fusion_instance` InSpec audit resource to test the properties of a test a Google Instance.

## Syntax
A `google_data_fusion_instance` is used to test a Google Instance resource

## Examples
```
describe google_data_fusion_instance(name: 'projects/*/locations/*/instances/inspec-instance') do
	it { should exist }
	its('name') { should cmp 'inspec-instance' }
	its('description') { should cmp 'value_description' }
	its('type') { should cmp 'value_type' }
	its('create_time') { should cmp 'value_create_time' }
	its('update_time') { should cmp 'value_update_time' }
	its('state') { should cmp 'value_state' }
	its('state_message') { should cmp 'value_state_message' }
	its('service_endpoint') { should cmp 'value_service_endpoint' }
	its('zone') { should cmp 'value_zone' }
	its('version') { should cmp 'value_version' }
	its('service_account') { should cmp 'value_service_account' }
	its('display_name') { should cmp 'value_display_name' }
	its('api_endpoint') { should cmp 'value_api_endpoint' }
	its('gcs_bucket') { should cmp 'value_gcs_bucket' }
	its('p4service_account') { should cmp 'value_p4service_account' }
	its('tenant_project_id') { should cmp 'value_tenant_project_id' }
	its('dataproc_service_account') { should cmp 'value_dataproc_service_account' }
	its('workforce_identity_service_endpoint') { should cmp 'value_workforce_identity_service_endpoint' }
	its('patch_revision') { should cmp 'value_patch_revision' }
end

describe google_data_fusion_instance(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_data_fusion_instance` resource:

## Properties
Properties that can be accessed from the `google_data_fusion_instance` resource:


  * `name`: Output only. The name of this instance is in the form of projects/{project}/locations/{location}/instances/{instance}.

  * `description`: A description of this instance.

  * `type`: Required. Instance type.
  Possible values:
    * TYPE_UNSPECIFIED
    * BASIC
    * ENTERPRISE
    * DEVELOPER

  * `enable_stackdriver_logging`: Option to enable Stackdriver Logging.

  * `enable_stackdriver_monitoring`: Option to enable Stackdriver Monitoring.

  * `private_instance`: Specifies whether the Data Fusion instance should be private. If set to true, all Data Fusion nodes will have private IP addresses and will not be able to access the public internet.

  * `network_config`: Network configuration for a Data Fusion instance. These configurations are used for peering with the customer network. Configurations are optional when a public Data Fusion instance is to be created. However, providing these configurations allows several benefits, such as reduced network latency while accessing the customer resources from managed Data Fusion instance nodes, as well as access to the customer on-prem resources.

    * `network`: Optional. Name of the network in the customer project with which the Tenant Project will be peered for executing pipelines. In case of shared VPC where the network resides in another host project the network should specified in the form of projects/{host-project-id}/global/networks/{network}. This is only required for connectivity type VPC_PEERING.

    * `ip_allocation`: Optional. The IP range in CIDR notation to use for the managed Data Fusion instance nodes. This range must not overlap with any other ranges used in the Data Fusion instance network. This is required only when using connection type VPC_PEERING. Format: a.b.c.d/22 Example: 192.168.0.0/22

    * `connection_type`: Optional. Type of connection for establishing private IP connectivity between the Data Fusion customer project VPC and the corresponding tenant project from a predefined list of available connection modes. If this field is unspecified for a private instance, VPC peering is used.
    Possible values:
      * CONNECTION_TYPE_UNSPECIFIED
      * VPC_PEERING
      * PRIVATE_SERVICE_CONNECT_INTERFACES

    * `private_service_connect_config`: Configuration for using Private Service Connect to establish connectivity between the Data Fusion consumer project and the corresponding tenant project.

      * `network_attachment`: Required. The reference to the network attachment used to establish private connectivity. It will be of the form projects/{project-id}/regions/{region}/networkAttachments/{network-attachment-id}.

      * `unreachable_cidr_block`: Optional. Input only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block should be at least /25. This range should not overlap with the primary address range of any subnetwork used by the network attachment. This range can be used for other purposes in the consumer VPC as long as there is no requirement for CDF to reach destinations using these addresses. If this value is not provided, the server chooses a non RFC 1918 address range. The format of this field is governed by RFC 4632. Example: 192.168.0.0/25

      * `effective_unreachable_cidr_block`: Output only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block is /25. The format of this field is governed by RFC 4632. Example: 240.0.0.0/25

  * `labels`: The resource labels for instance to use to annotate any related underlying resources such as Compute Engine VMs. The character '=' is not allowed to be used within the labels.

    * `additional_properties`:

  * `options`: Map of additional options used to configure the behavior of Data Fusion instance.

    * `additional_properties`:

  * `create_time`: Output only. The time the instance was created.

  * `update_time`: Output only. The time the instance was last updated.

  * `state`: Output only. The current state of this Data Fusion instance.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * FAILED
    * DELETING
    * UPGRADING
    * RESTARTING
    * UPDATING
    * AUTO_UPDATING
    * AUTO_UPGRADING
    * DISABLED

  * `state_message`: Output only. Additional information about the current state of this Data Fusion instance if available.

  * `service_endpoint`: Output only. Endpoint on which the Data Fusion UI is accessible.

  * `zone`: Name of the zone in which the Data Fusion instance will be created. Only DEVELOPER instances use this field.

  * `version`: Current version of the Data Fusion. Only specifiable in Update.

  * `service_account`: Output only. Deprecated. Use tenant_project_id instead to extract the tenant project ID.

  * `display_name`: Display name for an instance.

  * `available_version`: Output only. Available versions that the instance can be upgraded to using UpdateInstanceRequest.

    * `version_number`: The version number of the Data Fusion instance, such as '6.0.1.0'.

    * `default_version`: Whether this is currently the default version for Cloud Data Fusion

    * `available_features`: Represents a list of available feature names for a given version.

    * `type`: Type represents the release availability of the version
    Possible values:
      * TYPE_UNSPECIFIED
      * TYPE_PREVIEW
      * TYPE_GENERAL_AVAILABILITY

  * `api_endpoint`: Output only. Endpoint on which the REST APIs is accessible.

  * `gcs_bucket`: Output only. Cloud Storage bucket generated by Data Fusion in the customer project.

  * `accelerators`: Output only. List of accelerators enabled for this CDF instance.

    * `accelerator_type`: Optional. The type of an accelator for a Cloud Data Fusion instance.
    Possible values:
      * ACCELERATOR_TYPE_UNSPECIFIED
      * CDC
      * HEALTHCARE
      * CCAI_INSIGHTS
      * CLOUDSEARCH

    * `state`: Output only. The state of the accelerator.
    Possible values:
      * STATE_UNSPECIFIED
      * ENABLED
      * DISABLED
      * UNKNOWN

  * `p4_service_account`: Output only. Service agent for the customer project.

  * `tenant_project_id`: Output only. The name of the tenant project.

  * `dataproc_service_account`: User-managed service account to set on Dataproc when Cloud Data Fusion creates Dataproc to run data processing pipelines. This allows users to have fine-grained access control on Dataproc's accesses to cloud resources.

  * `enable_rbac`: Option to enable granular role-based access control.

  * `crypto_key_config`: The crypto key configuration. This field is used by the Customer-managed encryption keys (CMEK) feature.

    * `key_reference`: The name of the key which is used to encrypt/decrypt customer data. For key in Cloud KMS, the key should be in the format of `projects/*/locations/*/keyRings/*/cryptoKeys/*`.

  * `disabled_reason`: Output only. If the instance state is DISABLED, the reason for disabling the instance.

  * `event_publish_config`: Confirguration of PubSubEventWriter.

    * `enabled`: Required. Option to enable Event Publishing.

    * `topic`: Required. The resource name of the Pub/Sub topic. Format: projects/{project_id}/topics/{topic_id}

  * `enable_zone_separation`: Option to enable granular zone separation.

  * `satisfies_pzs`: Output only. Reserved for future use.

  * `workforce_identity_service_endpoint`: Output only. Endpoint on which the Data Fusion UI is accessible to third-party users

  * `patch_revision`: Optional. Current patch revision of the Data Fusion.

  * `dataplex_data_lineage_integration_enabled`: Optional. Option to enable the Dataplex Lineage Integration feature.

  * `maintenance_policy`: Maintenance policy of the instance.

    * `maintenance_window`: Maintenance window of the instance.

      * `recurring_time_window`: Represents an arbitrary window of time that recurs.

        * `window`: Represents an arbitrary window of time.

          * `start_time`: Required. The start time of the time window provided in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. Example: "2024-01-01T12:04:06-04:00"

          * `end_time`: Required. The end time of the time window provided in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. The end time should take place after the start time. Example: "2024-01-02T12:04:06-06:00"

        * `recurrence`: Required. An RRULE with format [RFC-5545](https://tools.ietf.org/html/rfc5545#section-3.8.5.3) for how this window reccurs. They go on for the span of time between the start and end time. The only supported FREQ value is "WEEKLY". To have something repeat every weekday, use: "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR". This specifies how frequently the window starts. To have a 9 am - 5 pm UTC-4 window every weekday, use something like: ``` start time = 2019-01-01T09:00:00-0400 end time = 2019-01-01T17:00:00-0400 recurrence = FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR ```

    * `maintenance_exclusion_window`: Represents an arbitrary window of time.

      * `start_time`: Required. The start time of the time window provided in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. Example: "2024-01-01T12:04:06-04:00"

      * `end_time`: Required. The end time of the time window provided in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. The end time should take place after the start time. Example: "2024-01-02T12:04:06-06:00"


## GCP Permissions

Ensure the [Cloud Data Fusion API](https://console.cloud.google.com/apis/library/datafusion.googleapis.com) is enabled for the current project.
