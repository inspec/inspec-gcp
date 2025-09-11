+++
title = "google_runtime_config_variable resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_runtime_config_variable"
identifier = "inspec/resources/gcp/google_runtime_config_variable resource"
parent = "inspec/resources/gcp"
+++

Use the `google_runtime_config_variable` InSpec audit resource to to test a Google Cloud Variable resource.

## Examples

```ruby
describe google_runtime_config_variable(project: 'chef-gcp-inspec', config: 'inspec-gcp-runtime-config', name: 'prod-variables/hostname') do
  it { should exist }
  its('text') { should cmp 'example.com' }
end

describe google_runtime_config_variable(project: 'chef-gcp-inspec', config: 'inspec-gcp-runtime-config', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_runtime_config_variable` resource:


  * `value`: The binary value of the variable. Either this or `text` can be set.

  * `text`: The string value of the variable. Either this or `value` can be set.

  * `name`: The name of the variable resource.

  * `config`: The name of the runtime config that this variable belongs to.


## GCP permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
