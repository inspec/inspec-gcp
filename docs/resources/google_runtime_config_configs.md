+++
title = "google_runtime_config_configs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_runtime_config_configs"
identifier = "inspec/resources/gcp/google_runtime_config_configs Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_runtime_config_configs` InSpec audit resource to to test a Google Cloud Config resource.

## Examples

```ruby
describe google_runtime_config_configs(project: 'chef-gcp-inspec') do
  its('descriptions') { should include 'My runtime configurations' }
end
```

## Properties

Properties that can be accessed from the `google_runtime_config_configs` resource:

See [google_runtime_config_config](google_runtime_config_config) for more detailed information.

  * `descriptions`: an array of `google_runtime_config_config` description
  * `names`: an array of `google_runtime_config_config` name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
