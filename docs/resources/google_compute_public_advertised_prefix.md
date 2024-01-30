---
title: About the google_compute_public_advertised_prefix resource
platform: gcp
---

## Syntax
A `google_compute_public_advertised_prefix` is used to test a Google PublicAdvertisedPrefix resource

## Examples
```
describe google_compute_v1_public_advertised_prefix(project: 'chef-gcp-inspec', publicAdvertisedPrefix: ' ') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('ip_cidr_range') { should cmp 'value_ipcidrrange' }
	its('dns_verification_ip') { should cmp 'value_dnsverificationip' }
	its('shared_secret') { should cmp 'value_sharedsecret' }
	its('status') { should cmp 'value_status' }
	its('pdp_scope') { should cmp 'value_pdpscope' }
	its('fingerprint') { should cmp 'value_fingerprint' }
	its('byoip_api_version') { should cmp 'value_byoipapiversion' }

end

describe google_compute_v1_public_advertised_prefix(project: 'chef-gcp-inspec', publicAdvertisedPrefix: ' ') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_public_advertised_prefix` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#publicAdvertisedPrefix for public advertised prefixes.

  * `id`: [Output Only] The unique identifier for the resource type. The server generates this identifier.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `ip_cidr_range`: The address range, in CIDR format, represented by this public advertised prefix.

  * `dns_verification_ip`: The address to be used for reverse DNS verification.

  * `shared_secret`: [Output Only] The shared secret to be used for reverse DNS verification.

  * `status`: The status of the public advertised prefix. Possible values include: - `INITIAL`: RPKI validation is complete. - `PTR_CONFIGURED`: User has configured the PTR. - `VALIDATED`: Reverse DNS lookup is successful. - `REVERSE_DNS_LOOKUP_FAILED`: Reverse DNS lookup failed. - `PREFIX_CONFIGURATION_IN_PROGRESS`: The prefix is being configured. - `PREFIX_CONFIGURATION_COMPLETE`: The prefix is fully configured. - `PREFIX_REMOVAL_IN_PROGRESS`: The prefix is being removed. 
  Possible values:
    * ANNOUNCED_TO_INTERNET
    * INITIAL
    * PREFIX_CONFIGURATION_COMPLETE
    * PREFIX_CONFIGURATION_IN_PROGRESS
    * PREFIX_REMOVAL_IN_PROGRESS
    * PTR_CONFIGURED
    * READY_TO_ANNOUNCE
    * REVERSE_DNS_LOOKUP_FAILED
    * VALIDATED

  * `pdp_scope`: Specifies how child public delegated prefix will be scoped. It could be one of following values: - `REGIONAL`: The public delegated prefix is regional only. The provisioning will take a few minutes. - `GLOBAL`: The public delegated prefix is global only. The provisioning will take ~4 weeks. - `GLOBAL_AND_REGIONAL` [output only]: The public delegated prefixes is BYOIP V1 legacy prefix. This is output only value and no longer supported in BYOIP V2. 
  Possible values:
    * GLOBAL
    * GLOBAL_AND_REGIONAL
    * REGIONAL

  * `public_delegated_prefixs`: [Output Only] The list of public delegated prefixes that exist for this public advertised prefix.

    * `name`: The name of the public delegated prefix

    * `region`: The region of the public delegated prefix if it is regional. If absent, the prefix is global.

    * `project`: The project number of the public delegated prefix

    * `status`: The status of the public delegated prefix. Possible values are: INITIALIZING: The public delegated prefix is being initialized and addresses cannot be created yet. ANNOUNCED: The public delegated prefix is active.

    * `ip_range`: The IP address range of the public delegated prefix

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a new PublicAdvertisedPrefix. An up-to-date fingerprint must be provided in order to update the PublicAdvertisedPrefix, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve a PublicAdvertisedPrefix.

  * `byoip_api_version`: [Output Only] The version of BYOIP API.
  Possible values:
    * V1
    * V2


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
