+++
title = "google_runtime_config_config resource"

draft = false


[menu.gcp]
title = "google_runtime_config_config"
identifier = "inspec/resources/gcp/google_runtime_config_config resource"
parent = "inspec/resources/gcp"
+++

Use the `google_runtime_config_config` InSpec audit resource to to test a Google Cloud Config resource.

## Examples

```ruby
describe google_runtime_config_config(project: 'chef-gcp-inspec', name: 'inspec-gcp-runtime-config') do
  it { should exist }
  its('description') { should cmp 'My runtime configurations' }
end

describe google_runtime_config_config(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_runtime_config_config` resource:


  * `description`: The description to associate with the runtime config.

  * `name`: The name of the runtime config.


## GCP permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
