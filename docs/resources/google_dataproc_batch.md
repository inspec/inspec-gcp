+++
title = "google_dataproc_batch Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_dataproc_batch"
identifier = "inspec/resources/gcp/google_dataproc_batch Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_batch` InSpec audit resource to test the properties of a Google Cloud Batch resource.

## Examples

```ruby
describe google_dataproc_batch(name: 'projects/*/locations/*/batches/value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('uuid') { should cmp 'value_uuid' }
	its('create_time') { should cmp 'value_createtime' }
	its('state') { should cmp 'value_state' }
	its('state_message') { should cmp 'value_statemessage' }
	its('state_time') { should cmp 'value_statetime' }
	its('creator') { should cmp 'value_creator' }
	its('operation') { should cmp 'value_operation' }
end

describe google_dataproc_batch(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters

Parameters that can be accessed from the `google_dataproc_batch` resource:

## Properties

Properties that can be accessed from the `google_dataproc_batch` resource:


  * `name`: Output only. The resource name of the batch.

  * `uuid`: Output only. A batch UUID (Unique Universal Identifier). The service generates this value when it creates the batch.

  * `create_time`: Output only. The time when the batch was created.

  * `pyspark_batch`: A configuration for running an Apache PySpark (https://spark.apache.org/docs/latest/api/python/getting_started/quickstart.html) batch workload.

    * `main_python_file_uri`: Required. The HCFS URI of the main Python file to use as the Spark driver. Must be a .py file.

    * `args`: Optional. The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission.

    * `python_file_uris`: Optional. HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip.

    * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the classpath of the Spark driver and tasks.

    * `file_uris`: Optional. HCFS URIs of files to be placed in the working directory of each executor.

    * `archive_uris`: Optional. HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.

  * `spark_batch`: A configuration for running an Apache Spark (https://spark.apache.org/) batch workload.

    * `main_jar_file_uri`: Optional. The HCFS URI of the jar file that contains the main class.

    * `main_class`: Optional. The name of the driver main class. The jar file that contains the class must be in the classpath or specified in jar_file_uris.

    * `args`: Optional. The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission.

    * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the classpath of the Spark driver and tasks.

    * `file_uris`: Optional. HCFS URIs of files to be placed in the working directory of each executor.

    * `archive_uris`: Optional. HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.

  * `spark_r_batch`: A configuration for running an Apache SparkR (https://spark.apache.org/docs/latest/sparkr.html) batch workload.

    * `main_r_file_uri`: Required. The HCFS URI of the main R file to use as the driver. Must be a .R or .r file.

    * `args`: Optional. The arguments to pass to the Spark driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission.

    * `file_uris`: Optional. HCFS URIs of files to be placed in the working directory of each executor.

    * `archive_uris`: Optional. HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.

  * `spark_sql_batch`: A configuration for running Apache Spark SQL (https://spark.apache.org/sql/) queries as a batch workload.

    * `query_file_uri`: Required. The HCFS URI of the script that contains Spark SQL queries to execute.

    * `query_variables`: Optional. Mapping of query variable names to values (equivalent to the Spark SQL command: SET name="value";).

      * `additional_properties`:

    * `jar_file_uris`: Optional. HCFS URIs of jar files to be added to the Spark CLASSPATH.

  * `runtime_info`: Runtime information about workload execution.

    * `endpoints`: Output only. Map of remote access endpoints (such as web interfaces and APIs) to their URIs.

      * `additional_properties`:

    * `output_uri`: Output only. A URI pointing to the location of the stdout and stderr of the workload.

    * `diagnostic_output_uri`: Output only. A URI pointing to the location of the diagnostics tarball.

    * `approximate_usage`: Usage metrics represent approximate total resources consumed by a workload.

      * `milli_dcu_seconds`: Optional. DCU (Dataproc Compute Units) usage in (milliDCU x seconds) (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing)).

      * `shuffle_storage_gb_seconds`: Optional. Shuffle storage usage in (GB x seconds) (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing)).

      * `milli_accelerator_seconds`: Optional. Accelerator usage in (milliAccelerator x seconds) (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing)).

      * `accelerator_type`: Optional. Accelerator type being used, if any

    * `current_usage`: The usage snapshot represents the resources consumed by a workload at a specified time.

      * `milli_dcu`: Optional. Milli (one-thousandth) Dataproc Compute Units (DCUs) (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing)).

      * `shuffle_storage_gb`: Optional. Shuffle Storage in gigabytes (GB). (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing))

      * `milli_dcu_premium`: Optional. Milli (one-thousandth) Dataproc Compute Units (DCUs) charged at premium tier (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing)).

      * `shuffle_storage_gb_premium`: Optional. Shuffle Storage in gigabytes (GB) charged at premium tier. (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing))

      * `milli_accelerator`: Optional. Milli (one-thousandth) accelerator. (see Dataproc Serverless pricing (https://cloud.google.com/dataproc-serverless/pricing))

      * `accelerator_type`: Optional. Accelerator type being used, if any

      * `snapshot_time`: Optional. The timestamp of the usage snapshot.

  * `state`: Output only. The state of the batch.
  Possible values:
    * STATE_UNSPECIFIED
    * PENDING
    * RUNNING
    * CANCELLING
    * CANCELLED
    * SUCCEEDED
    * FAILED

  * `state_message`: Output only. Batch state details, such as a failure description if the state is FAILED.

  * `state_time`: Output only. The time when the batch entered a current state.

  * `creator`: Output only. The email address of the user who created the batch.

  * `labels`: Optional. The labels to associate with this batch. Label keys must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). Label values may be empty, but, if present, must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a batch.

    * `additional_properties`:

  * `runtime_config`: Runtime configuration for a workload.

    * `version`: Optional. Version of the batch runtime.

    * `container_image`: Optional. Optional custom container image for the job runtime environment. If not specified, a default container image will be used.

    * `properties`: Optional. A mapping of property names to values, which are used to configure workload execution.

      * `additional_properties`:

    * `repository_config`: Configuration for dependency repositories

      * `pypi_repository_config`: Configuration for PyPi repository

        * `pypi_repository`: Optional. PyPi repository address

  * `environment_config`: Environment configuration for a workload.

    * `execution_config`: Execution configuration for a workload.

      * `service_account`: Optional. Service account that used to execute workload.

      * `network_uri`: Optional. Network URI to connect workload to.

      * `subnetwork_uri`: Optional. Subnetwork URI to connect workload to.

      * `network_tags`: Optional. Tags used for network traffic control.

      * `kms_key`: Optional. The Cloud KMS key to use for encryption.

      * `idle_ttl`: Optional. Applies to sessions only. The duration to keep the session alive while it's idling. Exceeding this threshold causes the session to terminate. This field cannot be set on a batch workload. Minimum value is 10 minutes; maximum value is 14 days (see JSON representation of Duration (https://developers.google.com/protocol-buffers/docs/proto3#json)). Defaults to 1 hour if not set. If both ttl and idle_ttl are specified for an interactive session, the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idle_ttl or when ttl has been exceeded, whichever occurs first.

      * `ttl`: Optional. The duration after which the workload will be terminated, specified as the JSON representation for Duration (https://protobuf.dev/programming-guides/proto3/#json). When the workload exceeds this duration, it will be unconditionally terminated without waiting for ongoing work to finish. If ttl is not specified for a batch workload, the workload will be allowed to run until it exits naturally (or run forever without exiting). If ttl is not specified for an interactive session, it defaults to 24 hours. If ttl is not specified for a batch that uses 2.1+ runtime version, it defaults to 4 hours. Minimum value is 10 minutes; maximum value is 14 days. If both ttl and idle_ttl are specified (for an interactive session), the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idle_ttl or when ttl has been exceeded, whichever occurs first.

      * `staging_bucket`: Optional. A Cloud Storage bucket used to stage workload dependencies, config files, and store workload output and other ephemeral data, such as Spark history files. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location according to the region where your workload is running, and then create and manage project-level, per-location staging and temporary buckets. This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket.

    * `peripherals_config`: Auxiliary services configuration for a workload.

      * `metastore_service`: Optional. Resource name of an existing Dataproc Metastore service.Example: projects/[project_id]/locations/[region]/services/[service_id]

      * `spark_history_server_config`: Spark History Server configuration for the workload.

        * `dataproc_cluster`: Optional. Resource name of an existing Dataproc Cluster to act as a Spark History Server for the workload.Example: projects/[project_id]/regions/[region]/clusters/[cluster_name]

  * `operation`: Output only. The resource name of the operation associated with this batch.

  * `state_history`: Output only. Historical state information for the batch.

    * `state`: Output only. The state of the batch at this point in history.
    Possible values:
      * STATE_UNSPECIFIED
      * PENDING
      * RUNNING
      * CANCELLING
      * CANCELLED
      * SUCCEEDED
      * FAILED

    * `state_message`: Output only. Details about the state at this point in history.

    * `state_start_time`: Output only. The time when the batch entered the historical state.


## GCP permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
