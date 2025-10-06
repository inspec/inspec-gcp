+++
title = "google_logging_project_exclusions resource"

draft = false


[menu.gcp]
title = "google_logging_project_exclusions"
identifier = "inspec/resources/gcp/google_logging_project_exclusions resource"
parent = "inspec/resources/gcp"
+++

Use the `google_logging_project_exclusions` InSpec audit resource to to test a Google Cloud ProjectExclusion resource.

## Examples

```ruby
describe google_logging_project_exclusions(project: 'chef-gcp-inspec') do
  its('names'){ should include 'inspec-folder-exclusion' }
end
```

## Properties

Properties that can be accessed from the `google_logging_project_exclusions` resource:

See [google_logging_project_exclusion](google_logging_project_exclusion) for more detailed information.

  * `projects`: an array of `google_logging_project_exclusion` project
  * `names`: an array of `google_logging_project_exclusion` name
  * `descriptions`: an array of `google_logging_project_exclusion` description
  * `filters`: an array of `google_logging_project_exclusion` filter
  * `disableds`: an array of `google_logging_project_exclusion` disabled

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
