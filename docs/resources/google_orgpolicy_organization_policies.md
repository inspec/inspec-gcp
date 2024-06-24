---
title: About the google_orgpolicy_organization_policies resource
platform: gcp
---

## Syntax
A `google_orgpolicy_organization_policies` is used to test a Google OrganizationPolicy resource

## Examples
```
  describe google_orgpolicy_organization_policies(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_orgpolicy_organization_policies` resource:

See [google_orgpolicy_organization_policy.md](google_orgpolicy_organization_policy.md) for more detailed information
  * `dry_run_specs`: an array of `google_orgpolicy_organization_policy` dry_run_spec
  * `specs`: an array of `google_orgpolicy_organization_policy` spec
  * `names`: an array of `google_orgpolicy_organization_policy` name
  * `alternates`: an array of `google_orgpolicy_organization_policy` alternate

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://orgpolicy.googleapis.com/](https://console.cloud.google.com/apis/library/orgpolicy.googleapis.com/) is enabled for the current project.
