+++
title = "google_compute_network_attachment resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_network_attachment"
identifier = "inspec/resources/gcp/google_compute_network_attachment Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_network_attachment` InSpec audit resource to to test a Google Cloud NetworkAttachment resource.

## Examples

```ruby
describe google_compute_network_attachment(name: 'value_name', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('region') { should cmp 'value_region' }
	its('connection_preference') { should cmp 'value_connectionpreference' }
	its('fingerprint') { should cmp 'value_fingerprint' }
	its('network') { should cmp 'value_network' }

end

describe google_compute_network_attachment(name: 'value_name', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_network_attachment` resource:


  * `kind`: [Output Only] Type of the resource.

  * `id`: [Output Only] The unique identifier for the resource type. The server generates this identifier.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource's resource id.

  * `region`: [Output Only] URL of the region where the network attachment resides. This field applies only to the region resource. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `connection_preference`:
  Possible values:
    * ACCEPT_AUTOMATIC
    * ACCEPT_MANUAL
    * INVALID

  * `connection_endpoints`: [Output Only] An array of connections for all the producers connected to this network attachment.

    * `status`: The status of a connected endpoint to this network attachment.
    Possible values:
      * ACCEPTED
      * CLOSED
      * NEEDS_ATTENTION
      * PENDING
      * REJECTED
      * STATUS_UNSPECIFIED

    * `project_id_or_num`: The project id or number of the interface to which the IP was assigned.

    * `subnetwork`: The subnetwork used to assign the IP to the producer instance network interface.

    * `ip_address`: The IPv4 address assigned to the producer instance network interface. This value will be a range in case of Serverless.

    * `ipv6_address`: The IPv6 address assigned to the producer instance network interface. This is only assigned when the stack types of both the instance network interface and the consumer subnet are IPv4_IPv6.

    * `secondary_ip_cidr_ranges`: Alias IP ranges from the same subnetwork.

    * `subnetwork_cidr_range`: [Output Only] The CIDR range of the subnet from which the IPv4 internal IP was allocated from.

  * `subnetworks`: An array of URLs where each entry is the URL of a subnet provided by the service consumer to use for endpoints in the producers that connect to this network attachment.

  * `producer_reject_lists`: Projects that are not allowed to connect to this network attachment. The project can be specified using its id or number.

  * `producer_accept_lists`: Projects that are allowed to connect to this network attachment. The project can be specified using its id or number.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. An up-to-date fingerprint must be provided in order to patch.

  * `network`: [Output Only] The URL of the network which the Network Attachment belongs to. Practically it is inferred by fetching the network of the first subnetwork associated. Because it is required that all the subnetworks must be from the same network, it is assured that the Network Attachment belongs to the same network as all the subnetworks.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
