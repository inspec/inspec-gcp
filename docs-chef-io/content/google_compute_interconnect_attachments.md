+++
title = "google_compute_interconnect_attachments resource"

draft = false


[menu.gcp]
title = "google_compute_interconnect_attachments"
identifier = "inspec/resources/gcp/google_compute_interconnect_attachments resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_interconnect_attachments` InSpec audit resource to to test a Google Cloud InterconnectAttachment resource.

## Examples

```ruby
    describe google_compute_interconnect_attachments(project: 'chef-gcp-inspec', region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_compute_interconnect_attachments` resource:

See [google_compute_interconnect_attachment](google_compute_interconnect_attachment) for more detailed information.

  * `kinds`: an array of `google_compute_interconnect_attachment` kind
  * `descriptions`: an array of `google_compute_interconnect_attachment` description
  * `self_links`: an array of `google_compute_interconnect_attachment` self_link
  * `self_link_with_ids`: an array of `google_compute_interconnect_attachment` self_link_with_id
  * `ids`: an array of `google_compute_interconnect_attachment` id
  * `creation_timestamps`: an array of `google_compute_interconnect_attachment` creation_timestamp
  * `names`: an array of `google_compute_interconnect_attachment` name
  * `interconnects`: an array of `google_compute_interconnect_attachment` interconnect
  * `routers`: an array of `google_compute_interconnect_attachment` router
  * `regions`: an array of `google_compute_interconnect_attachment` region
  * `google_reference_ids`: an array of `google_compute_interconnect_attachment` google_reference_id
  * `mtus`: an array of `google_compute_interconnect_attachment` mtu
  * `private_interconnect_infos`: an array of `google_compute_interconnect_attachment` private_interconnect_info
  * `operational_statuses`: an array of `google_compute_interconnect_attachment` operational_status
  * `cloud_router_ip_addresses`: an array of `google_compute_interconnect_attachment` cloud_router_ip_address
  * `customer_router_ip_addresses`: an array of `google_compute_interconnect_attachment` customer_router_ip_address
  * `types`: an array of `google_compute_interconnect_attachment` type
  * `pairing_keys`: an array of `google_compute_interconnect_attachment` pairing_key
  * `admin_enableds`: an array of `google_compute_interconnect_attachment` admin_enabled
  * `vlan_tag8021qs`: an array of `google_compute_interconnect_attachment` vlan_tag8021q
  * `edge_availability_domains`: an array of `google_compute_interconnect_attachment` edge_availability_domain
  * `candidate_subnets`: an array of `google_compute_interconnect_attachment` candidate_subnets
  * `bandwidths`: an array of `google_compute_interconnect_attachment` bandwidth
  * `partner_metadata`: an array of `google_compute_interconnect_attachment` partner_metadata
  * `labels`: an array of `google_compute_interconnect_attachment` labels
  * `label_fingerprints`: an array of `google_compute_interconnect_attachment` label_fingerprint
  * `states`: an array of `google_compute_interconnect_attachment` state
  * `partner_asns`: an array of `google_compute_interconnect_attachment` partner_asn
  * `encryptions`: an array of `google_compute_interconnect_attachment` encryption
  * `ipsec_internal_addresses`: an array of `google_compute_interconnect_attachment` ipsec_internal_addresses
  * `dataplane_versions`: an array of `google_compute_interconnect_attachment` dataplane_version
  * `satisfies_pzs`: an array of `google_compute_interconnect_attachment` satisfies_pzs
  * `stack_types`: an array of `google_compute_interconnect_attachment` stack_type
  * `cloud_router_ipv6_addresses`: an array of `google_compute_interconnect_attachment` cloud_router_ipv6_address
  * `customer_router_ipv6_addresses`: an array of `google_compute_interconnect_attachment` customer_router_ipv6_address
  * `candidate_ipv6_subnets`: an array of `google_compute_interconnect_attachment` candidate_ipv6_subnets
  * `cloud_router_ipv6_interface_ids`: an array of `google_compute_interconnect_attachment` cloud_router_ipv6_interface_id
  * `customer_router_ipv6_interface_ids`: an array of `google_compute_interconnect_attachment` customer_router_ipv6_interface_id
  * `subnet_lengths`: an array of `google_compute_interconnect_attachment` subnet_length
  * `remote_services`: an array of `google_compute_interconnect_attachment` remote_service
  * `configuration_constraints`: an array of `google_compute_interconnect_attachment` configuration_constraints
  * `multicast_enableds`: an array of `google_compute_interconnect_attachment` multicast_enabled

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
