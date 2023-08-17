---
title: About the google_data_loss_prevention_stored_info_types resource
platform: gcp
---

## Syntax
A `google_data_loss_prevention_stored_info_types` is used to test a Google StoredInfoType resource

## Examples
```


describe google_data_loss_prevention_stored_info_types(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}") do
it { should exist }
its('names') { should include 'i-inspec-gcp-dlp' }
end
```

## Properties
Properties that can be accessed from the `google_data_loss_prevention_stored_info_types` resource:

See [google_data_loss_prevention_stored_info_type.md](google_data_loss_prevention_stored_info_type.md) for more detailed information
  * `names`: an array of `google_data_loss_prevention_stored_info_type` name
  * `descriptions`: an array of `google_data_loss_prevention_stored_info_type` description
  * `display_names`: an array of `google_data_loss_prevention_stored_info_type` display_name
  * `regexes`: an array of `google_data_loss_prevention_stored_info_type` regex
  * `dictionaries`: an array of `google_data_loss_prevention_stored_info_type` dictionary
  * `large_custom_dictionaries`: an array of `google_data_loss_prevention_stored_info_type` large_custom_dictionary
  * `parents`: an array of `google_data_loss_prevention_stored_info_type` parent

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
