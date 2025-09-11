+++
title = "google_monitoring_groups resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_monitoring_groups"
identifier = "inspec/resources/gcp/google_monitoring_groups resource"
parent = "inspec/resources/gcp"
+++

Use the `google_monitoring_groups` InSpec audit resource to test the properties of a Google Cloud Group resource.

## Examples

```ruby
  describe google_monitoring_groups(name: 'projects/*') do
    it { should exist }
    its('names') { should include 'value_name' }
    its('display_names') { should include 'value_displayname' }
    its('filters') { should include 'value_filter' }
  end
```

## Parameters

Parameters that can be accessed from the `google_monitoring_groups` resource:

See [google_monitoring_group](google_monitoring_group) for more detailed information.

* `names`: an array of `google_monitoring_group` name
* `display_names`: an array of `google_monitoring_group` display_name
* `parent_names`: an array of `google_monitoring_group` parent_name
* `filters`: an array of `google_monitoring_group` filter
* `is_clusters`: an array of `google_monitoring_group` is_cluster

## Properties

Properties that can be accessed from the `google_monitoring_groups` resource:

See [google_monitoring_group](google_monitoring_group) for more detailed information.

* `names`: an array of `google_monitoring_group` name
* `display_names`: an array of `google_monitoring_group` display_name
* `parent_names`: an array of `google_monitoring_group` parent_name
* `filters`: an array of `google_monitoring_group` filter
* `is_clusters`: an array of `google_monitoring_group` is_cluster

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Stackdriver Monitoring API](https://console.cloud.google.com/apis/library/monitoring.googleapis.com/) is enabled for the current project.
