---
title: About the google_secret_manager_regional_secrets resource
platform: gcp
---

## Syntax
A `google_secret_manager_regional_secrets` is used to test a Google Regional Secret resource

## Examples
```
  describe google_secret_manager_regional_secrets(parent: ' value_parent', region: 'value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_secret_manager_regional_secrets` resource:

See [google_secret_manager_regional_secret.md](google_secret_manager_regional_secret.md) for more detailed information
  * `names`: an array of `google_secret_manager_regional_secret` name
  * `create_times`: an array of `google_secret_manager_regional_secret` create_time
  * `annotations`: an array of `google_secret_manager_regional_secret` annotation
  * `labels`: an array of `google_secret_manager_regional_secret` labels
  * `topics`: an array of `google_secret_manager_regional_secret` topics
  * `expire_times`: an array of `google_secret_manager_regional_secret` expire_time
  * `ttls`: an array of `google_secret_manager_regional_secret` ttl
  * `rotations`: an array of `google_secret_manager_regional_secret` rotation
  * `customer_managed_encryptions`: an array of `google_secret_manager_regional_secret` customer_managed_encryption
  * `version_destroy_ttl`: an array of `google_secret_manager_regional_secret` version_destroy_ttl

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Secret Manager Regional API](https://console.cloud.google.com/apis/library/secretmanager.googleapis.com/) is enabled for the current project.