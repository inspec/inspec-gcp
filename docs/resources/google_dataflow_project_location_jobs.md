+++
title = "google_dataflow_project_location_jobs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_dataflow_project_location_jobs"
identifier = "inspec/resources/gcp/google_dataflow_project_location_jobs Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_dataflow_project_location_jobs` is used to test a Google ProjectLocationJob resource

## Examples
```
    describe google_dataflow_project_location_jobs(location: 'value_location', project: 'value_project') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_dataflow_project_location_jobs` resource:

See [google_dataflow_project_location_job.md](google_dataflow_project_location_job.md) for more detailed information
  * `ids`: an array of `google_dataflow_project_location_job` id
  * `project_ids`: an array of `google_dataflow_project_location_job` project_id
  * `names`: an array of `google_dataflow_project_location_job` name
  * `types`: an array of `google_dataflow_project_location_job` type
  * `environments`: an array of `google_dataflow_project_location_job` environment
  * `steps`: an array of `google_dataflow_project_location_job` steps
  * `steps_locations`: an array of `google_dataflow_project_location_job` steps_location
  * `current_states`: an array of `google_dataflow_project_location_job` current_state
  * `current_state_times`: an array of `google_dataflow_project_location_job` current_state_time
  * `requested_states`: an array of `google_dataflow_project_location_job` requested_state
  * `execution_infos`: an array of `google_dataflow_project_location_job` execution_info
  * `create_times`: an array of `google_dataflow_project_location_job` create_time
  * `replace_job_ids`: an array of `google_dataflow_project_location_job` replace_job_id
  * `transform_name_mappings`: an array of `google_dataflow_project_location_job` transform_name_mapping
  * `client_request_ids`: an array of `google_dataflow_project_location_job` client_request_id
  * `replaced_by_job_ids`: an array of `google_dataflow_project_location_job` replaced_by_job_id
  * `temp_files`: an array of `google_dataflow_project_location_job` temp_files
  * `labels`: an array of `google_dataflow_project_location_job` labels
  * `locations`: an array of `google_dataflow_project_location_job` location
  * `pipeline_descriptions`: an array of `google_dataflow_project_location_job` pipeline_description
  * `stage_states`: an array of `google_dataflow_project_location_job` stage_states
  * `job_metadata`: an array of `google_dataflow_project_location_job` job_metadata
  * `start_times`: an array of `google_dataflow_project_location_job` start_time
  * `created_from_snapshot_ids`: an array of `google_dataflow_project_location_job` created_from_snapshot_id
  * `satisfies_pzs`: an array of `google_dataflow_project_location_job` satisfies_pzs
  * `runtime_updatable_params`: an array of `google_dataflow_project_location_job` runtime_updatable_params
  * `satisfies_pzis`: an array of `google_dataflow_project_location_job` satisfies_pzi

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://dataflow.googleapis.com/](https://console.cloud.google.com/apis/library/dataflow.googleapis.com/) is enabled for the current project.
