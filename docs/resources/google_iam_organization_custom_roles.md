+++
title = "google_iam_organization_custom_roles resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_iam_organization_custom_roles"
identifier = "inspec/resources/gcp/google_iam_organization_custom_roles Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_iam_organization_custom_roles` InSpec audit resource to to test a Google Cloud OrganizationCustomRole resource.

## Examples

```ruby
describe google_iam_organization_custom_roles(org_id: '190694428152') do
  its('names') { should include "organizations/123456/roles/role-id" }
end
```

## Properties

Properties that can be accessed from the `google_iam_organization_custom_roles` resource:

See [google_iam_organization_custom_role](google_iam_organization_custom_role) for more detailed information.

  * `names`: an array of `google_iam_organization_custom_role` name
  * `titles`: an array of `google_iam_organization_custom_role` title
  * `descriptions`: an array of `google_iam_organization_custom_role` description
  * `included_permissions`: an array of `google_iam_organization_custom_role` included_permissions
  * `stages`: an array of `google_iam_organization_custom_role` stage
  * `deleteds`: an array of `google_iam_organization_custom_role` deleted

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
