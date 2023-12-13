---
title: About the google_apigee_organization_api_revision resource
platform: gcp
---

## Syntax
A `google_apigee_organization_api_revision` is used to test a Google OrganizationApiRevision resource

## Examples
```
describe google_apigee_organization_api_revision(name: ' value_name') do
	it { should exist }
	its('content_type') { should cmp 'value_contenttype' }
	its('data') { should cmp 'value_data' }

end

describe google_apigee_organization_api_revision(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_apigee_organization_api_revision` resource:


  * `extensions`: Application specific response metadata. Must be set in the first response for streaming APIs.

  * `content_type`: The HTTP Content-Type header value specifying the content type of the body.

  * `data`: The HTTP request/response body as raw binary.


## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
