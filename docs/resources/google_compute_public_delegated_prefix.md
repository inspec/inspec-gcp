---
title: About the google_compute_public_delegated_prefix resource
platform: gcp
---

## Syntax
A `google_compute_public_delegated_prefix` is used to test a Google PublicDelegatedPrefix resource

## Examples
```
      describe google_compute_public_delegated_prefix(project: 'chef-gcp-inspec', region: ' ', publicDelegatedPrefix: ' ') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_compute_public_delegated_prefix` resource:


  * `kind`: Type of the resource. Always compute#publicDelegatedPrefix for public delegated prefixes. 

  * `id`: string (uint64 format) The unique identifier for the resource type. The server generates this identifier. 

  * `creation_timestamp`: Creation timestamp in RFC3339 text format. 

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. 

  * `description`: An optional description of this resource. Provide this property when you create the resource. 

  * `self_link`: Server-defined URL for the resource. 

  * `region`: URL of the region where the public delegated prefix resides. This field applies only to the region resource. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body. 

  * `ip_cidr_range`: The IP address range, in CIDR format, represented by this public delegated prefix. 

  * `status`: The status of the public delegated prefix, which can be one of following values:  INITIALIZING The public delegated prefix is being initialized and  addresses cannot be created yet. READY_TO_ANNOUNCE The public delegated prefix is a live migration  prefix and is active. ANNOUNCED The public delegated prefix is active. DELETING The public delegated prefix is being deprovsioned. 
  Possible values:
    * INITIALIZING
    * READY_TO_ANNOUNCE
    * ANNOUNCED
    * DELETING

  * `parent_prefix`: The URL of parent prefix. Either PublicAdvertisedPrefix or PublicDelegatedPrefix. 

  * `public_delegated_sub_prefixs`: object The list of sub public delegated prefixes that exist for this public delegated prefix. 

    * `name`: The name of the sub public delegated prefix. 

    * `description`: An optional description of this resource. Provide this property when you create the resource. 

    * `region`: The region of the sub public delegated prefix if it is regional. If absent, the sub prefix is global. 

    * `status`: The status of the sub public delegated prefix. 
    Possible values:
      * VALUE_1

    * `ip_cidr_range`: The IP address range, in CIDR format, represented by this sub public delegated prefix. 

    * `delegatee_project`: Name of the project scoping this PublicDelegatedSubPrefix. 

    * `is_address`: boolean Whether the sub prefix is delegated to create Address resources in the delegatee project. 

  * `is_live_migration`: boolean If true, the prefix will be live migrated. 

  * `fingerprint`: string (bytes format) Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a new PublicDelegatedPrefix. An up-to-date fingerprint must be provided in order to update the PublicDelegatedPrefix, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve a PublicDelegatedPrefix. A base64-encoded string. 


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
