+++
title = "google_access_context_manager_access_levels resource"

draft = false


[menu.gcp]
title = "google_access_context_manager_access_levels"
identifier = "inspec/resources/gcp/google_access_context_manager_access_levels resource"
parent = "inspec/resources/gcp"
+++

Use the `google_access_context_manager_access_levels` InSpec audit resource to to test a Google Cloud AccessLevel resource.

## Examples

```ruby
policy_name = google_access_context_manager_access_policies(org_id: '190694428152').names.first

describe google_access_context_manager_access_levels(parent: policy_name) do
  its('names') { should include "ip_subnet" }
end

```

## Properties

Properties that can be accessed from the `google_access_context_manager_access_levels` resource:

See [google_access_context_manager_access_level](google_access_context_manager_access_level) for more detailed information.

  * `titles`: an array of `google_access_context_manager_access_level` title
  * `descriptions`: an array of `google_access_context_manager_access_level` description
  * `basics`: an array of `google_access_context_manager_access_level` basic
  * `customs`: an array of `google_access_context_manager_access_level` custom
  * `parents`: an array of `google_access_context_manager_access_level` parent
  * `names`: an array of `google_access_context_manager_access_level` name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
