+++
title = "google_kms_ekm_connections resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_kms_ekm_connections"
identifier = "inspec/resources/gcp/google_kms_ekm_connections Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_kms_ekm_connections` is used to test a Google EkmConnection resource

## Examples
```
describe google_kms_ekm_connections(project: 'chef-gcp-inspec', location: 'europe-west2') do
  it { should exist }
end
```

## Properties
Properties that can be accessed from the `google_kms_ekm_connections` resource:

See [google_kms_ekm_connection.md](google_kms_ekm_connection.md) for more detailed information
  * `names`: an array of `google_kms_ekm_connection` name
  * `create_times`: an array of `google_kms_ekm_connection` create_time
  * `service_resolvers`: an array of `google_kms_ekm_connection` service_resolvers
  * `locations`: an array of `google_kms_ekm_connection` location

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
