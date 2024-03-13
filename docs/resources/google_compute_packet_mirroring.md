---
title: About the google_compute_packet_mirroring resource
platform: gcp
---

## Syntax
A `google_compute_packet_mirroring` is used to test a Google PacketMirroring resource

## Examples
```
describe google_compute_packet_mirroring(packetMirroring: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('region') { should cmp 'value_region' }
	its('enable') { should cmp 'value_enable' }

end

describe google_compute_packet_mirroring(packetMirroring: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_packet_mirroring` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#packetMirroring for packet mirrorings.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `name`: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `region`: [Output Only] URI of the region where the packetMirroring resides.

  * `network`: 

    * `url`: URL of the network resource.

    * `canonical_url`: [Output Only] Unique identifier for the network; defined by the server.

  * `priority`: The priority of applying this configuration. Priority is used to break ties in cases where there is more than one matching rule. In the case of two rules that apply for a given Instance, the one with the lowest-numbered priority value wins. Default value is 1000. Valid range is 0 through 65535.

  * `collector_ilb`: 

    * `url`: Resource URL to the forwarding rule representing the ILB configured as destination of the mirrored traffic.

    * `canonical_url`: [Output Only] Unique identifier for the forwarding rule; defined by the server.

  * `mirrored_resources`: 

    * `subnetworks`: A set of subnetworks for which traffic from/to all VM instances will be mirrored. They must live in the same region as this packetMirroring. You may specify a maximum of 5 subnetworks.

      * `url`: Resource URL to the subnetwork for which traffic from/to all VM instances will be mirrored.

      * `canonical_url`: [Output Only] Unique identifier for the subnetwork; defined by the server.

    * `instances`: A set of virtual machine instances that are being mirrored. They must live in zones contained in the same region as this packetMirroring. Note that this config will apply only to those network interfaces of the Instances that belong to the network specified in this packetMirroring. You may specify a maximum of 50 Instances.

      * `url`: Resource URL to the virtual machine instance which is being mirrored.

      * `canonical_url`: [Output Only] Unique identifier for the instance; defined by the server.

    * `tags`: A set of mirrored tags. Traffic from/to all VM instances that have one or more of these tags will be mirrored.

  * `filter`: 

    * `cidr_ranges`: One or more IPv4 or IPv6 CIDR ranges that apply as filter on the source (ingress) or destination (egress) IP in the IP header. If no ranges are specified, all IPv4 traffic that matches the specified IPProtocols is mirrored. If neither cidrRanges nor IPProtocols is specified, all IPv4 traffic is mirrored. To mirror all IPv4 and IPv6 traffic, use "0.0.0.0/0,::/0". Note: Support for IPv6 traffic is in preview.

    * `ip_protocols`: Protocols that apply as filter on mirrored traffic. If no protocols are specified, all traffic that matches the specified CIDR ranges is mirrored. If neither cidrRanges nor IPProtocols is specified, all IPv4 traffic is mirrored.

    * `direction`: Direction of traffic to mirror, either INGRESS, EGRESS, or BOTH. The default is BOTH.
    Possible values:
      * BOTH
      * EGRESS
      * INGRESS

  * `enable`: Indicates whether or not this packet mirroring takes effect. If set to FALSE, this packet mirroring policy will not be enforced on the network. The default is TRUE.
  Possible values:
    * FALSE
    * TRUE


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
