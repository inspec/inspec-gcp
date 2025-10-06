+++
title = "google_kms_ekm_connections resource"

draft = false


[menu.gcp]
title = "google_kms_ekm_connections"
identifier = "inspec/resources/gcp/google_kms_ekm_connections resource"
parent = "inspec/resources/gcp"
+++

Use the `google_kms_ekm_connections` InSpec audit resource to to test a Google Cloud EkmConnection resource.

## Examples

```ruby
describe google_kms_ekm_connections(project: 'chef-gcp-inspec', location: 'europe-west2') do
  it { should exist }
end
```

## Properties

Properties that can be accessed from the `google_kms_ekm_connections` resource:

See [google_kms_ekm_connection](google_kms_ekm_connection) for more detailed information.

  * `names`: an array of `google_kms_ekm_connection` name
  * `create_times`: an array of `google_kms_ekm_connection` create_time
  * `service_resolvers`: an array of `google_kms_ekm_connection` service_resolvers
  * `locations`: an array of `google_kms_ekm_connection` location

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
