---
title: About the google_orgpolicy_folder_constraints resource
platform: gcp
---

## Syntax
A `google_orgpolicy_folder_constraints` is used to test a Google FolderConstraint resource

## Examples
```
    describe google_orgpolicy_folder_constraints(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_orgpolicy_folder_constraints` resource:

See [google_orgpolicy_folder_constraint.md](google_orgpolicy_folder_constraint.md) for more detailed information
  * `next_page_tokens`: an array of `google_orgpolicy_folder_constraint` next_page_token
  * `constraints`: an array of `google_orgpolicy_folder_constraint` constraints

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://orgpolicy.googleapis.com/](https://console.cloud.google.com/apis/library/orgpolicy.googleapis.com/) is enabled for the current project.
