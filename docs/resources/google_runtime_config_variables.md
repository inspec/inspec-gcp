---
title: About the google_runtime_config_variables resource
platform: gcp
---

## Syntax
A `google_runtime_config_variables` is used to test a Google Variable resource

## Examples
```
describe google_runtime_config_variables(project: 'chef-gcp-inspec', config: 'inspec-gcp-runtime-config') do
  its('texts') { should include 'example.com' }
end
```

## Properties
Properties that can be accessed from the `google_runtime_config_variables` resource:

See [google_runtime_config_variable.md](google_runtime_config_variable.md) for more detailed information
  * `values`: an array of `google_runtime_config_variable` value
  * `texts`: an array of `google_runtime_config_variable` text
  * `names`: an array of `google_runtime_config_variable` name
  * `configs`: an array of `google_runtime_config_variable` config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
