+++
title = "google_logging_organization_log_sinks resource"

draft = false


[menu.gcp]
title = "google_logging_organization_log_sinks"
identifier = "inspec/resources/gcp/google_logging_organization_log_sinks resource"
parent = "inspec/resources/gcp"
+++

Use the `google_logging_organization_log_sinks` InSpec audit resource to to test a Google Cloud OrganizationLogSink resource.

## Examples

```ruby
describe google_logging_organization_log_sinks(organization: '190694428152') do
  its('names') { should include 'inspec-gcp-org-sink' }
end
```

## Properties

Properties that can be accessed from the `google_logging_organization_log_sinks` resource:

See [google_logging_organization_log_sink](google_logging_organization_log_sink) for more detailed information.

  * `organizations`: an array of `google_logging_organization_log_sink` organization
  * `names`: an array of `google_logging_organization_log_sink` name
  * `filters`: an array of `google_logging_organization_log_sink` filter
  * `destinations`: an array of `google_logging_organization_log_sink` destination
  * `writer_identities`: an array of `google_logging_organization_log_sink` writer_identity
  * `include_children`: an array of `google_logging_organization_log_sink` include_children

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
