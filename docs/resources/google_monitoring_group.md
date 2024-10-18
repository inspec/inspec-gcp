+++

title = "google_monitoring_group Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_monitoring_group"
identifier = "inspec/resources/gcp/google_monitoring_group Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_monitoring_group` InSpec audit resource to test the properties of a test a Google Group.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_monitoring_group` is used to test a Google Group resource

## Examples
```
describe google_monitoring_group(name: 'projects/*/groups/value_group_id') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('display_name') { should cmp 'value_displayname' }
	its('filter') { should cmp 'value_filter' }
end

describe google_monitoring_group(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_monitoring_group` resource:

## Properties
Properties that can be accessed from the `google_monitoring_group` resource:


  * `name`: Output only. The name of this group. The format is: projects/[PROJECT_ID_OR_NUMBER]/groups/[GROUP_ID] When creating a group, this field is ignored and a new name is created consisting of the project specified in the call to CreateGroup and a unique [GROUP_ID] that is generated automatically.

  * `display_name`: A user-assigned name for this group, used only for display purposes.

  * `parent_name`: The name of the group's parent, if it has one. The format is: projects/[PROJECT_ID_OR_NUMBER]/groups/[GROUP_ID] For groups with no parent, parent_name is the empty string, "".

  * `filter`: The filter used to determine which monitored resources belong to this group.

  * `is_cluster`: If true, the members of this group are considered to be a cluster. The system can perform additional analysis on groups that are clusters.


## GCP Permissions

Ensure the [Stackdriver Monitoring API](https://console.cloud.google.com/apis/library/monitoring.googleapis.com/) is enabled for the current project.
