---
title: About the google_compute_global_forwarding_rule resource
platform: gcp
---

## Syntax
A `google_compute_global_forwarding_rule` is used to test a Google GlobalForwardingRule resource

## Examples
```
describe google_compute_global_forwarding_rule(project: 'chef-gcp-inspec', name: 'inspec-gcp-global-forwarding-rule') do
  it { should exist }
  its('port_range') { should eq '80-80' }
  its('target') { should  match /\/inspec-gcp-http-proxy$/ }
end

describe google_compute_global_forwarding_rule(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_global_forwarding_rule` resource:

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource.

  * `ip_address`: The IP address that this forwarding rule is serving on behalf of.  Addresses are restricted based on the forwarding rule's load balancing scheme (external or internal) and scope (global or regional). The address must be a global IP for external global forwarding rules.  If this field is empty, an ephemeral IPv4 address from the same scope (global) is chosen. Global forwarding rules supports either IPv4 or IPv6.  When the load balancing scheme is INTERNAL_SELF_MANAGED, this must be a URL reference to an existing Address resource (internal regional static IP address), with a purpose of GCE_END_POINT and addressType of INTERNAL.  An address can be specified either by a literal IP address or a URL reference to an existing Address resource. The following examples are all valid:  * 100.1.2.3 * https://www.googleapis.com/compute/v1/projects/project/regions/      region/addresses/address * projects/project/regions/region/addresses/address * regions/region/addresses/address * global/addresses/address * address

  * `ip_protocol`: The IP protocol to which this rule applies. Valid options are TCP, UDP, ESP, AH, SCTP or ICMP. When the load balancing scheme is INTERNAL_SELF_MANAGED, only TCP is valid.

  * `ip_version`: The IP Version that will be used by this global forwarding rule. Valid options are IPV4 or IPV6.

  * `load_balancing_scheme`: This signifies what the GlobalForwardingRule will be used for. The value of INTERNAL_SELF_MANAGED means that this will be used for Internal Global HTTP(S) LB. The value of EXTERNAL means that this will be used for External Global Load Balancing (HTTP(S) LB, External TCP/UDP LB, SSL Proxy)  NOTE: Currently global forwarding rules cannot be used for INTERNAL load balancing.

  * `name`: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `network`: This field is not used for external load balancing. For INTERNAL_SELF_MANAGED load balancing, this field identifies the network that the load balanced IP should belong to for this global forwarding rule. If this field is not specified, the default network will be used.

  * `port_range`: This field is used along with the target field for TargetHttpProxy, TargetHttpsProxy, TargetSslProxy, TargetTcpProxy, TargetVpnGateway, TargetPool, TargetInstance.  Applicable only when IPProtocol is TCP, UDP, or SCTP, only packets addressed to ports in the specified range will be forwarded to target. Forwarding rules with the same [IPAddress, IPProtocol] pair must have disjoint port ranges.  Some types of forwarding target have constraints on the acceptable ports:  * TargetHttpProxy: 80, 8080 * TargetHttpsProxy: 443 * TargetTcpProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995,                   1883, 5222 * TargetSslProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995,                   1883, 5222 * TargetVpnGateway: 500, 4500

  * `target`: The URL of the target resource to receive the matched traffic. The forwarded traffic must be of a type appropriate to the target object.



## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
