+++
title = "google_composer_project_location_image_versions resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_composer_project_location_image_versions"
identifier = "inspec/resources/gcp/google_composer_project_location_image_versions Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_composer_project_location_image_versions` InSpec audit resource to to test a Google Cloud ProjectLocationImageVersion resource.

## Examples

```ruby
    describe google_composer_project_location_image_versions(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_composer_project_location_image_versions` resource:

See [google_composer_project_location_image_version](google_composer_project_location_image_version) for more detailed information.

  * `image_versions`: an array of `google_composer_project_location_image_version` image_versions
  * `next_page_tokens`: an array of `google_composer_project_location_image_version` next_page_token

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [https://composer.googleapis.com/](https://console.cloud.google.com/apis/library/composer.googleapis.com/) is enabled for the current project.
