---
title: About the google_dataflow_project_location_job resource
platform: gcp
---

## Syntax
A `google_dataflow_project_location_job` is used to test a Google ProjectLocationJob resource

## Examples
```
describe google_dataflow_project_location_job(job: 'value_job_id', location: 'value_location', project: 'value_project') do
	it { should exist }
	its('id') { should cmp 'value_id' }
	its('project_id') { should cmp 'value_projectid' }
	its('name') { should cmp 'value_name' }
	its('type') { should cmp 'value_type' }
	its('steps_location') { should cmp 'value_stepslocation' }
	its('current_state') { should cmp 'value_currentstate' }
	its('current_state_time') { should cmp 'value_currentstatetime' }
	its('requested_state') { should cmp 'value_requestedstate' }
	its('create_time') { should cmp 'value_createtime' }
	its('replace_job_id') { should cmp 'value_replacejobid' }
	its('client_request_id') { should cmp 'value_clientrequestid' }
	its('replaced_by_job_id') { should cmp 'value_replacedbyjobid' }
	its('location') { should cmp 'value_location' }
	its('start_time') { should cmp 'value_starttime' }
	its('created_from_snapshot_id') { should cmp 'value_createdfromsnapshotid' }

end

describe google_dataflow_project_location_job(job: 'value_job_id', location: 'value_location', projectId: 'value_project') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_dataflow_project_location_job` resource:


  * `id`: The unique ID of this job. This field is set by the Dataflow service when the job is created, and is immutable for the life of the job.

  * `project_id`: The ID of the Google Cloud project that the job belongs to.

  * `name`: The user-specified Dataflow job name. Only one active job with a given name can exist in a project within one region at any given time. Jobs in different regions can have the same name. If a caller attempts to create a job with the same name as an active job that already exists, the attempt returns the existing job. The name must match the regular expression `[a-z]([-a-z0-9]{0,1022}[a-z0-9])?`

  * `type`: The type of Dataflow job.
  Possible values:
    * JOB_TYPE_UNKNOWN
    * JOB_TYPE_BATCH
    * JOB_TYPE_STREAMING

  * `environment`: Describes the environment in which a Dataflow Job runs.

    * `temp_storage_prefix`: The prefix of the resources the system should use for temporary storage. The system will append the suffix "/temp-{JOBNAME} to this resource prefix, where {JOBNAME} is the value of the job_name field. The resulting bucket and object prefix is used as the prefix of the resources used to store temporary data needed during the job execution. NOTE: This will override the value in taskrunner_settings. The supported resource type is: Google Cloud Storage: storage.googleapis.com/{bucket}/{object} bucket.storage.googleapis.com/{object}

    * `cluster_manager_api_service`: The type of cluster manager API to use. If unknown or unspecified, the service will attempt to choose a reasonable default. This should be in the form of the API service name, e.g. "compute.googleapis.com".

    * `experiments`: The list of experiments to enable. This field should be used for SDK related experiments and not for service related experiments. The proper field for service related experiments is service_options.

    * `service_options`: The list of service options to enable. This field should be used for service related experiments only. These experiments, when graduating to GA, should be replaced by dedicated fields or become default (i.e. always on).

    * `service_kms_key_name`: If set, contains the Cloud KMS key identifier used to encrypt data at rest, AKA a Customer Managed Encryption Key (CMEK). Format: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY

    * `worker_pools`: The worker pools. At least one "harness" worker pool must be specified in order for the job to have workers.

      * `kind`: The kind of the worker pool; currently only `harness` and `shuffle` are supported.

      * `num_workers`: Number of Google Compute Engine workers in this pool needed to execute the job. If zero or unspecified, the service will attempt to choose a reasonable default.

      * `packages`: Packages to be installed on workers.

        * `name`: The name of the package.

        * `location`: The resource to read the package from. The supported resource type is: Google Cloud Storage: storage.googleapis.com/{bucket} bucket.storage.googleapis.com/

      * `default_package_set`: The default package set to install. This allows the service to select a default set of packages which are useful to worker harnesses written in a particular language.
      Possible values:
        * DEFAULT_PACKAGE_SET_UNKNOWN
        * DEFAULT_PACKAGE_SET_NONE
        * DEFAULT_PACKAGE_SET_JAVA
        * DEFAULT_PACKAGE_SET_PYTHON

      * `machine_type`: Machine type (e.g. "n1-standard-1"). If empty or unspecified, the service will attempt to choose a reasonable default.

      * `teardown_policy`: Sets the policy for determining when to turndown worker pool. Allowed values are: `TEARDOWN_ALWAYS`, `TEARDOWN_ON_SUCCESS`, and `TEARDOWN_NEVER`. `TEARDOWN_ALWAYS` means workers are always torn down regardless of whether the job succeeds. `TEARDOWN_ON_SUCCESS` means workers are torn down if the job succeeds. `TEARDOWN_NEVER` means the workers are never torn down. If the workers are not torn down by the service, they will continue to run and use Google Compute Engine VM resources in the user's project until they are explicitly terminated by the user. Because of this, Google recommends using the `TEARDOWN_ALWAYS` policy except for small, manually supervised test jobs. If unknown or unspecified, the service will attempt to choose a reasonable default.
      Possible values:
        * TEARDOWN_POLICY_UNKNOWN
        * TEARDOWN_ALWAYS
        * TEARDOWN_ON_SUCCESS
        * TEARDOWN_NEVER

      * `disk_size_gb`: Size of root disk for VMs, in GB. If zero or unspecified, the service will attempt to choose a reasonable default.

      * `disk_type`: Type of root disk for VMs. If empty or unspecified, the service will attempt to choose a reasonable default.

      * `disk_source_image`: Fully qualified source image for disks.

      * `zone`: Zone to run the worker pools in. If empty or unspecified, the service will attempt to choose a reasonable default.

      * `taskrunner_settings`: Taskrunner configuration settings.

        * `task_user`: The UNIX user ID on the worker VM to use for tasks launched by taskrunner; e.g. "root".

        * `task_group`: The UNIX group ID on the worker VM to use for tasks launched by taskrunner; e.g. "wheel".

        * `oauth_scopes`: The OAuth2 scopes to be requested by the taskrunner in order to access the Cloud Dataflow API.

        * `base_url`: The base URL for the taskrunner to use when accessing Google Cloud APIs. When workers access Google Cloud APIs, they logically do so via relative URLs. If this field is specified, it supplies the base URL to use for resolving these relative URLs. The normative algorithm used is defined by RFC 1808, "Relative Uniform Resource Locators". If not specified, the default value is "http://www.googleapis.com/"

        * `dataflow_api_version`: The API version of endpoint, e.g. "v1b3"

        * `parallel_worker_settings`: Provides data to pass through to the worker harness.

          * `base_url`: The base URL for accessing Google Cloud APIs. When workers access Google Cloud APIs, they logically do so via relative URLs. If this field is specified, it supplies the base URL to use for resolving these relative URLs. The normative algorithm used is defined by RFC 1808, "Relative Uniform Resource Locators". If not specified, the default value is "http://www.googleapis.com/"

          * `reporting_enabled`: Whether to send work progress updates to the service.

          * `service_path`: The Cloud Dataflow service path relative to the root URL, for example, "dataflow/v1b3/projects".

          * `shuffle_service_path`: The Shuffle service path relative to the root URL, for example, "shuffle/v1beta1".

          * `worker_id`: The ID of the worker running this pipeline.

          * `temp_storage_prefix`: The prefix of the resources the system should use for temporary storage. The supported resource type is: Google Cloud Storage: storage.googleapis.com/{bucket}/{object} bucket.storage.googleapis.com/{object}

        * `base_task_dir`: The location on the worker for task-specific subdirectories.

        * `continue_on_exception`: Whether to continue taskrunner if an exception is hit.

        * `log_to_serialconsole`: Whether to send taskrunner log info to Google Compute Engine VM serial console.

        * `alsologtostderr`: Whether to also send taskrunner log info to stderr.

        * `log_upload_location`: Indicates where to put logs. If this is not specified, the logs will not be uploaded. The supported resource type is: Google Cloud Storage: storage.googleapis.com/{bucket}/{object} bucket.storage.googleapis.com/{object}

        * `log_dir`: The directory on the VM to store logs.

        * `temp_storage_prefix`: The prefix of the resources the taskrunner should use for temporary storage. The supported resource type is: Google Cloud Storage: storage.googleapis.com/{bucket}/{object} bucket.storage.googleapis.com/{object}

        * `harness_command`: The command to launch the worker harness.

        * `workflow_file_name`: The file to store the workflow in.

        * `commandlines_file_name`: The file to store preprocessing commands in.

        * `vm_id`: The ID string of the VM.

        * `language_hint`: The suggested backend language.

        * `streaming_worker_main_class`: The streaming worker main class name.

      * `on_host_maintenance`: The action to take on host maintenance, as defined by the Google Compute Engine API.

      * `data_disks`: Data disks that are used by a VM in this workflow.

        * `size_gb`: Size of disk in GB. If zero or unspecified, the service will attempt to choose a reasonable default.

        * `disk_type`: Disk storage type, as defined by Google Compute Engine. This must be a disk type appropriate to the project and zone in which the workers will run. If unknown or unspecified, the service will attempt to choose a reasonable default. For example, the standard persistent disk type is a resource name typically ending in "pd-standard". If SSD persistent disks are available, the resource name typically ends with "pd-ssd". The actual valid values are defined the Google Compute Engine API, not by the Cloud Dataflow API; consult the Google Compute Engine documentation for more information about determining the set of available disk types for a particular project and zone. Google Compute Engine Disk types are local to a particular project in a particular zone, and so the resource name will typically look something like this: compute.googleapis.com/projects/project-id/zones/zone/diskTypes/pd-standard

        * `mount_point`: Directory in a VM where disk is mounted.

      * `metadata`: Metadata to set on the Google Compute Engine VMs.

        * `additional_properties`:

      * `autoscaling_settings`: Settings for WorkerPool autoscaling.

        * `algorithm`: The algorithm to use for autoscaling.
        Possible values:
          * AUTOSCALING_ALGORITHM_UNKNOWN
          * AUTOSCALING_ALGORITHM_NONE
          * AUTOSCALING_ALGORITHM_BASIC

        * `max_num_workers`: The maximum number of workers to cap scaling at.

      * `pool_args`: Extra arguments for this worker pool.

        * `additional_properties`: Properties of the object. Contains field @type with type URL.

      * `network`: Network to which VMs will be assigned. If empty or unspecified, the service will use the network "default".

      * `subnetwork`: Subnetwork to which VMs will be assigned, if desired. Expected to be of the form "regions/REGION/subnetworks/SUBNETWORK".

      * `worker_harness_container_image`: Required. Docker container image that executes the Cloud Dataflow worker harness, residing in Google Container Registry. Deprecated for the Fn API path. Use sdk_harness_container_images instead.

      * `num_threads_per_worker`: The number of threads per worker harness. If empty or unspecified, the service will choose a number of threads (according to the number of cores on the selected machine type for batch, or 1 by convention for streaming).

      * `ip_configuration`: Configuration for VM IPs.
      Possible values:
        * WORKER_IP_UNSPECIFIED
        * WORKER_IP_PUBLIC
        * WORKER_IP_PRIVATE

      * `sdk_harness_container_images`: Set of SDK harness containers needed to execute this pipeline. This will only be set in the Fn API path. For non-cross-language pipelines this should have only one entry. Cross-language pipelines will have two or more entries.

        * `container_image`: A docker container image that resides in Google Container Registry.

        * `use_single_core_per_container`: If true, recommends the Dataflow service to use only one core per SDK container instance with this image. If false (or unset) recommends using more than one core per SDK container instance with this image for efficiency. Note that Dataflow service may choose to override this property if needed.

        * `environment_id`: Environment ID for the Beam runner API proto Environment that corresponds to the current SDK Harness.

        * `capabilities`: The set of capabilities enumerated in the above Environment proto. See also [beam_runner_api.proto](https://github.com/apache/beam/blob/master/model/pipeline/src/main/proto/org/apache/beam/model/pipeline/v1/beam_runner_api.proto)

    * `user_agent`: A description of the process that generated the request.

      * `additional_properties`: Properties of the object.

    * `version`: A structure describing which components and their versions of the service are required in order to run the job.

      * `additional_properties`: Properties of the object.

    * `dataset`: The dataset for the current project where various workflow related tables are stored. The supported resource type is: Google BigQuery: bigquery.googleapis.com/{dataset}

    * `sdk_pipeline_options`: The Cloud Dataflow SDK pipeline options specified by the user. These options are passed through the service and are used to recreate the SDK pipeline options on the worker in a language agnostic and platform independent way.

      * `additional_properties`: Properties of the object.

    * `internal_experiments`: Experimental settings.

      * `additional_properties`: Properties of the object. Contains field @type with type URL.

    * `service_account_email`: Identity to run virtual machines as. Defaults to the default account.

    * `flex_resource_scheduling_goal`: Which Flexible Resource Scheduling mode to run in.
    Possible values:
      * FLEXRS_UNSPECIFIED
      * FLEXRS_SPEED_OPTIMIZED
      * FLEXRS_COST_OPTIMIZED

    * `worker_region`: The Compute Engine region (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in which worker processing should occur, e.g. "us-west1". Mutually exclusive with worker_zone. If neither worker_region nor worker_zone is specified, default to the control plane's region.

    * `worker_zone`: The Compute Engine zone (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in which worker processing should occur, e.g. "us-west1-a". Mutually exclusive with worker_region. If neither worker_region nor worker_zone is specified, a zone in the control plane's region is chosen based on available capacity.

    * `shuffle_mode`: Output only. The shuffle mode used for the job.
    Possible values:
      * SHUFFLE_MODE_UNSPECIFIED
      * VM_BASED
      * SERVICE_BASED

    * `debug_options`: Describes any options that have an effect on the debugging of pipelines.

      * `enable_hot_key_logging`: When true, enables the logging of the literal hot key to the user's Cloud Logging.

      * `data_sampling`: Configuration options for sampling elements.

        * `behaviors`: List of given sampling behaviors to enable. For example, specifying behaviors = [ALWAYS_ON] samples in-flight elements but does not sample exceptions. Can be used to specify multiple behaviors like, behaviors = [ALWAYS_ON, EXCEPTIONS] for specifying periodic sampling and exception sampling. If DISABLED is in the list, then sampling will be disabled and ignore the other given behaviors. Ordering does not matter.

    * `use_streaming_engine_resource_based_billing`: Output only. Whether the job uses the Streaming Engine resource-based billing model.

    * `streaming_mode`: Optional. Specifies the Streaming Engine message processing guarantees. Reduces cost and latency but might result in duplicate messages committed to storage. Designed to run simple mapping streaming ETL jobs at the lowest cost. For example, Change Data Capture (CDC) to BigQuery is a canonical use case.
    Possible values:
      * STREAMING_MODE_UNSPECIFIED
      * STREAMING_MODE_EXACTLY_ONCE
      * STREAMING_MODE_AT_LEAST_ONCE

  * `steps`: Exactly one of step or steps_location should be specified. The top-level steps that constitute the entire job. Only retrieved with JOB_VIEW_ALL.

    * `kind`: The kind of step in the Cloud Dataflow job.

    * `name`: The name that identifies the step. This must be unique for each step with respect to all other steps in the Cloud Dataflow job.

    * `properties`: Named properties associated with the step. Each kind of predefined step has its own required set of properties. Must be provided on Create. Only retrieved with JOB_VIEW_ALL.

      * `additional_properties`: Properties of the object.

  * `steps_location`: The Cloud Storage location where the steps are stored.

  * `current_state`: The current state of the job. Jobs are created in the `JOB_STATE_STOPPED` state unless otherwise specified. A job in the `JOB_STATE_RUNNING` state may asynchronously enter a terminal state. After a job has reached a terminal state, no further state updates may be made. This field might be mutated by the Dataflow service; callers cannot mutate it.
  Possible values:
    * JOB_STATE_UNKNOWN
    * JOB_STATE_STOPPED
    * JOB_STATE_RUNNING
    * JOB_STATE_DONE
    * JOB_STATE_FAILED
    * JOB_STATE_CANCELLED
    * JOB_STATE_UPDATED
    * JOB_STATE_DRAINING
    * JOB_STATE_DRAINED
    * JOB_STATE_PENDING
    * JOB_STATE_CANCELLING
    * JOB_STATE_QUEUED
    * JOB_STATE_RESOURCE_CLEANING_UP

  * `current_state_time`: The timestamp associated with the current state.

  * `requested_state`: The job's requested state. Applies to `UpdateJob` requests. Set `requested_state` with `UpdateJob` requests to switch between the states `JOB_STATE_STOPPED` and `JOB_STATE_RUNNING`. You can also use `UpdateJob` requests to change a job's state from `JOB_STATE_RUNNING` to `JOB_STATE_CANCELLED`, `JOB_STATE_DONE`, or `JOB_STATE_DRAINED`. These states irrevocably terminate the job if it hasn't already reached a terminal state. This field has no effect on `CreateJob` requests.
  Possible values:
    * JOB_STATE_UNKNOWN
    * JOB_STATE_STOPPED
    * JOB_STATE_RUNNING
    * JOB_STATE_DONE
    * JOB_STATE_FAILED
    * JOB_STATE_CANCELLED
    * JOB_STATE_UPDATED
    * JOB_STATE_DRAINING
    * JOB_STATE_DRAINED
    * JOB_STATE_PENDING
    * JOB_STATE_CANCELLING
    * JOB_STATE_QUEUED
    * JOB_STATE_RESOURCE_CLEANING_UP

  * `execution_info`: Additional information about how a Cloud Dataflow job will be executed that isn't contained in the submitted job.

    * `stages`: A mapping from each stage to the information about that stage.

      * `additional_properties`: Contains information about how a particular google.dataflow.v1beta3.Step will be executed.

  * `create_time`: The timestamp when the job was initially created. Immutable and set by the Cloud Dataflow service.

  * `replace_job_id`: If this job is an update of an existing job, this field is the job ID of the job it replaced. When sending a `CreateJobRequest`, you can update a job by specifying it here. The job named here is stopped, and its intermediate state is transferred to this job.

  * `transform_name_mapping`: The map of transform name prefixes of the job to be replaced to the corresponding name prefixes of the new job.

    * `additional_properties`:

  * `client_request_id`: The client's unique identifier of the job, re-used across retried attempts. If this field is set, the service will ensure its uniqueness. The request to create a job will fail if the service has knowledge of a previously submitted job with the same client's ID and job name. The caller may use this field to ensure idempotence of job creation across retried attempts to create a job. By default, the field is empty and, in that case, the service ignores it.

  * `replaced_by_job_id`: If another job is an update of this job (and thus, this job is in `JOB_STATE_UPDATED`), this field contains the ID of that job.

  * `temp_files`: A set of files the system should be aware of that are used for temporary storage. These temporary files will be removed on job completion. No duplicates are allowed. No file patterns are supported. The supported files are: Google Cloud Storage: storage.googleapis.com/{bucket}/{object} bucket.storage.googleapis.com/{object}

  * `labels`: User-defined labels for this job. The labels map can contain no more than 64 entries. Entries of the labels map are UTF8 strings that comply with the following restrictions: * Keys must conform to regexp: \p{Ll}\p{Lo}{0,62} * Values must conform to regexp: [\p{Ll}\p{Lo}\p{N}_-]{0,63} * Both keys and values are additionally constrained to be <= 128 bytes in size.

    * `additional_properties`:

  * `location`: The [regional endpoint] (https://cloud.google.com/dataflow/docs/concepts/regional-endpoints) that contains this job.

  * `pipeline_description`: A descriptive representation of submitted pipeline as well as the executed form. This data is provided by the Dataflow service for ease of visualizing the pipeline and interpreting Dataflow provided metrics.

    * `original_pipeline_transform`: Description of each transform in the pipeline and collections between them.

      * `kind`: Type of transform.
      Possible values:
        * UNKNOWN_KIND
        * PAR_DO_KIND
        * GROUP_BY_KEY_KIND
        * FLATTEN_KIND
        * READ_KIND
        * WRITE_KIND
        * CONSTANT_KIND
        * SINGLETON_KIND
        * SHUFFLE_KIND

      * `id`: SDK generated id of this transform instance.

      * `name`: User provided name for this transform instance.

      * `display_data`: Transform-specific display data.

        * `key`: The key identifying the display data. This is intended to be used as a label for the display data when viewed in a dax monitoring system.

        * `namespace`: The namespace for the key. This is usually a class name or programming language namespace (i.e. python module) which defines the display data. This allows a dax monitoring system to specially handle the data and perform custom rendering.

        * `str_value`: Contains value if the data is of string type.

        * `int64_value`: Contains value if the data is of int64 type.

        * `float_value`: Contains value if the data is of float type.

        * `java_class_value`: Contains value if the data is of java class type.

        * `timestamp_value`: Contains value if the data is of timestamp type.

        * `duration_value`: Contains value if the data is of duration type.

        * `bool_value`: Contains value if the data is of a boolean type.

        * `short_str_value`: A possible additional shorter value to display. For example a java_class_name_value of com.mypackage.MyDoFn will be stored with MyDoFn as the short_str_value and com.mypackage.MyDoFn as the java_class_name value. short_str_value can be displayed and java_class_name_value will be displayed as a tooltip.

        * `url`: An optional full URL.

        * `label`: An optional label to display in a dax UI for the element.

      * `output_collection_name`: User names for all collection outputs to this transform.

      * `input_collection_name`: User names for all collection inputs to this transform.

    * `execution_pipeline_stage`: Description of each stage of execution of the pipeline.

      * `name`: Dataflow service generated name for this stage.

      * `id`: Dataflow service generated id for this stage.

      * `kind`: Type of transform this stage is executing.
      Possible values:
        * UNKNOWN_KIND
        * PAR_DO_KIND
        * GROUP_BY_KEY_KIND
        * FLATTEN_KIND
        * READ_KIND
        * WRITE_KIND
        * CONSTANT_KIND
        * SINGLETON_KIND
        * SHUFFLE_KIND

      * `input_source`: Input sources for this stage.

        * `user_name`: Human-readable name for this source; may be user or system generated.

        * `name`: Dataflow service generated name for this source.

        * `original_transform_or_collection`: User name for the original user transform or collection with which this source is most closely associated.

        * `size_bytes`: Size of the source, if measurable.

      * `output_source`: Output sources for this stage.

        * `user_name`: Human-readable name for this source; may be user or system generated.

        * `name`: Dataflow service generated name for this source.

        * `original_transform_or_collection`: User name for the original user transform or collection with which this source is most closely associated.

        * `size_bytes`: Size of the source, if measurable.

      * `prerequisite_stage`: Other stages that must complete before this stage can run.

      * `component_transform`: Transforms that comprise this execution stage.

        * `user_name`: Human-readable name for this transform; may be user or system generated.

        * `name`: Dataflow service generated name for this source.

        * `original_transform`: User name for the original user transform with which this transform is most closely associated.

      * `component_source`: Collections produced and consumed by component transforms of this stage.

        * `user_name`: Human-readable name for this transform; may be user or system generated.

        * `name`: Dataflow service generated name for this source.

        * `original_transform_or_collection`: User name for the original user transform or collection with which this source is most closely associated.

    * `display_data`: Pipeline level display data.

      * `key`: The key identifying the display data. This is intended to be used as a label for the display data when viewed in a dax monitoring system.

      * `namespace`: The namespace for the key. This is usually a class name or programming language namespace (i.e. python module) which defines the display data. This allows a dax monitoring system to specially handle the data and perform custom rendering.

      * `str_value`: Contains value if the data is of string type.

      * `int64_value`: Contains value if the data is of int64 type.

      * `float_value`: Contains value if the data is of float type.

      * `java_class_value`: Contains value if the data is of java class type.

      * `timestamp_value`: Contains value if the data is of timestamp type.

      * `duration_value`: Contains value if the data is of duration type.

      * `bool_value`: Contains value if the data is of a boolean type.

      * `short_str_value`: A possible additional shorter value to display. For example a java_class_name_value of com.mypackage.MyDoFn will be stored with MyDoFn as the short_str_value and com.mypackage.MyDoFn as the java_class_name value. short_str_value can be displayed and java_class_name_value will be displayed as a tooltip.

      * `url`: An optional full URL.

      * `label`: An optional label to display in a dax UI for the element.

    * `step_names_hash`: A hash value of the submitted pipeline portable graph step names if exists.

  * `stage_states`: This field may be mutated by the Cloud Dataflow service; callers cannot mutate it.

    * `execution_stage_name`: The name of the execution stage.

    * `execution_stage_state`: Executions stage states allow the same set of values as JobState.
    Possible values:
      * JOB_STATE_UNKNOWN
      * JOB_STATE_STOPPED
      * JOB_STATE_RUNNING
      * JOB_STATE_DONE
      * JOB_STATE_FAILED
      * JOB_STATE_CANCELLED
      * JOB_STATE_UPDATED
      * JOB_STATE_DRAINING
      * JOB_STATE_DRAINED
      * JOB_STATE_PENDING
      * JOB_STATE_CANCELLING
      * JOB_STATE_QUEUED
      * JOB_STATE_RESOURCE_CLEANING_UP

    * `current_state_time`: The time at which the stage transitioned to this state.

  * `job_metadata`: Metadata available primarily for filtering jobs. Will be included in the ListJob response and Job SUMMARY view.

    * `sdk_version`: The version of the SDK used to run the job.

      * `version`: The version of the SDK used to run the job.

      * `version_display_name`: A readable string describing the version of the SDK.

      * `sdk_support_status`: The support status for this SDK version.
      Possible values:
        * UNKNOWN
        * SUPPORTED
        * STALE
        * DEPRECATED
        * UNSUPPORTED

      * `bugs`: Output only. Known bugs found in this SDK version.

        * `type`: Output only. Describes the impact of this SDK bug.
        Possible values:
          * TYPE_UNSPECIFIED
          * GENERAL
          * PERFORMANCE
          * DATALOSS

        * `severity`: Output only. How severe the SDK bug is.
        Possible values:
          * SEVERITY_UNSPECIFIED
          * NOTICE
          * WARNING
          * SEVERE

        * `uri`: Output only. Link to more information on the bug.

    * `spanner_details`: Identification of a Spanner source used in the Dataflow job.

      * `project_id`: ProjectId accessed in the connection.

      * `instance_id`: InstanceId accessed in the connection.

      * `database_id`: DatabaseId accessed in the connection.

    * `bigquery_details`: Identification of a BigQuery source used in the Dataflow job.

      * `table`: Table accessed in the connection.

      * `dataset`: Dataset accessed in the connection.

      * `project_id`: Project accessed in the connection.

      * `query`: Query used to access data in the connection.

    * `big_table_details`: Identification of a Cloud Bigtable source used in the Dataflow job.

      * `project_id`: ProjectId accessed in the connection.

      * `instance_id`: InstanceId accessed in the connection.

      * `table_id`: TableId accessed in the connection.

    * `pubsub_details`: Identification of a Pub/Sub source used in the Dataflow job.

      * `topic`: Topic accessed in the connection.

      * `subscription`: Subscription used in the connection.

    * `file_details`: Identification of a File source used in the Dataflow job.

      * `file_pattern`: File Pattern used to access files by the connector.

    * `datastore_details`: Identification of a Datastore source used in the Dataflow job.

      * `namespace`: Namespace used in the connection.

      * `project_id`: ProjectId accessed in the connection.

    * `user_display_properties`: List of display properties to help UI filter jobs.

      * `additional_properties`:

  * `start_time`: The timestamp when the job was started (transitioned to JOB_STATE_PENDING). Flexible resource scheduling jobs are started with some delay after job creation, so start_time is unset before start and is updated when the job is started by the Cloud Dataflow service. For other jobs, start_time always equals to create_time and is immutable and set by the Cloud Dataflow service.

  * `created_from_snapshot_id`: If this is specified, the job's initial state is populated from the given snapshot.

  * `satisfies_pzs`: Reserved for future use. This field is set only in responses from the server; it is ignored if it is set in any requests.

  * `runtime_updatable_params`: Additional job parameters that can only be updated during runtime using the projects.jobs.update method. These fields have no effect when specified during job creation.

    * `max_num_workers`: The maximum number of workers to cap autoscaling at. This field is currently only supported for Streaming Engine jobs.

    * `min_num_workers`: The minimum number of workers to scale down to. This field is currently only supported for Streaming Engine jobs.

    * `worker_utilization_hint`: Target worker utilization, compared against the aggregate utilization of the worker pool by autoscaler, to determine upscaling and downscaling when absent other constraints such as backlog.

  * `satisfies_pzi`: Output only. Reserved for future use. This field is set only in responses from the server; it is ignored if it is set in any requests.


## GCP Permissions

Ensure the [https://dataflow.googleapis.com/](https://console.cloud.google.com/apis/library/dataflow.googleapis.com/) is enabled for the current project.
