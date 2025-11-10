---
title: About the google_parameter_manager_parameter_versions resource
platform: gcp
---

## Syntax
A `google_parameter_manager_parameter_versions` is used to test a Google Parameter Version resource

## Examples
```
describe google_parameter_manager_parameter_versions(parent: 'projects/<project_id>/locations/global/parameters/<parameter_id>') do
	it { should exist }
end
describe google_parameter_manager_parameter_versions(parent: "does_not_exit") do
	it { should_not exist }
end
describe google_parameter_manager_parameter_versions(parent: 'projects/<project_id>/locations/<location_id>/parameters/<parameter_id>', region: <location_id>) do
	it { should exist }
end
describe google_parameter_manager_parameter_versions(parent: "does_not_exit", region: <location_id>) do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_parameter_manager_parameter_versions` resource:

See [google_parameter_manager_parameter_version.md](google_parameter_manager_parameter_version.md) for more detailed information
  * `names`: an array of `google_parameter_manager_parameter_version` name
  * `create_times`: an array of `google_parameter_manager_parameter_version` create_time
  * `update_times`: an array of `google_parameter_manager_parameter_version` update_time
  * `disabled_values`: an array of `google_parameter_manager_parameter_version` disabled
  * `kms_key_versions`: an array of `google_parameter_manager_parameter_version` kms_key_version

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Parameter Manager API](https://console.cloud.google.com/apis/library/parametermanager.googleapis.com/) is enabled for the current project.
