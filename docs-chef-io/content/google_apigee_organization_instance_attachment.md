+++
title = "google_apigee_organization_instance_attachment resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_apigee_organization_instance_attachment"
identifier = "inspec/resources/gcp/google_apigee_organization_instance_attachment resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization_instance_attachment` InSpec audit resource to test the properties of a Google Cloud OrganizationInstanceAttachment resource.

## Examples

```ruby
describe google_apigee_organization_instance_attachment(parent:'value_parent', name:'value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('environment') { should cmp 'value_environment' }
	its('created_at') { should cmp 'value_createdat' }
end

describe google_apigee_organization_instance_attachment(parent:'value_parent',name: "does-not-exit") do
	it { should_not exist }
end
```

## Parameters

Parameters that can be accessed from the `google_apigee_organization_instance_attachment` resource:

## Properties

Properties that can be accessed from the `google_apigee_organization_instance_attachment` resource:


  * `name`: Output only. ID of the attachment.

  * `environment`: ID of the attached environment.

  * `created_at`: Output only. Time the attachment was created in milliseconds since epoch.


## GCP permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
