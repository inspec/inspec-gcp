---
title: About the google_data_loss_prevention_deidentify_templates resource
platform: gcp
---

## Syntax
A `google_data_loss_prevention_deidentify_templates` is used to test a Google DeidentifyTemplate resource

## Examples
```


describe google_data_loss_prevention_deidentify_templates(parent: "projects/#{'chef-gcp-inspec'}/locations/#{''}") do
  it { should exist }
  its('display_names') { should include '' }

end

```

## Properties
Properties that can be accessed from the `google_data_loss_prevention_deidentify_templates` resource:

See [google_data_loss_prevention_deidentify_template.md](google_data_loss_prevention_deidentify_template.md) for more detailed information
  * `names`: an array of `google_data_loss_prevention_deidentify_template` name
  * `descriptions`: an array of `google_data_loss_prevention_deidentify_template` description
  * `display_names`: an array of `google_data_loss_prevention_deidentify_template` display_name
  * `deidentify_configs`: an array of `google_data_loss_prevention_deidentify_template` deidentify_config
  * `parents`: an array of `google_data_loss_prevention_deidentify_template` parent

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
