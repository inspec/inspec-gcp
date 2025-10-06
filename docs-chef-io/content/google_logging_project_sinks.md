+++
title = "google_logging_project_sinks resource"

draft = false


[menu.gcp]
title = "google_logging_project_sinks"
identifier = "inspec/resources/gcp/google_logging_project_sinks resource"
parent = "inspec/resources/gcp"
+++

Use the `google_logging_project_sinks` InSpec audit resource to to test a Google Cloud ProjectSink resource.

## Examples

```ruby
describe google_logging_project_sinks(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-org-sink' }
end
```

### Test that there are no more than a specified number of sinks available for the project

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected sink name is available for the project

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      its('sink_names') { should include "my-sink" }
    end

### Test that an expected sink destination is available for the project

    describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
      its('sink_destinations') { should include "storage.googleapis.com/a-logging-bucket" }
    end

### Test that a subset of all sinks matching "project*" have a particular writer identity 

    google_logging_project_sinks(project: 'chef-inspec-gcp').where(sink_name: /project/).sink_names.each do |sink_name|
      describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: sink_name) do
        its('writer_identity') { should eq "serviceAccount:my-logging-service-account.iam.gserviceaccount.com" }
      end
    end

## Properties

Properties that can be accessed from the `google_logging_project_sinks` resource:

See [google_logging_project_sink](google_logging_project_sink) for more detailed information.

  * `projects`: an array of `google_logging_project_sink` project
  * `names`: an array of `google_logging_project_sink` name
  * `filters`: an array of `google_logging_project_sink` filter
  * `destinations`: an array of `google_logging_project_sink` destination
  * `writer_identities`: an array of `google_logging_project_sink` writer_identity
  * `include_children`: an array of `google_logging_project_sink` include_children

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
