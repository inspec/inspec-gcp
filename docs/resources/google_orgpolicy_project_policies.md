+++
title = "google_orgpolicy_project_policies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_orgpolicy_project_policies"
identifier = "inspec/resources/gcp/google_orgpolicy_project_policies Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_orgpolicy_project_policies` is used to test a Google ProjectPolicy resource

## Examples
```
  describe google_orgpolicy_project_policies(parent: 'value_parent') do
    it { should exist }
    its('names'){ should include value_name}
  end
```

## Properties
Properties that can be accessed from the `google_orgpolicy_project_policies` resource:

See [google_orgpolicy_project_policy.md](google_orgpolicy_project_policy.md) for more detailed information
  * `dry_run_specs`: an array of `google_orgpolicy_project_policy` dry_run_spec
  * `specs`: an array of `google_orgpolicy_project_policy` spec
  * `names`: an array of `google_orgpolicy_project_policy` name
  * `alternates`: an array of `google_orgpolicy_project_policy` alternate

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [None](https://console.cloud.google.com/apis/library/orgpolicy.googleapis.com/) is enabled for the current project.
