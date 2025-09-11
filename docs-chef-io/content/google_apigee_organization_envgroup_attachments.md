+++
title = "google_apigee_organization_envgroup_attachments resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_apigee_organization_envgroup_attachments"
identifier = "inspec/resources/gcp/google_apigee_organization_envgroup_attachments resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization_envgroup_attachments` InSpec audit resource to to test a Google Cloud OrganizationEnvgroupAttachment resource.

## Examples

```
    describe google_apigee_organization_envgroup_attachments(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_apigee_organization_envgroup_attachments` resource:

See [google_apigee_organization_envgroup_attachment](google_apigee_organization_envgroup_attachment) for more detailed information.

  * `created_ats`: an array of `google_apigee_organization_envgroup_attachment` created_at
  * `environments`: an array of `google_apigee_organization_envgroup_attachment` environment
  * `environment_group_ids`: an array of `google_apigee_organization_envgroup_attachment` environment_group_id
  * `names`: an array of `google_apigee_organization_envgroup_attachment` name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
