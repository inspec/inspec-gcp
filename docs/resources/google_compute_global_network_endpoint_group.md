---
title: About the google_compute_global_network_endpoint_group resource
platform: gcp
---

## Syntax
A `google_compute_global_network_endpoint_group` is used to test a Google GlobalNetworkEndpointGroup resource

## Examples
```
describe google_compute_global_network_endpoint_group(networkEndpointGroup: ' ', project: 'chef-gcp-inspec') do
	it { should exist }
	its('kind') { should cmp '' }
	its('id') { should cmp '' }
	its('creation_timestamp') { should cmp '' }
	its('self_link') { should cmp '' }
	its('name') { should cmp 'inspec-gcp-global-endpoint-group' }
	its('description') { should cmp '' }
	its('network_endpoint_type') { should cmp 'INTERNET_IP_PORT' }
	its('region') { should cmp '' }
	its('zone') { should cmp '' }
	its('network') { should cmp '' }
	its('subnetwork') { should cmp '' }
	its('psc_target_service') { should cmp '' }

end

describe google_compute_global_network_endpoint_group(networkEndpointGroup: ' ', project: 'chef-gcp-inspec') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_global_network_endpoint_group` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#networkEndpointGroup for network endpoint group.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `name`: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `network_endpoint_type`: Type of network endpoints in this network endpoint group. Can be one of GCE_VM_IP, GCE_VM_IP_PORT, NON_GCP_PRIVATE_IP_PORT, INTERNET_FQDN_PORT, INTERNET_IP_PORT, SERVERLESS, PRIVATE_SERVICE_CONNECT.
  Possible values:
    * GCE_VM_IP
    * GCE_VM_IP_PORT
    * INTERNET_FQDN_PORT
    * INTERNET_IP_PORT
    * NON_GCP_PRIVATE_IP_PORT
    * PRIVATE_SERVICE_CONNECT
    * SERVERLESS

  * `size`: [Output only] Number of network endpoints in the network endpoint group.

  * `region`: [Output Only] The URL of the region where the network endpoint group is located.

  * `zone`: [Output Only] The URL of the zone where the network endpoint group is located.

  * `network`: The URL of the network to which all network endpoints in the NEG belong. Uses "default" project network if unspecified.

  * `subnetwork`: Optional URL of the subnetwork to which all network endpoints in the NEG belong.

  * `default_port`: The default port used if the port number is not specified in the network endpoint.

  * `annotations`: Metadata defined as annotations on the network endpoint group.

    * `additional_properties`: 

  * `cloud_run`: Configuration for a Cloud Run network endpoint group (NEG). The service must be provided explicitly or in the URL mask. The tag is optional, may be provided explicitly or in the URL mask. Note: Cloud Run service must be in the same project and located in the same region as the Serverless NEG.

    * `service`: Cloud Run service is the main resource of Cloud Run. The service must be 1-63 characters long, and comply with RFC1035. Example value: "run-service".

    * `tag`: Optional Cloud Run tag represents the "named-revision" to provide additional fine-grained traffic routing information. The tag must be 1-63 characters long, and comply with RFC1035. Example value: "revision-0010".

    * `url_mask`: A template to parse <service> and <tag> fields from a request URL. URL mask allows for routing to multiple Run services without having to create multiple network endpoint groups and backend services. For example, request URLs "foo1.domain.com/bar1" and "foo1.domain.com/bar2" can be backed by the same Serverless Network Endpoint Group (NEG) with URL mask "<tag>.domain.com/<service>". The URL mask will parse them to { service="bar1", tag="foo1" } and { service="bar2", tag="foo2" } respectively.

  * `app_engine`: Configuration for an App Engine network endpoint group (NEG). The service is optional, may be provided explicitly or in the URL mask. The version is optional and can only be provided explicitly or in the URL mask when service is present. Note: App Engine service must be in the same project and located in the same region as the Serverless NEG.

    * `service`: Optional serving service. The service name is case-sensitive and must be 1-63 characters long. Example value: "default", "my-service".

    * `version`: Optional serving version. The version name is case-sensitive and must be 1-100 characters long. Example value: "v1", "v2".

    * `url_mask`: A template to parse service and version fields from a request URL. URL mask allows for routing to multiple App Engine services without having to create multiple Network Endpoint Groups and backend services. For example, the request URLs "foo1-dot-appname.appspot.com/v1" and "foo1-dot-appname.appspot.com/v2" can be backed by the same Serverless NEG with URL mask "<service>-dot-appname.appspot.com/<version>". The URL mask will parse them to { service = "foo1", version = "v1" } and { service = "foo1", version = "v2" } respectively.

  * `cloud_function`: Configuration for a Cloud Function network endpoint group (NEG). The function must be provided explicitly or in the URL mask. Note: Cloud Function must be in the same project and located in the same region as the Serverless NEG.

    * `function`: A user-defined name of the Cloud Function. The function name is case-sensitive and must be 1-63 characters long. Example value: "func1".

    * `url_mask`: A template to parse function field from a request URL. URL mask allows for routing to multiple Cloud Functions without having to create multiple Network Endpoint Groups and backend services. For example, request URLs " mydomain.com/function1" and "mydomain.com/function2" can be backed by the same Serverless NEG with URL mask "/<function>". The URL mask will parse them to { function = "function1" } and { function = "function2" } respectively.

  * `psc_target_service`: The target service url used to set up private service connection to a Google API or a PSC Producer Service Attachment. An example value is: "asia-northeast3-cloudkms.googleapis.com"

  * `psc_data`: All data that is specifically relevant to only network endpoint groups of type PRIVATE_SERVICE_CONNECT.

    * `consumer_psc_address`: [Output Only] Address allocated from given subnetwork for PSC. This IP address acts as a VIP for a PSC NEG, allowing it to act as an endpoint in L7 PSC-XLB.

    * `psc_connection_id`: [Output Only] The PSC connection id of the PSC Network Endpoint Group Consumer.

    * `psc_connection_status`: [Output Only] The connection status of the PSC Forwarding Rule.
    Possible values:
      * ACCEPTED
      * CLOSED
      * NEEDS_ATTENTION
      * PENDING
      * REJECTED
      * STATUS_UNSPECIFIED


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
