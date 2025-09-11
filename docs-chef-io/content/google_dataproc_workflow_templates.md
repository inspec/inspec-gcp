+++
title = "google_dataproc_workflow_templates resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dataproc_workflow_templates"
identifier = "inspec/resources/gcp/google_dataproc_workflow_templates resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_workflow_templates` InSpec audit resource to to test a Google Cloud WorkflowTemplates resource.

## Examples

```ruby
  describe google_dataproc_workflow_templates(parent: 'value_parent') do
    it { should exist }
    its('ids') { should include 'value_id' }
    its('names') { should include 'value_name' }
    its('create_times') { should include 'value_createtime' }
    its('update_times') { should include 'value_updatetime' }
    its('dag_timeouts') { should include 'value_dagtimeout' }
  end
```
## Parameters
  * `parent`: The resource name of the region or location, as described in https://cloud.google.com/apis/design/resource_names.
  For projects.regions.workflowTemplates,list, the resource name of the region has the following format: projects/{projectId}/regions/{region}
  For projects.locations.workflowTemplates.list, the resource name of the location has the following format: projects/{projectId}/locations/{location}

## Properties

Properties that can be accessed from the `google_dataproc_workflow_templates` resource:

See [google_dataproc_project_location_workflow_template](google_dataproc_project_location_workflow_template) for more detailed information.

  * `ids`: an array of `google_dataproc_project_location_workflow_template` id
  * `names`: an array of `google_dataproc_project_location_workflow_template` name
  * `versions`: an array of `google_dataproc_project_location_workflow_template` version
  * `create_times`: an array of `google_dataproc_project_location_workflow_template` create_time
  * `update_times`: an array of `google_dataproc_project_location_workflow_template` update_time
  * `labels`: an array of `google_dataproc_project_location_workflow_template` labels
  * `placements`: an array of `google_dataproc_project_location_workflow_template` placement
  * `jobs`: an array of `google_dataproc_project_location_workflow_template` jobs
  * `parameters`: an array of `google_dataproc_project_location_workflow_template` parameters
  * `dag_timeouts`: an array of `google_dataproc_project_location_workflow_template` dag_timeout
  * `encryption_configs`: an array of `google_dataproc_project_location_workflow_template` encryption_config

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
