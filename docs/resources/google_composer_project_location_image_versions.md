+++
title = "google_composer_project_location_image_versions resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_composer_project_location_image_versions"
identifier = "inspec/resources/gcp/google_composer_project_location_image_versions Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_composer_project_location_image_versions` is used to test a Google ProjectLocationImageVersion resource

## Examples
```
    describe google_composer_project_location_image_versions(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_composer_project_location_image_versions` resource:

See [google_composer_project_location_image_version.md](google_composer_project_location_image_version.md) for more detailed information
  * `image_versions`: an array of `google_composer_project_location_image_version` image_versions
  * `next_page_tokens`: an array of `google_composer_project_location_image_version` next_page_token

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://composer.googleapis.com/](https://console.cloud.google.com/apis/library/composer.googleapis.com/) is enabled for the current project.
