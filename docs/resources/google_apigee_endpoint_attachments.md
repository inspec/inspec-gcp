+++

title = "google_apigee_endpoint_attachments Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_apigee_endpoint_attachments"
identifier = "inspec/resources/gcp/google_apigee_endpoint_attachments Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_endpoint_attachments` InSpec audit resource to test the properties of a test a Google EndpointAttachment.

## Syntax
A `google_apigee_endpoint_attachments` is used to test a Google EndpointAttachment resource

## Examples
```
  describe google_apigee_endpoint_attachments() do
    it { should exist }
    its('hosts') { should include 'value_host' }
    its('connection_states') { should include 'value_connectionstate' }
    its('service_attachments') { should include 'value_serviceattachment' }
    its('locations') { should include 'value_location' }
    its('names') { should include 'value_name' }
    its('states') { should include 'value_state' }
  end
```

## Parameters
Properties that can be accessed from the `google_apigee_endpoint_attachments` resource:

See [google_apigee_endpoint_attachment.md](google_apigee_endpoint_attachment.md) for more detailed information
* `hosts`: an array of `google_apigee_endpoint_attachment` host
* `connection_states`: an array of `google_apigee_endpoint_attachment` connection_state
* `service_attachments`: an array of `google_apigee_endpoint_attachment` service_attachment
* `locations`: an array of `google_apigee_endpoint_attachment` location
* `names`: an array of `google_apigee_endpoint_attachment` name
* `states`: an array of `google_apigee_endpoint_attachment` state
## Properties
Properties that can be accessed from the `google_apigee_endpoint_attachments` resource:

See [google_apigee_endpoint_attachment.md](google_apigee_endpoint_attachment.md) for more detailed information
* `hosts`: an array of `google_apigee_endpoint_attachment` host
* `connection_states`: an array of `google_apigee_endpoint_attachment` connection_state
* `service_attachments`: an array of `google_apigee_endpoint_attachment` service_attachment
* `locations`: an array of `google_apigee_endpoint_attachment` location
* `names`: an array of `google_apigee_endpoint_attachment` name
* `states`: an array of `google_apigee_endpoint_attachment` state

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
