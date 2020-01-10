---
title: About the google_kms_key_rings resource
platform: gcp
---

## Syntax
A `google_kms_key_rings` is used to test a Google KeyRing resource

## Examples
```
describe google_kms_key_rings(project: 'chef-gcp-inspec', location: 'europe-west2') do
  its('key_ring_names'){ should include 'kms-key-ring' }
end

describe.one do
  google_kms_key_rings(project: 'chef-gcp-inspec', location: 'europe-west2').key_ring_urls do |url|
    describe url do
      it { should match 'kms-key-ring' }
    end
  end
end
```

## Properties
Properties that can be accessed from the `google_kms_key_rings` resource:

See [google_kms_key_ring.md](google_kms_key_ring.md) for more detailed information
  * `create_times`: an array of `google_kms_key_ring` create_time
  * `key_ring_urls`: an array of `google_kms_key_ring` key_ring_url
  * `locations`: an array of `google_kms_key_ring` location

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
