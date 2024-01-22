---
title: About the google_iam_project_service_account_keys resource
platform: gcp
---

## Syntax
A `google_iam_project_service_account_keys` is used to test a Google ProjectServiceAccountKey resource

## Examples
```
    describe google_iam_project_service_account_keys(name: ' value_name') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_iam_project_service_account_keys` resource:

See [google_iam_project_service_account_key.md](google_iam_project_service_account_key.md) for more detailed information
  * `names`: an array of `google_iam_project_service_account_key` name
  * `private_key_types`: an array of `google_iam_project_service_account_key` private_key_type
  * `key_algorithms`: an array of `google_iam_project_service_account_key` key_algorithm
  * `private_key_data`: an array of `google_iam_project_service_account_key` private_key_data
  * `public_key_data`: an array of `google_iam_project_service_account_key` public_key_data
  * `valid_after_times`: an array of `google_iam_project_service_account_key` valid_after_time
  * `valid_before_times`: an array of `google_iam_project_service_account_key` valid_before_time
  * `key_origins`: an array of `google_iam_project_service_account_key` key_origin
  * `key_types`: an array of `google_iam_project_service_account_key` key_type
  * `disableds`: an array of `google_iam_project_service_account_key` disabled

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
