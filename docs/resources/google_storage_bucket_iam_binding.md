---
title: About the google_storage_bucket_iam_binding resource
platform: gcp
---

## Syntax
A `google_storage_bucket_iam_binding` is used to test a Google Bucket Iam Bindings

## Examples
```
describe google_storage_bucket_iam_binding(name: "name", role: "roles/editor") do
  it { should exist }
  its('members') { should include 'user:testuser@example.com' }
end
```

## Properties
Properties that can be accessed from the `google_storage_bucket_iam_binding` resource:

  * `role`: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

  * `members`: Specifies the identities requesting access for a Cloud Platform resource.


## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
