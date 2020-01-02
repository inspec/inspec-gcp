---
title: About the google_compute_vpn_tunnel resource
platform: gcp
---

## Syntax
A `google_compute_vpn_tunnel` is used to test a Google VpnTunnel resource

## Examples
```
describe google_compute_vpn_tunnel(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-vpn-tunnel') do
  it { should exist }
  its('peer_ip') { should eq '15.0.0.120' }
end

describe google_compute_vpn_tunnel(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_vpn_tunnel` resource:


  * `id`: The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource.

  * `target_vpn_gateway`: URL of the Target VPN gateway with which this VPN tunnel is associated.

  * `router`: URL of router resource to be used for dynamic routing.

  * `peer_ip`: IP address of the peer VPN gateway. Only IPv4 is supported.

  * `shared_secret`: Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway.

  * `shared_secret_hash`: Hash of the shared secret.

  * `ike_version`: IKE protocol version to use when establishing the VPN tunnel with peer VPN gateway. Acceptable IKE versions are 1 or 2. Default version is 2.

  * `local_traffic_selector`: Local traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported.

  * `remote_traffic_selector`: Remote traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported.

  * `region`: The region where the tunnel is located.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
