+++

title = "google_monitoring_project_groups Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_monitoring_project_groups"
identifier = "inspec/resources/gcp/google_monitoring_project_groups Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_monitoring_project_groups` InSpec audit resource to test the properties of a test a Google ProjectGroup.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_monitoring_project_groups` is used to test a Google ProjectGroup resource

## Examples
```
    describe google_monitoring_project_groups(name: ' value_name') do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_monitoring_project_groups` resource:

See [google_monitoring_project_group.md](google_monitoring_project_group.md) for more detailed information
* `names`: an array of `google_monitoring_project_group` name
* `display_names`: an array of `google_monitoring_project_group` display_name
* `parent_names`: an array of `google_monitoring_project_group` parent_name
* `filters`: an array of `google_monitoring_project_group` filter
* `is_clusters`: an array of `google_monitoring_project_group` is_cluster
## Properties
Properties that can be accessed from the `google_monitoring_project_groups` resource:

See [google_monitoring_project_group.md](google_monitoring_project_group.md) for more detailed information
* `names`: an array of `google_monitoring_project_group` name
* `display_names`: an array of `google_monitoring_project_group` display_name
* `parent_names`: an array of `google_monitoring_project_group` parent_name
* `filters`: an array of `google_monitoring_project_group` filter
* `is_clusters`: an array of `google_monitoring_project_group` is_cluster

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Stackdriver Monitoring API](https://console.cloud.google.com/apis/library/monitoring.googleapis.com/) is enabled for the current project.
