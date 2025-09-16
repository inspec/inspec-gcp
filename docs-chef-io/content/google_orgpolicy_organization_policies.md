+++
title = "google_orgpolicy_organization_policies resource"

draft = false


[menu.gcp]
title = "google_orgpolicy_organization_policies"
identifier = "inspec/resources/gcp/google_orgpolicy_organization_policies resource"
parent = "inspec/resources/gcp"
+++

Use the `google_orgpolicy_organization_policies` InSpec audit resource to to test a Google Cloud OrganizationPolicy resource.

## Examples

```ruby
  describe google_orgpolicy_organization_policies(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_orgpolicy_organization_policies` resource:

See [google_orgpolicy_organization_policy](google_orgpolicy_organization_policy) for more detailed information.

  * `dry_run_specs`: an array of `google_orgpolicy_organization_policy` dry_run_spec
  * `specs`: an array of `google_orgpolicy_organization_policy` spec
  * `names`: an array of `google_orgpolicy_organization_policy` name
  * `alternates`: an array of `google_orgpolicy_organization_policy` alternate

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [https://orgpolicy.googleapis.com/](https://console.cloud.google.com/apis/library/orgpolicy.googleapis.com/) is enabled for the current project.
