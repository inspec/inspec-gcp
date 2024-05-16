---
title: About the google_compute_region_ssl_policy resource
platform: gcp
---

## Syntax
A `google_compute_region_ssl_policy` is used to test a Google RegionSslPolicy resource

## Examples
```
describe google_compute_region_ssl_policy(project: 'chef-gcp-inspec', region: ' value_region', sslPolicy: ' ') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('profile') { should cmp 'value_profile' }
	its('min_tls_version') { should cmp 'value_mintlsversion' }
	its('fingerprint') { should cmp 'value_fingerprint' }
	its('region') { should cmp 'value_region' }

end

describe google_compute_region_ssl_policy(project: 'chef-gcp-inspec', region: ' value_region', sslPolicy: ' ') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_ssl_policy` resource:


  * `kind`: [Output only] Type of the resource. Always compute#sslPolicyfor SSL policies.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `name`: Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `profile`: Profile specifies the set of SSL features that can be used by the load balancer when negotiating SSL with clients. This can be one of COMPATIBLE, MODERN, RESTRICTED, or CUSTOM. If using CUSTOM, the set of SSL features to enable must be specified in the customFeatures field.
  Possible values:
    * COMPATIBLE
    * CUSTOM
    * MODERN
    * RESTRICTED

  * `min_tls_version`: The minimum version of SSL protocol that can be used by the clients to establish a connection with the load balancer. This can be one of TLS_1_0, TLS_1_1, TLS_1_2.
  Possible values:
    * TLS_1_0
    * TLS_1_1
    * TLS_1_2

  * `enabled_features`: [Output Only] The list of features enabled in the SSL policy.

  * `custom_features`: A list of features enabled when the selected profile is CUSTOM. The method returns the set of features that can be specified in this list. This field must be empty if the profile is not CUSTOM.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a SslPolicy. An up-to-date fingerprint must be provided in order to update the SslPolicy, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve an SslPolicy.

  * `warnings`: [Output Only] If potential misconfigurations are detected for this SSL policy, this field will be populated with warning messages.

    * `code`: [Output Only] A warning code, if applicable. For example, Compute Engine returns NO_RESULTS_ON_PAGE if there are no results in the response.
    Possible values:
      * CLEANUP_FAILED
      * DEPRECATED_RESOURCE_USED
      * DEPRECATED_TYPE_USED
      * DISK_SIZE_LARGER_THAN_IMAGE_SIZE
      * EXPERIMENTAL_TYPE_USED
      * EXTERNAL_API_WARNING
      * FIELD_VALUE_OVERRIDEN
      * INJECTED_KERNELS_DEPRECATED
      * INVALID_HEALTH_CHECK_FOR_DYNAMIC_WIEGHTED_LB
      * LARGE_DEPLOYMENT_WARNING
      * LIST_OVERHEAD_QUOTA_EXCEED
      * MISSING_TYPE_DEPENDENCY
      * NEXT_HOP_ADDRESS_NOT_ASSIGNED
      * NEXT_HOP_CANNOT_IP_FORWARD
      * NEXT_HOP_INSTANCE_HAS_NO_IPV6_INTERFACE
      * NEXT_HOP_INSTANCE_NOT_FOUND
      * NEXT_HOP_INSTANCE_NOT_ON_NETWORK
      * NEXT_HOP_NOT_RUNNING
      * NOT_CRITICAL_ERROR
      * NO_RESULTS_ON_PAGE
      * PARTIAL_SUCCESS
      * REQUIRED_TOS_AGREEMENT
      * RESOURCE_IN_USE_BY_OTHER_RESOURCE_WARNING
      * RESOURCE_NOT_DELETED
      * SCHEMA_VALIDATION_IGNORED
      * SINGLE_INSTANCE_PROPERTY_TEMPLATE
      * UNDECLARED_PROPERTIES
      * UNREACHABLE

    * `message`: [Output Only] A human-readable description of the warning code.

    * `data`: [Output Only] Metadata about this warning in key: value format. For example: "data": [ { "key": "scope", "value": "zones/us-east1-d" } 

      * `key`: [Output Only] A key that provides more detail on the warning being returned. For example, for warnings where there are no results in a list request for a particular zone, this key might be scope and the key value might be the zone name. Other examples might be a key indicating a deprecated resource and a suggested replacement, or a warning about invalid network settings (for example, if an instance attempts to perform IP forwarding but is not enabled for IP forwarding).

      * `value`: [Output Only] A warning data value corresponding to the key.

  * `tls_settings`: The TLS settings for the server.

    * `tls_mode`: Indicates whether connections should be secured using TLS. The value of this field determines how TLS is enforced. This field can be set to one of the following: - SIMPLE Secure connections with standard TLS semantics. - MUTUAL Secure connections to the backends using mutual TLS by presenting client certificates for authentication. 
    Possible values:
      * INVALID
      * MUTUAL
      * SIMPLE

    * `proxy_tls_context`: [Deprecated] The TLS settings for the client or server. The TLS settings for the client or server.

      * `certificate_context`: [Deprecated] Defines the mechanism to obtain the client or server certificate. Defines the mechanism to obtain the client or server certificate.

        * `certificate_source`: Defines how TLS certificates are obtained.
        Possible values:
          * INVALID
          * USE_PATH
          * USE_SDS

        * `certificate_paths`: [Deprecated] The paths to the mounted TLS Certificates and private key. The paths to the mounted TLS Certificates and private key.

          * `certificate_path`: The path to the file holding the client or server TLS certificate to use.

          * `private_key_path`: The path to the file holding the client or server private key.

        * `sds_config`: [Deprecated] The configuration to access the SDS server. The configuration to access the SDS server.

          * `grpc_service_config`: [Deprecated] gRPC config to access the SDS server. gRPC config to access the SDS server.

            * `target_uri`: The target URI of the SDS server.

            * `channel_credentials`: [Deprecated] gRPC channel credentials to access the SDS server. gRPC channel credentials to access the SDS server.

              * `channel_credential_type`: The channel credentials to access the SDS server. This field can be set to one of the following: CERTIFICATES: Use TLS certificates to access the SDS server. GCE_VM: Use local GCE VM credentials to access the SDS server.
              Possible values:
                * CERTIFICATES
                * GCE_VM
                * INVALID

              * `certificates`: [Deprecated] The paths to the mounted TLS Certificates and private key. The paths to the mounted TLS Certificates and private key.

                * `certificate_path`: The path to the file holding the client or server TLS certificate to use.

                * `private_key_path`: The path to the file holding the client or server private key.

            * `call_credentials`: [Deprecated] gRPC call credentials to access the SDS server. gRPC call credentials to access the SDS server.

              * `call_credential_type`: The type of call credentials to use for GRPC requests to the SDS server. This field can be set to one of the following: - GCE_VM: The local GCE VM service account credentials are used to access the SDS server. - FROM_PLUGIN: Custom authenticator credentials are used to access the SDS server.
              Possible values:
                * FROM_PLUGIN
                * GCE_VM
                * INVALID

              * `from_plugin`: [Deprecated] Custom authenticator credentials. Custom authenticator credentials.

                * `name`: Plugin name.

                * `struct_config`: A text proto that conforms to a Struct type definition interpreted by the plugin.

      * `validation_context`: [Deprecated] Defines the mechanism to obtain the Certificate Authority certificate to validate the client/server certificate. validate the client/server certificate.

        * `validation_source`: Defines how TLS certificates are obtained.
        Possible values:
          * INVALID
          * USE_PATH
          * USE_SDS

        * `certificate_path`: The path to the file holding the CA certificate to validate the client or server certificate.

        * `sds_config`: [Deprecated] The configuration to access the SDS server. The configuration to access the SDS server.

          * `grpc_service_config`: [Deprecated] gRPC config to access the SDS server. gRPC config to access the SDS server.

            * `target_uri`: The target URI of the SDS server.

            * `channel_credentials`: [Deprecated] gRPC channel credentials to access the SDS server. gRPC channel credentials to access the SDS server.

              * `channel_credential_type`: The channel credentials to access the SDS server. This field can be set to one of the following: CERTIFICATES: Use TLS certificates to access the SDS server. GCE_VM: Use local GCE VM credentials to access the SDS server.
              Possible values:
                * CERTIFICATES
                * GCE_VM
                * INVALID

              * `certificates`: [Deprecated] The paths to the mounted TLS Certificates and private key. The paths to the mounted TLS Certificates and private key.

                * `certificate_path`: The path to the file holding the client or server TLS certificate to use.

                * `private_key_path`: The path to the file holding the client or server private key.

            * `call_credentials`: [Deprecated] gRPC call credentials to access the SDS server. gRPC call credentials to access the SDS server.

              * `call_credential_type`: The type of call credentials to use for GRPC requests to the SDS server. This field can be set to one of the following: - GCE_VM: The local GCE VM service account credentials are used to access the SDS server. - FROM_PLUGIN: Custom authenticator credentials are used to access the SDS server.
              Possible values:
                * FROM_PLUGIN
                * GCE_VM
                * INVALID

              * `from_plugin`: [Deprecated] Custom authenticator credentials. Custom authenticator credentials.

                * `name`: Plugin name.

                * `struct_config`: A text proto that conforms to a Struct type definition interpreted by the plugin.

    * `subject_alt_names`: A list of alternate names to verify the subject identity in the certificate presented by the client.

  * `region`: [Output Only] URL of the region where the regional SSL policy resides. This field is not applicable to global SSL policies.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
