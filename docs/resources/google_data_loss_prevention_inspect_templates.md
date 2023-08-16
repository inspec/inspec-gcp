---
title: About the google_data_loss_prevention_inspect_templates resource
platform: gcp
---

## Syntax
A `google_data_loss_prevention_inspect_templates` is used to test a Google InspectTemplate resource

## Examples
```


describe google_data_loss_prevention_inspect_templates(project: 'chef-gcp-inspec', location: 'us-east-2') do
it { should exist }
its('names') { should include 'i-inspec-gcp-dlp' }
its('types') { should include 'INSPECT_JOB' }
its('states') { should include 'ACTIVE' }
end
```

## Properties
Properties that can be accessed from the `google_data_loss_prevention_inspect_templates` resource:

See [google_data_loss_prevention_inspect_template.md](google_data_loss_prevention_inspect_template.md) for more detailed information
  * `names`: an array of `google_data_loss_prevention_inspect_template` name
  * `descriptions`: an array of `google_data_loss_prevention_inspect_template` description
  * `display_names`: an array of `google_data_loss_prevention_inspect_template` display_name
  * `inspect_configs`: an array of `google_data_loss_prevention_inspect_template` inspect_config
  * `parents`: an array of `google_data_loss_prevention_inspect_template` parent

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
