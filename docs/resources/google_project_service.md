---
title: About the google_project_service resource
platform: gcp
---

## Syntax
A `google_project_service` is used to test a Google Service resource

## Examples
```
describe google_project_service(project: 'chef-gcp-inspec', name: 'maps-android-backend.googleapis.com') do
  it { should exist }
  its('state') { should cmp "ENABLED" }
end
```

## Properties
Properties that can be accessed from the `google_project_service` resource:


  * `name`: The resource name of the service

  * `parent`: The name of the parent of this service. For example: `projects/123`

  * `state`: Whether or not the service has been enabled for use by the consumer.


## GCP Permissions

Ensure the [Service Usage API](https://console.cloud.google.com/apis/library/serviceusage.googleapis.com/) is enabled for the current project.
