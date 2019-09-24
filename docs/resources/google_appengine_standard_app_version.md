---
title: About the google_appengine_standard_app_version resource
platform: gcp
---

## Syntax
A `google_appengine_standard_app_version` is used to test a Google StandardAppVersion resource

## Examples
```

describe google_appengine_standard_app_version(project: 'chef-gcp-inspec', location: 'europe-west2', version_id: 'v2', service: 'default') do
  it { should exist }
  its('version_id') { should eq 'v2' }
  its('runtime') { should eq 'nodejs10' }
end
```

## Properties
Properties that can be accessed from the `google_appengine_standard_app_version` resource:


  * `name`: Full path to the Version resource in the API. Example, "v1".

  * `version_id`: Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". 

  * `runtime`: Desired runtime. Example python27.

  * `threadsafe`: Whether multiple requests can be dispatched to this version at once.


## GCP Permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
