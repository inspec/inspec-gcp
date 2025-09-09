+++
title = "google_compute_interconnect_attachment resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_interconnect_attachment"
identifier = "inspec/resources/gcp/google_compute_interconnect_attachment Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_interconnect_attachment` InSpec audit resource to to test a Google Cloud InterconnectAttachment resource.

## Examples

```ruby
describe google_compute_interconnect_attachment(name: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('interconnect') { should cmp 'value_interconnect' }
	its('router') { should cmp 'value_router' }
	its('region') { should cmp 'value_region' }
	its('google_reference_id') { should cmp 'value_googlereferenceid' }
	its('operational_status') { should cmp 'value_operationalstatus' }
	its('cloud_router_ip_address') { should cmp 'value_cloudrouteripaddress' }
	its('customer_router_ip_address') { should cmp 'value_customerrouteripaddress' }
	its('type') { should cmp 'value_type' }
	its('pairing_key') { should cmp 'value_pairingkey' }
	its('edge_availability_domain') { should cmp 'value_edgeavailabilitydomain' }
	its('bandwidth') { should cmp 'value_bandwidth' }
	its('label_fingerprint') { should cmp 'value_labelfingerprint' }
	its('state') { should cmp 'value_state' }
	its('partner_asn') { should cmp 'value_partnerasn' }
	its('encryption') { should cmp 'value_encryption' }
	its('stack_type') { should cmp 'value_stacktype' }
	its('cloud_router_ipv6address') { should cmp 'value_cloudrouteripv6address' }
	its('customer_router_ipv6address') { should cmp 'value_customerrouteripv6address' }
	its('cloud_router_ipv6interface_id') { should cmp 'value_cloudrouteripv6interfaceid' }
	its('customer_router_ipv6interface_id') { should cmp 'value_customerrouteripv6interfaceid' }
	its('remote_service') { should cmp 'value_remoteservice' }

end

describe google_compute_interconnect_attachment(name: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_interconnect_attachment` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#interconnectAttachment for interconnect attachments.

  * `description`: An optional description of this resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `interconnect`: URL of the underlying Interconnect object that this attachment's traffic will traverse through.

  * `router`: URL of the Cloud Router to be used for dynamic routing. This router must be in the same region as this InterconnectAttachment. The InterconnectAttachment will automatically connect the Interconnect to the network & region within which the Cloud Router is configured.

  * `region`: [Output Only] URL of the region where the regional interconnect attachment resides. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `google_reference_id`: [Output Only] Google reference ID, to be used when raising support tickets with Google or otherwise to debug backend connectivity issues. [Deprecated] This field is not used.

  * `mtu`: Maximum Transmission Unit (MTU), in bytes, of packets passing through this interconnect attachment. Only 1440 and 1500 are allowed. If not specified, the value will default to 1440.

  * `private_interconnect_info`: Information for an interconnect attachment when this belongs to an interconnect of type DEDICATED.

    * `tag8021q`: [Output Only] 802.1q encapsulation tag to be used for traffic between Google and the customer, going to and from this network and region.

  * `operational_status`: [Output Only] The current status of whether or not this interconnect attachment is functional, which can take one of the following values: - OS_ACTIVE: The attachment has been turned up and is ready to use. - OS_UNPROVISIONED: The attachment is not ready to use yet, because turnup is not complete.
  Possible values:
    * OS_ACTIVE
    * OS_UNPROVISIONED

  * `cloud_router_ip_address`: [Output Only] IPv4 address + prefix length to be configured on Cloud Router Interface for this interconnect attachment.

  * `customer_router_ip_address`: [Output Only] IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment.

  * `type`: The type of interconnect attachment this is, which can take one of the following values: - DEDICATED: an attachment to a Dedicated Interconnect. - PARTNER: an attachment to a Partner Interconnect, created by the customer. - PARTNER_PROVIDER: an attachment to a Partner Interconnect, created by the partner.
  Possible values:
    * DEDICATED
    * PARTNER
    * PARTNER_PROVIDER

  * `pairing_key`: [Output only for type PARTNER. Input only for PARTNER_PROVIDER. Not present for DEDICATED]. The opaque identifier of a PARTNER attachment used to initiate provisioning with a selected partner. Of the form "XXXXX/region/domain"

  * `admin_enabled`: Determines whether this Attachment will carry packets. Not present for PARTNER_PROVIDER.

  * `vlan_tag8021q`: The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4093. Only specified at creation time.

  * `edge_availability_domain`: Desired availability domain for the attachment. Only available for type PARTNER, at creation time, and can take one of the following values: - AVAILABILITY_DOMAIN_ANY - AVAILABILITY_DOMAIN_1 - AVAILABILITY_DOMAIN_2 For improved reliability, customers should configure a pair of attachments, one per availability domain. The selected availability domain will be provided to the Partner via the pairing key, so that the provisioned circuit will lie in the specified domain. If not specified, the value will default to AVAILABILITY_DOMAIN_ANY.
  Possible values:
    * AVAILABILITY_DOMAIN_1
    * AVAILABILITY_DOMAIN_2
    * AVAILABILITY_DOMAIN_ANY

  * `candidate_subnets`: Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). Google will attempt to select an unused /29 from the supplied candidate prefix(es). The request will fail if all possible /29s are in use on Google's edge. If not supplied, Google will randomly select an unused /29 from all of link-local space.

  * `bandwidth`: Provisioned bandwidth capacity for the interconnect attachment. For attachments of type DEDICATED, the user can set the bandwidth. For attachments of type PARTNER, the Google Partner that is operating the interconnect must set the bandwidth. Output only for PARTNER type, mutable for PARTNER_PROVIDER and DEDICATED, and can take one of the following values: - BPS_50M: 50 Mbit/s - BPS_100M: 100 Mbit/s - BPS_200M: 200 Mbit/s - BPS_300M: 300 Mbit/s - BPS_400M: 400 Mbit/s - BPS_500M: 500 Mbit/s - BPS_1G: 1 Gbit/s - BPS_2G: 2 Gbit/s - BPS_5G: 5 Gbit/s - BPS_10G: 10 Gbit/s - BPS_20G: 20 Gbit/s - BPS_50G: 50 Gbit/s
  Possible values:
    * BPS_100M
    * BPS_10G
    * BPS_1G
    * BPS_200M
    * BPS_20G
    * BPS_2G
    * BPS_300M
    * BPS_400M
    * BPS_500M
    * BPS_50G
    * BPS_50M
    * BPS_5G

  * `partner_metadata`: Informational metadata about Partner attachments from Partners to display to customers. These fields are propagated from PARTNER_PROVIDER attachments to their corresponding PARTNER attachments.

    * `partner_name`: Plain text name of the Partner providing this attachment. This value may be validated to match approved Partner values.

    * `interconnect_name`: Plain text name of the Interconnect this attachment is connected to, as displayed in the Partner's portal. For instance "Chicago 1". This value may be validated to match approved Partner values.

    * `portal_url`: URL of the Partner's portal for this Attachment. Partners may customise this to be a deep link to the specific resource on the Partner portal. This value may be validated to match approved Partner values.

  * `labels`: Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty.

    * `additional_properties`:

  * `label_fingerprint`: A fingerprint for the labels being applied to this InterconnectAttachment, which is essentially a hash of the labels set used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update labels. You must always provide an up-to-date fingerprint hash in order to update or change labels, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve an InterconnectAttachment.

  * `state`: [Output Only] The current state of this attachment's functionality. Enum values ACTIVE and UNPROVISIONED are shared by DEDICATED/PRIVATE, PARTNER, and PARTNER_PROVIDER interconnect attachments, while enum values PENDING_PARTNER, PARTNER_REQUEST_RECEIVED, and PENDING_CUSTOMER are used for only PARTNER and PARTNER_PROVIDER interconnect attachments. This state can take one of the following values: - ACTIVE: The attachment has been turned up and is ready to use. - UNPROVISIONED: The attachment is not ready to use yet, because turnup is not complete. - PENDING_PARTNER: A newly-created PARTNER attachment that has not yet been configured on the Partner side. - PARTNER_REQUEST_RECEIVED: A PARTNER attachment is in the process of provisioning after a PARTNER_PROVIDER attachment was created that references it. - PENDING_CUSTOMER: A PARTNER or PARTNER_PROVIDER attachment that is waiting for a customer to activate it. - DEFUNCT: The attachment was deleted externally and is no longer functional. This could be because the associated Interconnect was removed, or because the other side of a Partner attachment was deleted.
  Possible values:
    * ACTIVE
    * DEFUNCT
    * PARTNER_REQUEST_RECEIVED
    * PENDING_CUSTOMER
    * PENDING_PARTNER
    * STATE_UNSPECIFIED
    * UNPROVISIONED

  * `partner_asn`: Optional BGP ASN for the router supplied by a Layer 3 Partner if they configured BGP on behalf of the customer. Output only for PARTNER type, input only for PARTNER_PROVIDER, not available for DEDICATED.

  * `encryption`: Indicates the user-supplied encryption option of this VLAN attachment (interconnectAttachment). Can only be specified at attachment creation for PARTNER or DEDICATED attachments. Possible values are: - NONE - This is the default value, which means that the VLAN attachment carries unencrypted traffic. VMs are able to send traffic to, or receive traffic from, such a VLAN attachment. - IPSEC - The VLAN attachment carries only encrypted traffic that is encrypted by an IPsec device, such as an HA VPN gateway or third-party IPsec VPN. VMs cannot directly send traffic to, or receive traffic from, such a VLAN attachment. To use *HA VPN over Cloud Interconnect*, the VLAN attachment must be created with this option.
  Possible values:
    * IPSEC
    * NONE

  * `ipsec_internal_addresses`: A list of URLs of addresses that have been reserved for the VLAN attachment. Used only for the VLAN attachment that has the encryption option as IPSEC. The addresses must be regional internal IP address ranges. When creating an HA VPN gateway over the VLAN attachment, if the attachment is configured to use a regional internal IP address, then the VPN gateway's IP address is allocated from the IP address range specified here. For example, if the HA VPN gateway's interface 0 is paired to this VLAN attachment, then a regional internal IP address for the VPN gateway interface 0 will be allocated from the IP address specified for this VLAN attachment. If this field is not specified when creating the VLAN attachment, then later on when creating an HA VPN gateway on this VLAN attachment, the HA VPN gateway's IP address is allocated from the regional external IP address pool.

  * `dataplane_version`: [Output Only] Dataplane version for this InterconnectAttachment. This field is only present for Dataplane version 2 and higher. Absence of this field in the API output indicates that the Dataplane is version 1.

  * `satisfies_pzs`: [Output Only] Reserved for future use.

  * `stack_type`: The stack type for this interconnect attachment to identify whether the IPv6 feature is enabled or not. If not specified, IPV4_ONLY will be used. This field can be both set at interconnect attachments creation and update interconnect attachment operations.
  Possible values:
    * IPV4_IPV6
    * IPV4_ONLY

  * `cloud_router_ipv6_address`: [Output Only] IPv6 address + prefix length to be configured on Cloud Router Interface for this interconnect attachment.

  * `customer_router_ipv6_address`: [Output Only] IPv6 address + prefix length to be configured on the customer router subinterface for this interconnect attachment.

  * `candidate_ipv6_subnets`: This field is not available.

  * `cloud_router_ipv6_interface_id`: This field is not available.

  * `customer_router_ipv6_interface_id`: This field is not available.

  * `subnet_length`: Length of the IPv4 subnet mask. Allowed values: - 29 (default) - 30 The default value is 29, except for Cross-Cloud Interconnect connections that use an InterconnectRemoteLocation with a constraints.subnetLengthRange.min equal to 30. For example, connections that use an Azure remote location fall into this category. In these cases, the default value is 30, and requesting 29 returns an error. Where both 29 and 30 are allowed, 29 is preferred, because it gives Google Cloud Support more debugging visibility.

  * `remote_service`: [Output Only] If the attachment is on a Cross-Cloud Interconnect connection, this field contains the interconnect's remote location service provider. Example values: "Amazon Web Services" "Microsoft Azure". The field is set only for attachments on Cross-Cloud Interconnect connections. Its value is copied from the InterconnectRemoteLocation remoteService field.

  * `configuration_constraints`:

    * `bgp_md5`: [Output Only] Whether the attachment's BGP session requires/allows/disallows BGP MD5 authentication. This can take one of the following values: MD5_OPTIONAL, MD5_REQUIRED, MD5_UNSUPPORTED. For example, a Cross-Cloud Interconnect connection to a remote cloud provider that requires BGP MD5 authentication has the interconnectRemoteLocation attachment_configuration_constraints.bgp_md5 field set to MD5_REQUIRED, and that property is propagated to the attachment. Similarly, if BGP MD5 is MD5_UNSUPPORTED, an error is returned if MD5 is requested.
    Possible values:
      * MD5_OPTIONAL
      * MD5_REQUIRED
      * MD5_UNSUPPORTED

    * `bgp_peer_asn_ranges`: [Output Only] List of ASN ranges that the remote location is known to support. Formatted as an array of inclusive ranges {min: min-value, max: max-value}. For example, [{min: 123, max: 123}, {min: 64512, max: 65534}] allows the peer ASN to be 123 or anything in the range 64512-65534. This field is only advisory. Although the API accepts other ranges, these are the ranges that we recommend.

      * `min`:

      * `max`:

  * `multicast_enabled`: Whether or not to permit multicast traffic for this attachment. Multicast packets will be dropped if this is not enabled.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
