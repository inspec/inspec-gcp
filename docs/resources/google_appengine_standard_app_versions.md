---
title: About the google_appengine_standard_app_versions resource
platform: gcp
---

## Syntax
A `google_appengine_standard_app_versions` is used to test a Google StandardAppVersion resource

## Examples
```

describe google_appengine_standard_app_versions(project: 'chef-gcp-inspec', location: 'europe-west2',service: 'default') do
  its('runtimes') { should include 'nodejs10' }
end
```

## Properties
Properties that can be accessed from the `google_appengine_standard_app_versions` resource:

See [google_appengine_standard_app_version.md](google_appengine_standard_app_version.md) for more detailed information
  * `names`: an array of `google_appengine_standard_app_version` name
  * `version_ids`: an array of `google_appengine_standard_app_version` version_id
  * `runtimes`: an array of `google_appengine_standard_app_version` runtime
  * `threadsaves`: an array of `google_appengine_standard_app_version` threadsafe
  * `instance_classes`: an array of `google_appengine_standard_app_version` instance_class

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
