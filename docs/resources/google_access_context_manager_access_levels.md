---
title: About the google_access_context_manager_access_levels resource
platform: gcp
---

## Syntax
A `google_access_context_manager_access_levels` is used to test a Google AccessLevel resource

## Examples
```

policy_name = google_access_context_manager_access_policies(org_id: '190694428152').names.first

describe google_access_context_manager_access_levels(parent: policy_name) do
  its('names') { should include "ip_subnet" }
end

```

## Properties
Properties that can be accessed from the `google_access_context_manager_access_levels` resource:

See [google_access_context_manager_access_level.md](google_access_context_manager_access_level.md) for more detailed information
  * `titles`: an array of `google_access_context_manager_access_level` title
  * `descriptions`: an array of `google_access_context_manager_access_level` description
  * `basics`: an array of `google_access_context_manager_access_level` basic
  * `customs`: an array of `google_access_context_manager_access_level` custom
  * `parents`: an array of `google_access_context_manager_access_level` parent
  * `names`: an array of `google_access_context_manager_access_level` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
