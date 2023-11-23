---
title: About the google_composer_project_location_image_version resource
platform: gcp
---

## Syntax
A `google_composer_project_location_image_version` is used to test a Google ProjectLocationImageVersion resource

## Examples
```
describe google_composer_project_location_image_version() do
	it { should exist }

end

describe google_composer_project_location_image_version() do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_composer_project_location_image_version` resource:


  * `image_versions`: The list of supported ImageVersions in a location.

  * `next_page_token`: The page token used to query for the next page if one exists.


## GCP Permissions

Ensure the [https://composer.googleapis.com/](https://console.cloud.google.com/apis/library/composer.googleapis.com/) is enabled for the current project.
