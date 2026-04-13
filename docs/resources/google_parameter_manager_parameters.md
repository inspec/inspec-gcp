---
title: About the google_parameter_manager_parameters resource
platform: gcp
---

## Syntax
A `google_parameter_manager_parameters` is used to test a Google Parameter resource

## Examples
```
describe google_parameter_manager_parameters(parent: 'projects/<project_id>/locations/global') do
	it { should exist }
end
describe google_parameter_manager_parameters(parent: 'projects/<project_id>/locations/<location_id>', region: <location_id>) do
	it { should exist }
end
```

## Properties
Properties that can be accessed from the `google_parameter_manager_parameters` resource:

See [google_parameter_manager_parameter.md](google_parameter_manager_parameter.md) for more detailed information
  * `names`: an array of `google_parameter_manager_parameter` name
  * `create_times`: an array of `google_parameter_manager_parameter` create_time
  * `update_times`: an array of `google_parameter_manager_parameter` update_time
  * `formats`: an array of `google_parameter_manager_parameter` format
  * `labels`: an array of `google_parameter_manager_parameter` label
  * `policy_members`: an array of `google_parameter_manager_parameter` policy_member
  * `kms_keys`: an array of `google_parameter_manager_parameter` kms_key

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Parameter Manager API](https://console.cloud.google.com/apis/library/parametermanager.googleapis.com/) is enabled for the current project.
