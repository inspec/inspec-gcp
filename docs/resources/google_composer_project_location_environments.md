---
title: About the google_composer_project_location_environments resource
platform: gcp
---

## Syntax
A `google_composer_project_location_environments` is used to test a Google ProjectLocationEnvironment resource

## Examples
```
    describe google_composer_project_location_environments(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_composer_project_location_environments` resource:

See [google_composer_project_location_environment.md](google_composer_project_location_environment.md) for more detailed information
  * `names`: an array of `google_composer_project_location_environment` name
  * `configs`: an array of `google_composer_project_location_environment` config
  * `uuids`: an array of `google_composer_project_location_environment` uuid
  * `states`: an array of `google_composer_project_location_environment` state
  * `create_times`: an array of `google_composer_project_location_environment` create_time
  * `update_times`: an array of `google_composer_project_location_environment` update_time
  * `labels`: an array of `google_composer_project_location_environment` labels
  * `satisfies_pzs`: an array of `google_composer_project_location_environment` satisfies_pzs
  * `storage_configs`: an array of `google_composer_project_location_environment` storage_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://composer.googleapis.com/](https://console.cloud.google.com/apis/library/composer.googleapis.com/) is enabled for the current project.
