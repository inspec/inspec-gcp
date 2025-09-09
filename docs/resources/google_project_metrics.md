+++
title = "google_project_metrics resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_project_metrics"
identifier = "inspec/resources/gcp/google_project_metrics Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_project_metrics` InSpec audit resource to to test a Google Cloud Metric resource.

## Examples

```ruby
describe google_project_metrics(project: 'chef-gcp-inspec') do
  it { should exist }
  its('metric_filters') { should include 'resource.type=gae_app AND severity>=ERROR' }
  its('metric_names') { should include 'some/metric' }
end

describe.one do
  google_project_metrics(project: 'chef-gcp-inspec').metric_types.each do |metric_type|
    describe metric_type do
      it { should match 'some/metric' }
    end
  end
end
```

### Test that there are no more than a specified number of metrics available for the project

    describe google_project_metrics(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected metric name is available for the project

    describe google_project_metrics(project: 'chef-inspec-gcp') do
      its('metric_names') { should include "metric-name" }
    end

### Test that a subset of all metrics with name matching "*project*" have a particular writer identity 

    google_project_metrics(project: 'chef-inspec-gcp').where(metric_name: /project/).metric_names.each do |metric_name|
      describe google_project_metric(project: 'chef-inspec-gcp',  metric: metric_name) do
        its('filter') { should eq "(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\")" }
      end
    end

## Properties

Properties that can be accessed from the `google_project_metrics` resource:

See [google_project_metric](google_project_metric) for more detailed information.

  * `metric_names`: an array of `google_project_metric` name
  * `descriptions`: an array of `google_project_metric` description
  * `metric_filters`: an array of `google_project_metric` filter
  * `metric_descriptors`: an array of `google_project_metric` metric_descriptor
  * `label_extractors`: an array of `google_project_metric` label_extractors
  * `value_extractors`: an array of `google_project_metric` value_extractor
  * `bucket_options`: an array of `google_project_metric` bucket_options

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
