---
title: About the google_compute_service_attachment resource
platform: gcp
---

## Syntax
A `google_compute_service_attachment` is used to test a Google ServiceAttachment resource

## Examples
```
describe google_compute_service_attachment(project: 'chef-gcp-inspec', region: ' value_region', service_attachment: ' ') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('region') { should cmp 'value_region' }
	its('producer_forwarding_rule') { should cmp 'value_producerforwardingrule' }
	its('target_service') { should cmp 'value_targetservice' }
	its('connection_preference') { should cmp 'value_connectionpreference' }
	its('fingerprint') { should cmp 'value_fingerprint' }

end

describe google_compute_service_attachment(project: 'chef-gcp-inspec', region: ' value_region', service_attachment: ' ') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_service_attachment` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#serviceAttachment for service attachments.

  * `id`: [Output Only] The unique identifier for the resource type. The server generates this identifier.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `region`: [Output Only] URL of the region where the service attachment resides. This field applies only to the region resource. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `producer_forwarding_rule`: The URL of a forwarding rule with loadBalancingScheme INTERNAL* that is serving the endpoint identified by this service attachment.

  * `target_service`: The URL of a service serving the endpoint identified by this service attachment.

  * `connection_preference`: The connection preference of service attachment. The value can be set to ACCEPT_AUTOMATIC. An ACCEPT_AUTOMATIC service attachment is one that always accepts the connection from consumer forwarding rules.
  Possible values:
    * ACCEPT_AUTOMATIC
    * ACCEPT_MANUAL
    * CONNECTION_PREFERENCE_UNSPECIFIED

  * `connected_endpoints`: [Output Only] An array of connections for all the consumers connected to this service attachment.

    * `status`: The status of a connected endpoint to this service attachment.
    Possible values:
      * ACCEPTED
      * CLOSED
      * NEEDS_ATTENTION
      * PENDING
      * REJECTED
      * STATUS_UNSPECIFIED

    * `psc_connection_id`: The PSC connection id of the connected endpoint.

    * `endpoint`: The url of a connected endpoint.

    * `consumer_network`: The url of the consumer network.

  * `nat_subnets`: An array of URLs where each entry is the URL of a subnet provided by the service producer to use for NAT in this service attachment.

  * `enable_proxy_protocol`: If true, enable the proxy protocol which is for supplying client TCP/IP address data in TCP connections that traverse proxies on their way to destination servers.

  * `consumer_reject_lists`: Projects that are not allowed to connect to this service attachment. The project can be specified using its id or number.

  * `consumer_accept_lists`: Projects that are allowed to connect to this service attachment.

    * `project_id_or_num`: The project id or number for the project to set the limit for.

    * `network_url`: The network URL for the network to set the limit for.

    * `connection_limit`: The value of the limit to set.

  * `psc_service_attachment_id`:

    * `high`:

    * `low`:

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a ServiceAttachment. An up-to-date fingerprint must be provided in order to patch/update the ServiceAttachment; otherwise, the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve the ServiceAttachment.

  * `domain_names`: If specified, the domain name will be used during the integration between the PSC connected endpoints and the Cloud DNS. For example, this is a valid domain name: "p.mycompany.com.". Current max number of domain names supported is 1.

  * `reconcile_connections`: This flag determines whether a consumer accept/reject list change can reconcile the statuses of existing ACCEPTED or REJECTED PSC endpoints. - If false, connection policy update will only affect existing PENDING PSC endpoints. Existing ACCEPTED/REJECTED endpoints will remain untouched regardless how the connection policy is modified . - If true, update will affect both PENDING and ACCEPTED/REJECTED PSC endpoints. For example, an ACCEPTED PSC endpoint will be moved to REJECTED if its project is added to the reject list. For newly created service attachment, this boolean defaults to false.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
