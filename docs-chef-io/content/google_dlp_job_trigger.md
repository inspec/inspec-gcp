+++
title = "google_dlp_job_trigger resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_job_trigger"
identifier = "inspec/resources/gcp/google_dlp_job_trigger resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_job_trigger` InSpec audit resource to to test a Google Cloud JobTrigger resource.

## Examples

```ruby
describe google_dlp_job_trigger(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}",name: 'name1') do
it { should exist }
its('name') { should cmp 'name1' }
its('display_name') { should cmp 'dp' }
its('description') { should cmp 'description' }
its('status') { should cmp 'HEALTHY' }
end

describe google_dlp_job_trigger(parent: 'chef-gcp-inspec', name: 'nonexistent') do
it { should_not exist }
end

```

## Properties

Properties that can be accessed from the `google_dlp_job_trigger` resource:


  * `name`: The resource name of the job trigger.Set by the server.

  * `description`: A description of the job trigger.

  * `display_name`: User set display name of the job trigger.

  * `last_run_time`: The timestamp of the last time this trigger executed.

  * `status`: Whether the trigger is currently active.
  Possible values:
    * PAUSED
    * HEALTHY
    * CANCELLED

  * `triggers`: What event needs to occur for a new job to be started.

    * `schedule`: Schedule for triggered jobs

      * `recurrence_period_duration`: With this option a job is started a regular periodic basis. For example: every day (86400 seconds).  A scheduled start time will be skipped if the previous execution has not ended when its scheduled time occurs.  This value must be set to a time duration greater than or equal to 1 day and can be no longer than 60 days.  A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

  * `inspect_job`: Controls what and how to inspect for findings.

    * `inspect_template_name`: The name of the template to run when this job is triggered.

    * `storage_config`: Information on where to inspect

      * `timespan_config`: Information on where to inspect

        * `start_time`: Exclude files or rows older than this value.

        * `end_time`: Exclude files or rows newer than this value. If set to zero, no upper time limit is applied.

        * `enable_auto_population_of_timespan_config`: When the job is started by a JobTrigger we will automatically figure out a valid startTime to avoid scanning files that have not been modified since the last time the JobTrigger executed. This will be based on the time of the execution of the last run of the JobTrigger.

        * `timestamp_field`: Information on where to inspect

          * `name`: Specification of the field containing the timestamp of scanned items. Used for data sources like Datastore and BigQuery.  For BigQuery: Required to filter out rows based on the given start and end times. If not specified and the table was modified between the given start and end times, the entire table will be scanned. The valid data types of the timestamp field are: INTEGER, DATE, TIMESTAMP, or DATETIME BigQuery column.  For Datastore. Valid data types of the timestamp field are: TIMESTAMP. Datastore entity will be scanned if the timestamp property does not exist or its value is empty or invalid.

      * `datastore_options`: Options defining a data set within Google Cloud Datastore.

        * `partition_id`: Datastore partition ID. A partition ID identifies a grouping of entities. The grouping is always by project and namespace, however the namespace ID may be empty.

          * `project_id`: The ID of the project to which the entities belong.

          * `namespace_id`: If not empty, the ID of the namespace to which the entities belong.

        * `kind`: A representation of a Datastore kind.

          * `name`: The name of the Datastore kind.

      * `cloud_storage_options`: Options defining a file or a set of files within a Google Cloud Storage bucket.

        * `file_set`: Set of files to scan.

          * `url`: The Cloud Storage url of the file(s) to scan, in the format `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed.  If the url ends in a trailing slash, the bucket or directory represented by the url will be scanned non-recursively (content in sub-directories will not be scanned). This means that `gs://mybucket/` is equivalent to `gs://mybucket/*`, and `gs://mybucket/directory/` is equivalent to `gs://mybucket/directory/*`.

          * `regex_file_set`: The regex-filtered set of files to scan.

            * `bucket_name`: The name of a Cloud Storage bucket.

            * `include_regex`: A list of regular expressions matching file paths to include. All files in the bucket that match at least one of these regular expressions will be included in the set of files, except for those that also match an item in excludeRegex. Leaving this field empty will match all files by default (this is equivalent to including .* in the list)

            * `exclude_regex`: A list of regular expressions matching file paths to exclude. All files in the bucket that match at least one of these regular expressions will be excluded from the scan.

        * `bytes_limit_per_file`: Max number of bytes to scan from a file. If a scanned file's size is bigger than this value then the rest of the bytes are omitted.

        * `bytes_limit_per_file_percent`: Max percentage of bytes to scan from a file. The rest are omitted. The number of bytes scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit.

        * `files_limit_percent`: Limits the number of files to scan to this percentage of the input FileSet. Number of files scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit.

        * `file_types`: List of file type groups to include in the scan. If empty, all files are scanned and available data format processors are applied. In addition, the binary content of the selected files is always scanned as well. Images are scanned only as binary if the specified region does not support image inspection and no fileTypes were specified.

        * `sample_method`: How to sample bytes if not all bytes are scanned. Meaningful only when used in conjunction with bytesLimitPerFile. If not specified, scanning would start from the top.
        Possible values:
          * TOP
          * RANDOM_START

      * `big_query_options`: Options defining BigQuery table and row identifiers.

        * `table_reference`: Set of files to scan.

          * `project_id`: The Google Cloud Platform project ID of the project containing the table.

          * `dataset_id`: The dataset ID of the table.

          * `table_id`: The name of the table.

    * `actions`: A task to execute on the completion of a job.

      * `save_findings`: Schedule for triggered jobs

        * `output_config`: Information on where to store output

          * `table`: Information on the location of the target BigQuery Table.

            * `project_id`: The Google Cloud Platform project ID of the project containing the table.

            * `dataset_id`: Dataset ID of the table.

            * `table_id`: Name of the table. If is not set a new one will be generated for you with the following format: `dlp_googleapis_yyyy_mm_dd_[dlp_job_id]`. Pacific timezone will be used for generating the date details.

          * `output_schema`: Schema used for writing the findings for Inspect jobs. This field is only used for Inspect and must be unspecified for Risk jobs. Columns are derived from the Finding object. If appending to an existing table, any columns from the predefined schema that are missing will be added. No columns in the existing table will be deleted.  If unspecified, then all available columns will be used for a new table or an (existing) table with no schema, and no changes will be made to an existing table that has a schema. Only for use with external storage.
          Possible values:
            * BASIC_COLUMNS
            * GCS_COLUMNS
            * DATASTORE_COLUMNS
            * BIG_QUERY_COLUMNS
            * ALL_COLUMNS

  * `parent`: The parent of the trigger, either in the format `projects/{{project}}` or  `projects/{{project}}/locations/{{location}}`


## GCP permissions
