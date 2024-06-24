+++

title = "google_dataproc_project_region_jobs Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_dataproc_project_region_jobs"
identifier = "inspec/resources/gcp/google_dataproc_project_region_jobs Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_project_region_jobs` InSpec audit resource to test the properties of a test a Google ProjectRegionJob.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_dataproc_project_region_jobs` is used to test a Google ProjectRegionJob resource

## Examples
```
    describe google_dataproc_project_region_jobs() do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_dataproc_project_region_jobs` resource:

See [google_dataproc_project_region_job.md](google_dataproc_project_region_job.md) for more detailed information
* `references`: an array of `google_dataproc_project_region_job` reference
* `placements`: an array of `google_dataproc_project_region_job` placement
* `hadoop_jobs`: an array of `google_dataproc_project_region_job` hadoop_job
* `spark_jobs`: an array of `google_dataproc_project_region_job` spark_job
* `pyspark_jobs`: an array of `google_dataproc_project_region_job` pyspark_job
* `hive_jobs`: an array of `google_dataproc_project_region_job` hive_job
* `pig_jobs`: an array of `google_dataproc_project_region_job` pig_job
* `spark_r_jobs`: an array of `google_dataproc_project_region_job` spark_r_job
* `spark_sql_jobs`: an array of `google_dataproc_project_region_job` spark_sql_job
* `presto_jobs`: an array of `google_dataproc_project_region_job` presto_job
* `trino_jobs`: an array of `google_dataproc_project_region_job` trino_job
* `flink_jobs`: an array of `google_dataproc_project_region_job` flink_job
* `statuses`: an array of `google_dataproc_project_region_job` status
* `status_histories`: an array of `google_dataproc_project_region_job` status_history
* `yarn_applications`: an array of `google_dataproc_project_region_job` yarn_applications
* `driver_output_resource_uris`: an array of `google_dataproc_project_region_job` driver_output_resource_uri
* `driver_control_files_uris`: an array of `google_dataproc_project_region_job` driver_control_files_uri
* `labels`: an array of `google_dataproc_project_region_job` labels
* `schedulings`: an array of `google_dataproc_project_region_job` scheduling
* `job_uuids`: an array of `google_dataproc_project_region_job` job_uuid
* `dones`: an array of `google_dataproc_project_region_job` done
* `driver_scheduling_configs`: an array of `google_dataproc_project_region_job` driver_scheduling_config
## Properties
Properties that can be accessed from the `google_dataproc_project_region_jobs` resource:

See [google_dataproc_project_region_job.md](google_dataproc_project_region_job.md) for more detailed information
* `references`: an array of `google_dataproc_project_region_job` reference
* `placements`: an array of `google_dataproc_project_region_job` placement
* `hadoop_jobs`: an array of `google_dataproc_project_region_job` hadoop_job
* `spark_jobs`: an array of `google_dataproc_project_region_job` spark_job
* `pyspark_jobs`: an array of `google_dataproc_project_region_job` pyspark_job
* `hive_jobs`: an array of `google_dataproc_project_region_job` hive_job
* `pig_jobs`: an array of `google_dataproc_project_region_job` pig_job
* `spark_r_jobs`: an array of `google_dataproc_project_region_job` spark_r_job
* `spark_sql_jobs`: an array of `google_dataproc_project_region_job` spark_sql_job
* `presto_jobs`: an array of `google_dataproc_project_region_job` presto_job
* `trino_jobs`: an array of `google_dataproc_project_region_job` trino_job
* `flink_jobs`: an array of `google_dataproc_project_region_job` flink_job
* `statuses`: an array of `google_dataproc_project_region_job` status
* `status_histories`: an array of `google_dataproc_project_region_job` status_history
* `yarn_applications`: an array of `google_dataproc_project_region_job` yarn_applications
* `driver_output_resource_uris`: an array of `google_dataproc_project_region_job` driver_output_resource_uri
* `driver_control_files_uris`: an array of `google_dataproc_project_region_job` driver_control_files_uri
* `labels`: an array of `google_dataproc_project_region_job` labels
* `schedulings`: an array of `google_dataproc_project_region_job` scheduling
* `job_uuids`: an array of `google_dataproc_project_region_job` job_uuid
* `dones`: an array of `google_dataproc_project_region_job` done
* `driver_scheduling_configs`: an array of `google_dataproc_project_region_job` driver_scheduling_config

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
