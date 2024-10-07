+++

title = "google_apigee_organization_instance_attachment Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_apigee_organization_instance_attachment"
identifier = "inspec/resources/gcp/google_apigee_organization_instance_attachment Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization_instance_attachment` InSpec audit resource to test the properties of a test a Google OrganizationInstanceAttachment.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_apigee_organization_instance_attachment` is used to test a Google OrganizationInstanceAttachment resource

## Examples
```
describe google_apigee_organization_instance_attachment(name: ' value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('environment') { should cmp 'value_environment' }
	its('created_at') { should cmp 'value_createdat' }

end

describe google_apigee_organization_instance_attachment(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_apigee_organization_instance_attachment` resource:

## Properties
Properties that can be accessed from the `google_apigee_organization_instance_attachment` resource:


  * `name`: Output only. ID of the attachment.

  * `environment`: ID of the attached environment.

  * `created_at`: Output only. Time the attachment was created in milliseconds since epoch.


## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
