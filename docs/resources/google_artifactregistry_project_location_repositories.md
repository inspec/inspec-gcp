---
title: About the google_artifactregistry_project_location_repositories resource
platform: gcp
---

## Syntax
A `google_artifactregistry_project_location_repositories` is used to test a Google ProjectLocationRepository resource

## Examples
```
    describe google_artifactregistry_project_location_repositories(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_artifactregistry_project_location_repositories` resource:

See [google_artifactregistry_project_location_repository.md](google_artifactregistry_project_location_repository.md) for more detailed information
  * `maven_configs`: an array of `google_artifactregistry_project_location_repository` maven_config
  * `docker_configs`: an array of `google_artifactregistry_project_location_repository` docker_config
  * `virtual_repository_configs`: an array of `google_artifactregistry_project_location_repository` virtual_repository_config
  * `remote_repository_configs`: an array of `google_artifactregistry_project_location_repository` remote_repository_config
  * `names`: an array of `google_artifactregistry_project_location_repository` name
  * `formats`: an array of `google_artifactregistry_project_location_repository` format
  * `descriptions`: an array of `google_artifactregistry_project_location_repository` description
  * `labels`: an array of `google_artifactregistry_project_location_repository` labels
  * `create_times`: an array of `google_artifactregistry_project_location_repository` create_time
  * `update_times`: an array of `google_artifactregistry_project_location_repository` update_time
  * `kms_key_names`: an array of `google_artifactregistry_project_location_repository` kms_key_name
  * `modes`: an array of `google_artifactregistry_project_location_repository` mode
  * `cleanup_policies`: an array of `google_artifactregistry_project_location_repository` cleanup_policies
  * `size_bytes`: an array of `google_artifactregistry_project_location_repository` size_bytes
  * `satisfies_pzs`: an array of `google_artifactregistry_project_location_repository` satisfies_pzs
  * `cleanup_policy_dry_runs`: an array of `google_artifactregistry_project_location_repository` cleanup_policy_dry_run

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Artifact Registry API](https://console.cloud.google.com/apis/library/artifactregistry.googleapis.com/) is enabled for the current project.
