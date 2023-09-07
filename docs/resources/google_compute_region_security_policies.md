---
title: About the google_compute_region_security_policies resource
platform: gcp
---

## Syntax
A `google_compute_region_security_policies` is used to test a Google RegionSecurityPolicy resource

## Examples
```
    describe google_compute_region_security_policy(project: 'chef-gcp-inspec', region: ' ') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_compute_region_security_policies` resource:

See [google_compute_region_security_policy.md](google_compute_region_security_policy.md) for more detailed information
  * `kinds`: an array of `google_compute_region_security_policy` kind
  * `descriptions`: an array of `google_compute_region_security_policy` description
  * `self_links`: an array of `google_compute_region_security_policy` self_link
  * `ids`: an array of `google_compute_region_security_policy` id
  * `creation_timestamps`: an array of `google_compute_region_security_policy` creation_timestamp
  * `names`: an array of `google_compute_region_security_policy` name
  * `interconnects`: an array of `google_compute_region_security_policy` interconnect
  * `routers`: an array of `google_compute_region_security_policy` router
  * `regions`: an array of `google_compute_region_security_policy` region
  * `google_reference_ids`: an array of `google_compute_region_security_policy` google_reference_id
  * `mtus`: an array of `google_compute_region_security_policy` mtu
  * `private_interconnect_infos`: an array of `google_compute_region_security_policy` private_interconnect_info
  * `operational_statuses`: an array of `google_compute_region_security_policy` operational_status
  * `cloud_router_ip_addresses`: an array of `google_compute_region_security_policy` cloud_router_ip_address
  * `customer_router_ip_addresses`: an array of `google_compute_region_security_policy` customer_router_ip_address
  * `types`: an array of `google_compute_region_security_policy` type
  * `pairing_keys`: an array of `google_compute_region_security_policy` pairing_key
  * `admin_enableds`: an array of `google_compute_region_security_policy` admin_enabled
  * `vlan_tag8021qs`: an array of `google_compute_region_security_policy` vlan_tag8021q
  * `edge_availability_domains`: an array of `google_compute_region_security_policy` edge_availability_domain
  * `candidate_subnets`: an array of `google_compute_region_security_policy` candidate_subnets
  * `bandwidths`: an array of `google_compute_region_security_policy` bandwidth
  * `partner_metadata`: an array of `google_compute_region_security_policy` partner_metadata
  * `labels`: an array of `google_compute_region_security_policy` labels
  * `label_fingerprints`: an array of `google_compute_region_security_policy` label_fingerprint
  * `states`: an array of `google_compute_region_security_policy` state
  * `partner_asns`: an array of `google_compute_region_security_policy` partner_asn
  * `encryptions`: an array of `google_compute_region_security_policy` encryption
  * `ipsec_internal_addresses`: an array of `google_compute_region_security_policy` ipsec_internal_addresses
  * `dataplane_versions`: an array of `google_compute_region_security_policy` dataplane_version
  * `satisfies_pzs`: an array of `google_compute_region_security_policy` satisfies_pzs
  * `stack_types`: an array of `google_compute_region_security_policy` stack_type
  * `cloud_router_ipv6_addresses`: an array of `google_compute_region_security_policy` cloud_router_ipv6_address
  * `customer_router_ipv6_addresses`: an array of `google_compute_region_security_policy` customer_router_ipv6_address
  * `candidate_ipv6_subnets`: an array of `google_compute_region_security_policy` candidate_ipv6_subnets
  * `cloud_router_ipv6_interface_ids`: an array of `google_compute_region_security_policy` cloud_router_ipv6_interface_id
  * `customer_router_ipv6_interface_ids`: an array of `google_compute_region_security_policy` customer_router_ipv6_interface_id
  * `subnet_lengths`: an array of `google_compute_region_security_policy` subnet_length
  * `remote_services`: an array of `google_compute_region_security_policy` remote_service
  * `configuration_constraints`: an array of `google_compute_region_security_policy` configuration_constraints

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
