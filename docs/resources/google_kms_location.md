+++
title = "google_kms_location resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_kms_location"
identifier = "inspec/resources/gcp/google_kms_location Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_kms_location` InSpec audit resource to to test a Google Cloud Location resource.

## Examples

```ruby
describe google_kms_location(project: 'chef-gcp-inspec', location: 'europe-west2') do
  it { should exist }
end

describe google_kms_location(project: 'chef-gcp-inspec', location: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_kms_location` resource:


  * `name`: Resource name for the location, which may vary between implementations. For example: projects/example-project/locations/us-east1

  * `location_id`: The canonical id for this location. For example: "us-east1".

  * `display_name`: The friendly name for this location, typically a nearby city name. For example, "Tokyo".

  * `location`: Resource name for the location.


## GCP permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
