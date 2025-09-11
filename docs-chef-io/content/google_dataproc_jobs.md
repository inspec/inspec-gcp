+++
title = "google_dataproc_jobs resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dataproc_jobs"
identifier = "inspec/resources/gcp/google_dataproc_jobs resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_jobs` InSpec audit resource to to test a Google Cloud Job resource.

## Examples

```ruby
  describe google_dataproc_jobs(project_id: 'value_project_id', region: 'value_region') do
    it { should exist }
    its('driver_output_resource_uris') { should include 'value_driveroutputresourceuri' }
    its('driver_control_files_uris') { should include 'value_drivercontrolfilesuri' }
    its('job_uuids') { should include 'value_jobuuid' }
  end
```

## Properties

Properties that can be accessed from the `google_dataproc_jobs` resource:

See [google_dataproc_job](google_dataproc_job) for more detailed information.

* `references`: an array of `google_dataproc_job` reference
* `placements`: an array of `google_dataproc_job` placement
* `hadoop_jobs`: an array of `google_dataproc_job` hadoop_job
* `spark_jobs`: an array of `google_dataproc_job` spark_job
* `pyspark_jobs`: an array of `google_dataproc_job` pyspark_job
* `hive_jobs`: an array of `google_dataproc_job` hive_job
* `pig_jobs`: an array of `google_dataproc_job` pig_job
* `spark_r_jobs`: an array of `google_dataproc_job` spark_r_job
* `spark_sql_jobs`: an array of `google_dataproc_job` spark_sql_job
* `presto_jobs`: an array of `google_dataproc_job` presto_job
* `trino_jobs`: an array of `google_dataproc_job` trino_job
* `flink_jobs`: an array of `google_dataproc_job` flink_job
* `statuses`: an array of `google_dataproc_job` status
* `status_histories`: an array of `google_dataproc_job` status_history
* `yarn_applications`: an array of `google_dataproc_job` yarn_applications
* `driver_output_resource_uris`: an array of `google_dataproc_job` driver_output_resource_uri
* `driver_control_files_uris`: an array of `google_dataproc_job` driver_control_files_uri
* `labels`: an array of `google_dataproc_job` labels
* `schedulings`: an array of `google_dataproc_job` scheduling
* `job_uuids`: an array of `google_dataproc_job` job_uuid
* `dones`: an array of `google_dataproc_job` done
* `driver_scheduling_configs`: an array of `google_dataproc_job` driver_scheduling_config

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
