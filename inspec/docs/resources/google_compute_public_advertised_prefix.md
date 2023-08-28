---
title: About the google_compute_public_advertised_prefix resource
platform: gcp
---

## Syntax
A `google_compute_public_advertised_prefix` is used to test a Google PublicAdvertisedPrefix resource

## Examples
```
      describe google_compute_public_advertised_prefix(project: 'chef-gcp-inspec', name: ' ') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_compute_public_advertised_prefix` resource:


  * `kind`: Type of the resource. Always compute#publicAdvertisedPrefix for public advertised prefixes. 

  * `id`: string (uint64 format) The unique identifier for the resource type. The server generates this identifier. 

  * `creation_timestamp`: Creation timestamp in RFC3339 text format. 

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. 

  * `description`: An optional description of this resource. Provide this property when you create the resource. 

  * `self_link`: Server-defined URL for the resource. 

  * `ip_cidr_range`: The address range, in CIDR format, represented by this public advertised prefix. 

  * `dns_verification_ip`: The address to be used for reverse DNS verification. 

  * `shared_secret`: The shared secret to be used for reverse DNS verification. 

  * `status`: The status of the public advertised prefix. Possible values include:  INITIAL: RPKI validation is complete. PTR_CONFIGURED: User has configured the PTR. VALIDATED: Reverse DNS lookup is successful. REVERSE_DNS_LOOKUP_FAILED: Reverse DNS lookup failed. PREFIX_CONFIGURATION_IN_PROGRESS: The prefix is being  configured. PREFIX_CONFIGURATION_COMPLETE: The prefix is fully configured. PREFIX_REMOVAL_IN_PROGRESS: The prefix is being removed. 
  Possible values:
    * INITIAL
    * PTR_CONFIGURED
    * VALIDATED
    * REVERSE_DNS_LOOKUP_FAILED
    * PREFIX_CONFIGURATION_IN_PROGRESS
    * PREFIX_CONFIGURATION_COMPLETE
    * PREFIX_REMOVAL_IN_PROGRESS

  * `public_delegated_prefixs`: object The list of public delegated prefixes that exist for this public advertised prefix. 

    * `name`: The name of the public delegated prefix 

    * `region`: The region of the public delegated prefix if it is regional. If absent, the prefix is global. 

    * `project`: The project number of the public delegated prefix 

    * `status`: The status of the public delegated prefix. Possible values are:  INITIALIZING: The public delegated prefix is being initialized and  addresses cannot be created yet.  ANNOUNCED: The public delegated prefix is active. 

    * `ip_range`: The IP address range of the public delegated prefix 

  * `fingerprint`: string (bytes format) Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a new PublicAdvertisedPrefix. An up-to-date fingerprint must be provided in order to update the PublicAdvertisedPrefix, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve a PublicAdvertisedPrefix. A base64-encoded string. 


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
