---
title: About the google_compute_vpn_tunnels resource
platform: gcp
---

## Syntax
A `google_compute_vpn_tunnels` is used to test a Google VpnTunnel resource

## Examples
```
describe google_compute_vpn_tunnels(project: 'chef-gcp-inspec', region: 'europe-west2') do
	its('vpn_tunnel_names') { should include 'inspec-vpn-tunnel' }
  its('peer_ips') { should include '15.0.0.120' }
end
```

## Properties
Properties that can be accessed from the `google_compute_vpn_tunnels` resource:

See [google_compute_vpn_tunnel.md](google_compute_vpn_tunnel.md) for more detailed information
  * `ids`: an array of `google_compute_vpn_tunnel` id
  * `creation_timestamps`: an array of `google_compute_vpn_tunnel` creation_timestamp
  * `vpn_tunnel_names`: an array of `google_compute_vpn_tunnel` name
  * `descriptions`: an array of `google_compute_vpn_tunnel` description
  * `target_vpn_gateways`: an array of `google_compute_vpn_tunnel` target_vpn_gateway
  * `routers`: an array of `google_compute_vpn_tunnel` router
  * `peer_ips`: an array of `google_compute_vpn_tunnel` peer_ip
  * `shared_secrets`: an array of `google_compute_vpn_tunnel` shared_secret
  * `shared_secret_hashes`: an array of `google_compute_vpn_tunnel` shared_secret_hash
  * `ike_versions`: an array of `google_compute_vpn_tunnel` ike_version
  * `local_traffic_selectors`: an array of `google_compute_vpn_tunnel` local_traffic_selector
  * `remote_traffic_selectors`: an array of `google_compute_vpn_tunnel` remote_traffic_selector
  * `regions`: an array of `google_compute_vpn_tunnel` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
