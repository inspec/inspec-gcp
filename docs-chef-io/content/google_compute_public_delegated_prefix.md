+++
title = "google_compute_public_delegated_prefix resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_public_delegated_prefix"
identifier = "inspec/resources/gcp/google_compute_public_delegated_prefix resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_public_delegated_prefix` InSpec audit resource to to test a Google Cloud PublicDelegatedPrefix resource.

## Examples

```ruby
describe google_compute_public_delegated_prefix(project: 'chef-gcp-inspec', region: 'us-east1-b', name: 'test') do
  it { should exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_public_delegated_prefix` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `ip_cidr_range`: The IPv4 address range, in CIDR format, represented by this public delegated prefix.

  * `parent_prefix`: The value of requestId if you provided it in the request. Not present otherwise.

  * `is_live_migration`: If true, the prefix will be live migrated.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a new PublicDelegatedPrefix. An up-to-date fingerprint must be provided in order to update the PublicDelegatedPrefix, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve a PublicDelegatedPrefix. A base64-encoded string.

  * `status`: The status of the public delegated prefix, which can be one of following values: * INITIALIZING The public delegated prefix is being initialized and addresses cannot be created yet. * READY_TO_ANNOUNCE The public delegated prefix is a live migration prefix and is active. * ANNOUNCED The public delegated prefix is active. * DELETING The public delegated prefix is being deprovsioned.
  Possible values:
    * INITIALIZING
    * READY_TO_ANNOUNCE
    * ANNOUNCED
    * DELETING


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
