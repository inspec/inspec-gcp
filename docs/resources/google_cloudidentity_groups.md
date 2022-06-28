---
title: About the google_cloudidentity_groups resource
platform: gcp
---

## Syntax
A `google_cloudidentity_groups` is used to test a Google Group resource

## Examples
```
describe google_cloudidentity_groups(project: 'chef-gcp-inspec') do
it { should exist }
it { should be_up }
end
```

## Properties
Properties that can be accessed from the `google_cloudidentity_groups` resource:

See [google_cloudidentity_group.md](google_cloudidentity_group.md) for more detailed information
  * `names`: an array of `google_cloudidentity_group` name
  * `group_keys`: an array of `google_cloudidentity_group` group_key
  * `parents`: an array of `google_cloudidentity_group` parent
  * `display_names`: an array of `google_cloudidentity_group` display_name
  * `descriptions`: an array of `google_cloudidentity_group` description
  * `create_times`: an array of `google_cloudidentity_group` create_time
  * `update_times`: an array of `google_cloudidentity_group` update_time
  * `labels`: an array of `google_cloudidentity_group` labels
  * `initial_group_configs`: an array of `google_cloudidentity_group` initial_group_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Identity API](https://console.cloud.google.com/apis/api/cloudidentity.googleapis.com/overview) is enabled for the current project.
