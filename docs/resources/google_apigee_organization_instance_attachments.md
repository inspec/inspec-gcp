+++
title = "google_apigee_organization_instance_attachments Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_apigee_organization_instance_attachments"
identifier = "inspec/resources/gcp/google_apigee_organization_instance_attachments Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization_instance_attachments` InSpec audit resource to test the properties of a Google Cloud OrganizationInstanceAttachment resource.

## Examples

```ruby
  describe google_apigee_organization_instance_attachments(parent: 'value_parent') do
    it { should exist }
    its('names') { should include 'value_name' }
	  its('environments') { should include 'value_environment' }
	  its('created_ats') { should include 'value_createdat' }
  end
```

## Parameters

Parameters that can be accessed from the `google_apigee_organization_instance_attachments` resource:

See [google_apigee_organization_instance_attachment](google_apigee_organization_instance_attachment) for more detailed information.

* `names`: an array of `google_apigee_organization_instance_attachment` name
* `environments`: an array of `google_apigee_organization_instance_attachment` environment
* `created_ats`: an array of `google_apigee_organization_instance_attachment` created_at

## Properties

Properties that can be accessed from the `google_apigee_organization_instance_attachments` resource:

See [google_apigee_organization_instance_attachment](google_apigee_organization_instance_attachment) for more detailed information.

* `names`: an array of `google_apigee_organization_instance_attachment` name
* `environments`: an array of `google_apigee_organization_instance_attachment` environment
* `created_ats`: an array of `google_apigee_organization_instance_attachment` created_at

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
