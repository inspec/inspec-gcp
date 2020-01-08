---
title: About the google_resourcemanager_project_iam_binding resource
platform: gcp
---

## Syntax
A `google_resourcemanager_project_iam_binding` is used to test a Google Project Iam Bindings

## Examples
```
describe google_resourcemanager_project_iam_binding(project_id: "projectId", role: "roles/editor") do
  it { should exist }
  its('members') { should include 'user:testuser@example.com' }
end
```

## Properties
Properties that can be accessed from the `google_resourcemanager_project_iam_binding` resource:

  * `role`: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

  * `members`: Specifies the identities requesting access for a Cloud Platform resource.


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
