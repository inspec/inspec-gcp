---
title: About the google_organizations resource
platform: gcp
---

## Syntax
A `google_organizations` is used to test a Google Organization resource

## Examples
```

describe google_organizations do
  its('names') { should include "organizations/123456" }
end
```

## Properties
Properties that can be accessed from the `google_organizations` resource:

See [google_organization.md](google_organization.md) for more detailed information
  * `names`: an array of `google_organization` name
  * `display_names`: an array of `google_organization` display_name
  * `lifecycle_states`: an array of `google_organization` lifecycle_state
  * `creation_times`: an array of `google_organization` creation_time
  * `owners`: an array of `google_organization` owner

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
