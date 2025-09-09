+++
title = "google_kms_locations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_kms_locations"
identifier = "inspec/resources/gcp/google_kms_locations Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_kms_locations` InSpec audit resource to to test a Google Cloud Location resource.

## Examples

```ruby
describe google_kms_locations(project: 'chef-gcp-inspec') do
  it { should exist }
end
```

## Properties

Properties that can be accessed from the `google_kms_locations` resource:

See [google_kms_location](google_kms_location) for more detailed information.

  * `names`: an array of `google_kms_location` name
  * `location_ids`: an array of `google_kms_location` location_id
  * `display_names`: an array of `google_kms_location` display_name
  * `locations`: an array of `google_kms_location` location

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
