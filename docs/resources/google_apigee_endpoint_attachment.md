+++

title = "google_apigee_endpoint_attachment Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_apigee_endpoint_attachment"
identifier = "inspec/resources/gcp/google_apigee_endpoint_attachment Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_endpoint_attachment` InSpec audit resource to test the properties of a test a Google EndpointAttachment.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_apigee_endpoint_attachment` is used to test a Google EndpointAttachment resource

## Examples
```
describe google_apigee_endpoint_attachment(name: ' value_name') do
	it { should exist }
	its('host') { should cmp 'value_host' }
	its('connection_state') { should cmp 'value_connectionstate' }
	its('service_attachment') { should cmp 'value_serviceattachment' }
	its('location') { should cmp 'value_location' }
	its('name') { should cmp 'value_name' }
	its('state') { should cmp 'value_state' }

end

describe google_apigee_endpoint_attachment(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_apigee_endpoint_attachment` resource:

## Properties
Properties that can be accessed from the `google_apigee_endpoint_attachment` resource:


  * `host`: Output only. Host that can be used in either the HTTP target endpoint directly or as the host in target server.

  * `connection_state`: Output only. State of the endpoint attachment connection to the service attachment.
  Possible values:
    * CONNECTION_STATE_UNSPECIFIED
    * UNAVAILABLE
    * PENDING
    * ACCEPTED
    * REJECTED
    * CLOSED
    * FROZEN
    * NEEDS_ATTENTION

  * `service_attachment`: Format: projects/*/regions/*/serviceAttachments/*

  * `location`: Required. Location of the endpoint attachment.

  * `name`: Name of the endpoint attachment. Use the following structure in your request: `organizations/{org}/endpointAttachments/{endpoint_attachment}`

  * `state`: Output only. State of the endpoint attachment. Values other than `ACTIVE` mean the resource is not ready to use.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * DELETING
    * UPDATING


## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
