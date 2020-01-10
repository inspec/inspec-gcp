---
title: About the google_logging_project_sinks resource
platform: gcp
---

## Syntax
A `google_logging_project_sinks` is used to test a Google ProjectSink resource

## Examples
```
describe google_logging_project_sinks(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-org-sink' }
end
```

## Properties
Properties that can be accessed from the `google_logging_project_sinks` resource:

See [google_logging_project_sink.md](google_logging_project_sink.md) for more detailed information
  * `projects`: an array of `google_logging_project_sink` project
  * `names`: an array of `google_logging_project_sink` name
  * `filters`: an array of `google_logging_project_sink` filter
  * `destinations`: an array of `google_logging_project_sink` destination
  * `writer_identities`: an array of `google_logging_project_sink` writer_identity
  * `include_children`: an array of `google_logging_project_sink` include_children

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
