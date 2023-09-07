---
title: About the google_compute_region_security_policy resource
platform: gcp
---

## Syntax
A `google_compute_region_security_policy` is used to test a Google RegionSecurityPolicy resource

## Examples
```
      describe google_compute_region_security_policy(project: 'chef-gcp-inspec', region: ' ', securityPolicy: ' ') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_compute_region_security_policy` resource:


  * `kind`: Type of the resource. Always compute#interconnectAttachment for interconnect attachments. 

  * `description`: An optional description of this resource. 

  * `self_link`: Server-defined URL for the resource. 

  * `id`: string (uint64 format) The unique identifier for the resource. This identifier is defined by the server. 

  * `creation_timestamp`: Creation timestamp in RFC3339 text format. 

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. 

  * `interconnect`: URL of the underlying Interconnect object that this attachment's traffic will traverse through. 

  * `router`: URL of the Cloud Router to be used for dynamic routing. This router must be in the same region as this InterconnectAttachment. The InterconnectAttachment will automatically connect the Interconnect to the network & region within which the Cloud Router is configured. 

  * `region`: URL of the region where the regional interconnect attachment resides. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body. 

  * `google_reference_id`: 

  * `mtu`: integer Maximum Transmission Unit (MTU), in bytes, of packets passing through this interconnect attachment. Only 1440 and 1500 are allowed. If not specified, the value will default to 1440. 

  * `private_interconnect_info`: object Information specific to an InterconnectAttachment. This property is populated if the interconnect that this is attached to is of type DEDICATED. 

    * `tag8021q`: integer 802.1q encapsulation tag to be used for traffic between Google and the customer, going to and from this network and region. 

  * `operational_status`: The current status of whether or not this interconnect attachment is functional, which can take one of the following values: OS_ACTIVE: The attachment has been turned up and is ready to use. OS_UNPROVISIONED: The attachment is not ready to use yet, because turnup is not complete. 
  Possible values:
    * OS_ACTIVE
    * OS_UNPROVISIONED

  * `cloud_router_ip_address`: IPv4 address + prefix length to be configured on Cloud Router Interface for this interconnect attachment. 

  * `customer_router_ip_address`: IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. 

  * `type`: The type of interconnect attachment this is, which can take one of the following values: DEDICATED: an attachment to a Dedicated Interconnect. PARTNER: an attachment to a Partner Interconnect, created by the customer. PARTNER_PROVIDER: an attachment to a Partner Interconnect, created by the partner. 
  Possible values:
    * DEDICATED
    * PARTNER
    * PARTNER_PROVIDER

  * `pairing_key`: [Output only for type PARTNER. Input only for PARTNER_PROVIDER. Not present for DEDICATED]. The opaque identifier of a PARTNER attachment used to initiate provisioning with a selected partner. Of the form "XXXXX/region/domain" 

  * `admin_enabled`: boolean Determines whether this Attachment will carry packets. Not present for PARTNER_PROVIDER. 

  * `vlan_tag8021q`: integer The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4093. Only specified at creation time. 

  * `edge_availability_domain`: Desired availability domain for the attachment. Only available for type PARTNER, at creation time, and can take one of the following values: AVAILABILITY_DOMAIN_ANY AVAILABILITY_DOMAIN_1 AVAILABILITY_DOMAIN_2 For improved reliability, customers should configure a pair of attachments, one per availability domain. The selected availability domain will be provided to the Partner via the pairing key, so that the provisioned circuit will lie in the specified domain. If not specified, the value will default to AVAILABILITY_DOMAIN_ANY. 
  Possible values:
    * PARTNER
    * AVAILABILITY_DOMAIN_ANY
    * AVAILABILITY_DOMAIN_1
    * AVAILABILITY_DOMAIN_2
    * AVAILABILITY_DOMAIN_ANY

  * `candidate_subnets`: Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). Google will attempt to select an unused /29 from the supplied candidate prefix(es). The request will fail if all possible /29s are in use on Google's edge. If not supplied, Google will randomly select an unused /29 from all of link-local space. 

  * `bandwidth`: Provisioned bandwidth capacity for the interconnect attachment. For attachments of type DEDICATED, the user can set the bandwidth. For attachments of type PARTNER, the Google Partner that is operating the interconnect must set the bandwidth. Output only for PARTNER type, mutable for PARTNER_PROVIDER and DEDICATED, and can take one of the following values: BPS_50M: 50 Mbit/s BPS_100M: 100 Mbit/s BPS_200M: 200 Mbit/s BPS_300M: 300 Mbit/s BPS_400M: 400 Mbit/s BPS_500M: 500 Mbit/s BPS_1G: 1 Gbit/s BPS_2G: 2 Gbit/s BPS_5G: 5 Gbit/s BPS_10G: 10 Gbit/s BPS_20G: 20 Gbit/s BPS_50G: 50 Gbit/s 
  Possible values:
    * DEDICATED
    * PARTNER
    * PARTNER
    * PARTNER_PROVIDER
    * DEDICATED
    * BPS_50M
    * 50
    * BPS_100M
    * 100
    * BPS_200M
    * 200
    * BPS_300M
    * 300
    * BPS_400M
    * 400
    * BPS_500M
    * 500
    * BPS_1G
    * 1
    * BPS_2G
    * 2
    * BPS_5G
    * 5
    * BPS_10G
    * 10
    * BPS_20G
    * 20
    * BPS_50G
    * 50

  * `partner_metadata`: object Informational metadata about Partner attachments from Partners to display to customers. Output only for PARTNER type, mutable for PARTNER_PROVIDER, not available for DEDICATED. 

    * `partner_name`: Plain text name of the Partner providing this attachment. This value may be validated to match approved Partner values. 

    * `interconnect_name`: Plain text name of the Interconnect this attachment is connected to, as displayed in the Partner's portal. For instance "Chicago 1". This value may be validated to match approved Partner values. 

    * `portal_url`: URL of the Partner's portal for this Attachment. Partners may customise this to be a deep link to the specific resource on the Partner portal. This value may be validated to match approved Partner values. 

  * `labels`: map (key: string, value: string) Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty. 

    * `string`: 

  * `label_fingerprint`: string (bytes format) A fingerprint for the labels being applied to this InterconnectAttachment, which is essentially a hash of the labels set used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update labels. You must always provide an up-to-date fingerprint hash in order to update or change labels, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve an InterconnectAttachment. A base64-encoded string. 

  * `state`: The current state of this attachment's functionality. Enum values ACTIVE and UNPROVISIONED are shared by DEDICATED/PRIVATE, PARTNER, and PARTNER_PROVIDER interconnect attachments, while enum values PENDING_PARTNER, PARTNER_REQUEST_RECEIVED, and PENDING_CUSTOMER are used for only PARTNER and PARTNER_PROVIDER interconnect attachments. This state can take one of the following values: ACTIVE: The attachment has been turned up and is ready to use. UNPROVISIONED: The attachment is not ready to use yet, because turnup is not complete. PENDING_PARTNER: A newly-created PARTNER attachment that has not yet been configured on the Partner side. PARTNER_REQUEST_RECEIVED: A PARTNER attachment is in the process of provisioning after a PARTNER_PROVIDER attachment was created that references it. PENDING_CUSTOMER: A PARTNER or PARTNER_PROVIDER attachment that is waiting for a customer to activate it. DEFUNCT: The attachment was deleted externally and is no longer functional. This could be because the associated Interconnect was removed, or because the other side of a Partner attachment was deleted. 
  Possible values:
    * ACTIVE
    * UNPROVISIONED
    * DEDICATED
    * PRIVATE
    * PARTNER
    * PARTNER_PROVIDER
    * PENDING_PARTNER
    * PARTNER_REQUEST_RECEIVED
    * PENDING_CUSTOMER
    * PARTNER
    * PARTNER_PROVIDER
    * ACTIVE
    * UNPROVISIONED
    * PENDING_PARTNER
    * A
    * PARTNER
    * PARTNER_REQUEST_RECEIVED
    * A
    * PARTNER
    * PARTNER_PROVIDER
    * PENDING_CUSTOMER
    * A
    * PARTNER
    * PARTNER_PROVIDER
    * DEFUNCT

  * `partner_asn`: string (int64 format) Optional BGP ASN for the router supplied by a Layer 3 Partner if they configured BGP on behalf of the customer. Output only for PARTNER type, input only for PARTNER_PROVIDER, not available for DEDICATED. 

  * `encryption`: Indicates the user-supplied encryption option of this VLAN attachment (interconnectAttachment). Can only be specified at attachment creation for PARTNER or DEDICATED attachments. Possible values are: NONE - This is the default value, which means that the VLAN attachment carries unencrypted traffic. VMs are able to send traffic to, or receive traffic from, such a VLAN attachment. IPSEC - The VLAN attachment carries only encrypted traffic that is encrypted by an IPsec device, such as an HA VPN gateway or third-party IPsec VPN. VMs cannot directly send traffic to, or receive traffic from, such a VLAN attachment. To use HA VPN over Cloud Interconnect, the VLAN attachment must be created with this option. 
  Possible values:
    * VLAN
    * PARTNER
    * DEDICATED
    * NONE
    * VLAN
    * VLAN
    * IPSEC
    * VLAN
    * HA
    * VPN
    * VPN
    * VLAN
    * HA
    * VPN
    * VLAN

  * `ipsec_internal_addresses`: A list of URLs of addresses that have been reserved for the VLAN attachment. Used only for the VLAN attachment that has the encryption option as IPSEC. The addresses must be regional internal IP address ranges. When creating an HA VPN gateway over the VLAN attachment, if the attachment is configured to use a regional internal IP address, then the VPN gateway's IP address is allocated from the IP address range specified here. For example, if the HA VPN gateway's interface 0 is paired to this VLAN attachment, then a regional internal IP address for the VPN gateway interface 0 will be allocated from the IP address specified for this VLAN attachment. If this field is not specified when creating the VLAN attachment, then later on when creating an HA VPN gateway on this VLAN attachment, the HA VPN gateway's IP address is allocated from the regional external IP address pool. 

  * `dataplane_version`: integer Dataplane version for this InterconnectAttachment. This field is only present for Dataplane version 2 and higher. Absence of this field in the API output indicates that the Dataplane is version 1. 

  * `satisfies_pzs`: boolean Reserved for future use. 

  * `stack_type`: The stack type for this interconnect attachment to identify whether the IPv6 feature is enabled or not. If not specified, IPV4_ONLY will be used. This field can be both set at interconnect attachments creation and update interconnect attachment operations. 
  Possible values:
    * IPV4_ONLY

  * `cloud_router_ipv6_address`: IPv6 address + prefix length to be configured on Cloud Router Interface for this interconnect attachment. 

  * `customer_router_ipv6_address`: IPv6 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. 

  * `candidate_ipv6_subnets`: This field is not available. 

  * `cloud_router_ipv6_interface_id`: This field is not available. 

  * `customer_router_ipv6_interface_id`: This field is not available. 

  * `subnet_length`: integer Length of the IPv4 subnet mask. Allowed values:  29 (default)  30  The default value is 29, except for Cross-Cloud Interconnect connections that use an InterconnectRemoteLocation with a constraints.subnetLengthRange.min equal to 30. For example, connections that use an Azure remote location fall into this category. In these cases, the default value is 30, and requesting 29 returns an error. Where both 29 and 30 are allowed, 29 is preferred, because it gives Google Cloud Support more debugging visibility. The default value is 29, except for Cross-Cloud Interconnect connections that use an InterconnectRemoteLocation with a constraints.subnetLengthRange.min equal to 30. For example, connections that use an Azure remote location fall into this category. In these cases, the default value is 30, and requesting 29 returns an error. Where both 29 and 30 are allowed, 29 is preferred, because it gives Google Cloud Support more debugging visibility. 

  * `remote_service`: If the attachment is on a Cross-Cloud Interconnect connection, this field contains the interconnect's remote location service provider. Example values: "Amazon Web Services" "Microsoft Azure". The field is set only for attachments on Cross-Cloud Interconnect connections. Its value is copied from the InterconnectRemoteLocation remoteService field. 

  * `configuration_constraints`: object Constraints for this attachment, if any. The attachment does not work if these constraints are not met. 

    * `bgp_md5`: Whether the attachment's BGP session requires/allows/disallows BGP MD5 authentication. This can take one of the following values: MD5_OPTIONAL, MD5_REQUIRED, MD5_UNSUPPORTED. For example, a Cross-Cloud Interconnect connection to a remote cloud provider that requires BGP MD5 authentication has the interconnectRemoteLocation attachmentConfigurationConstraints.bgp_md5 field set to MD5_REQUIRED, and that property is propagated to the attachment. Similarly, if BGP MD5 is MD5_UNSUPPORTED, an error is returned if MD5 is requested. 
    Possible values:
      * BGP
      * BGP
      * MD5
      * MD5_OPTIONAL
      * MD5_REQUIRED
      * MD5_UNSUPPORTED

    * `bgp_peer_asn_ranges`: object interconnectAttachments.list of ASN ranges that the remote location is known to support. Formatted as an array of inclusive ranges {min: min-value, max: max-value}. For example, [{min: 123, max: 123}, {min: 64512, max: 65534}] allows the peer ASN to be 123 or anything in the range 64512-65534. This field is only advisory. Although the API accepts other ranges, these are the ranges that we recommend. 

      * `min`: integer (uint32 format) 

      * `max`: integer (uint32 format) 


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
