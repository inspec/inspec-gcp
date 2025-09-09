+++
title = "google_orgpolicy_folder_policies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_orgpolicy_folder_policies"
identifier = "inspec/resources/gcp/google_orgpolicy_folder_policies Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_orgpolicy_folder_policies` InSpec audit resource to to test a Google Cloud FolderPolicy resource.

## Examples

```ruby
  describe google_orgpolicy_folder_policies(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_orgpolicy_folder_policies` resource:

See [google_orgpolicy_folder_policy](google_orgpolicy_folder_policy) for more detailed information.

  * `dry_run_specs`: an array of `google_orgpolicy_folder_policy` dry_run_spec
  * `specs`: an array of `google_orgpolicy_folder_policy` spec
  * `names`: an array of `google_orgpolicy_folder_policy` name
  * `alternates`: an array of `google_orgpolicy_folder_policy` alternate

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [https://orgpolicy.googleapis.com/](https://console.cloud.google.com/apis/library/orgpolicy.googleapis.com/) is enabled for the current project.
