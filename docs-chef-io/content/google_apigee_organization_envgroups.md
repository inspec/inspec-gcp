+++
title = "google_apigee_organization_envgroups resource"

draft = false


[menu.gcp]
title = "google_apigee_organization_envgroups"
identifier = "inspec/resources/gcp/google_apigee_organization_envgroups resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization_envgroups` InSpec audit resource to to test a Google Cloud OrganizationEnvgroup resource.

## Examples

```
    describe google_apigee_organization_envgroups(parent: 'value_parent') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_apigee_organization_envgroups` resource:

See [google_apigee_organization_envgroup](google_apigee_organization_envgroup) for more detailed information.

  * `names`: an array of `google_apigee_organization_envgroup` name
  * `last_modified_ats`: an array of `google_apigee_organization_envgroup` last_modified_at
  * `hostnames`: an array of `google_apigee_organization_envgroup` hostnames
  * `states`: an array of `google_apigee_organization_envgroup` state
  * `created_ats`: an array of `google_apigee_organization_envgroup` created_at

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
