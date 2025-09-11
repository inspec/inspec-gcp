+++
title = "google_vertex_ai_schedule resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_schedule"
identifier = "inspec/resources/gcp/google_vertex_ai_schedule resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_schedule` InSpec audit resource to to test a Google Cloud Schedule resource.

## Examples

```ruby
describe google_vertex_ai_schedule(name: "projects/#{gcp_project_id}/locations/#{schedule['region']}/schedules/#{schedule['name']}", region: ' value_region') do
	it { should exist }
	its('started_run_count') { should cmp 'value_startedruncount' }
	its('name') { should cmp 'value_name' }
	its('cron') { should cmp 'value_cron' }
	its('last_pause_time') { should cmp 'value_lastpausetime' }
	its('create_time') { should cmp 'value_createtime' }
	its('start_time') { should cmp 'value_starttime' }
	its('max_run_count') { should cmp 'value_maxruncount' }
	its('next_run_time') { should cmp 'value_nextruntime' }
	its('update_time') { should cmp 'value_updatetime' }
	its('last_resume_time') { should cmp 'value_lastresumetime' }
	its('max_concurrent_run_count') { should cmp 'value_maxconcurrentruncount' }
	its('state') { should cmp 'value_state' }
	its('display_name') { should cmp 'value_displayname' }
	its('end_time') { should cmp 'value_endtime' }

end

describe google_vertex_ai_schedule(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_schedule` resource:


  * `started_run_count`: Output only. The number of runs started by this schedule.

  * `allow_queueing`: Optional. Whether new scheduled runs can be queued when max_concurrent_runs limit is reached. If set to true, new runs will be queued instead of skipped. Default to false.

  * `name`: Immutable. The resource name of the Schedule.

  * `cron`: Cron schedule (https://en.wikipedia.org/wiki/Cron) to launch scheduled runs. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or "TZ=${IANA_TIME_ZONE}". The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, "CRON_TZ=America/New_York 1 * * * *", or "TZ=America/New_York 1 * * * *".

  * `last_pause_time`: Output only. Timestamp when this Schedule was last paused. Unset if never paused.

  * `create_time`: Output only. Timestamp when this Schedule was created.

  * `start_time`: Optional. Timestamp after which the first run can be scheduled. Default to Schedule create time if not specified.

  * `max_run_count`: Optional. Maximum run count of the schedule. If specified, The schedule will be completed when either started_run_count >= max_run_count or when end_time is reached. If not specified, new runs will keep getting scheduled until this Schedule is paused or deleted. Already scheduled runs will be allowed to complete. Unset if not specified.

  * `next_run_time`: Output only. Timestamp when this Schedule should schedule the next run. Having a next_run_time in the past means the runs are being started behind schedule.

  * `update_time`: Output only. Timestamp when this Schedule was updated.

  * `last_scheduled_run_response`: Status of a scheduled run.

    * `run_response`: The response of the scheduled run.

    * `scheduled_run_time`: The scheduled run time based on the user-specified schedule.

  * `last_resume_time`: Output only. Timestamp when this Schedule was last resumed. Unset if never resumed from pause.

  * `max_concurrent_run_count`: Required. Maximum number of runs that can be started concurrently for this Schedule. This is the limit for starting the scheduled requests and not the execution of the operations/jobs created by the requests (if applicable).

  * `state`: Output only. The state of this Schedule.
  Possible values:
    * STATE_UNSPECIFIED
    * ACTIVE
    * PAUSED
    * COMPLETED

  * `create_pipeline_job_request`: Request message for PipelineService.CreatePipelineJob.

    * `pipeline_job`: An instance of a machine learning PipelineJob.

      * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

        * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

      * `end_time`: Output only. Pipeline end time.

      * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

      * `update_time`: Output only. Timestamp when this PipelineJob was most recently updated.

      * `job_detail`: The runtime detail of PipelineJob.

        * `task_details`: Output only. The runtime details of the tasks under the pipeline.

          * `inputs`: Output only. The runtime input artifacts of the task.

            * `additional_properties`: A list of artifact metadata.

          * `pipeline_task_status`: Output only. A list of task status. This field keeps a record of task status evolving over time.

            * `update_time`: Output only. Update time of this status.

            * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

              * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

              * `code`: The status code, which should be an enum value of google.rpc.Code.

              * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

            * `state`: Output only. The state of the task.
            Possible values:
              * STATE_UNSPECIFIED
              * PENDING
              * RUNNING
              * SUCCEEDED
              * CANCEL_PENDING
              * CANCELLING
              * CANCELLED
              * FAILED
              * SKIPPED
              * NOT_TRIGGERED

          * `end_time`: Output only. Task end time.

          * `outputs`: Output only. The runtime output artifacts of the task.

            * `additional_properties`: A list of artifact metadata.

          * `create_time`: Output only. Task create time.

          * `start_time`: Output only. Task start time.

          * `execution`: Instance of a general execution.

            * `labels`: The labels with user-defined metadata to organize your Executions. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Execution (System labels are excluded).

              * `additional_properties`: 

            * `create_time`: Output only. Timestamp when this Execution was created.

            * `schema_version`: The version of the schema in `schema_title` to use. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

            * `state`: The state of this Execution. This is a property of the Execution, and does not imply or capture any ongoing process. This property is managed by clients (such as Vertex AI Pipelines) and the system does not prescribe or check the validity of state transitions.
            Possible values:
              * STATE_UNSPECIFIED
              * NEW
              * RUNNING
              * COMPLETE
              * FAILED
              * CACHED
              * CANCELLED

            * `name`: Output only. The resource name of the Execution.

            * `etag`: An eTag used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

            * `display_name`: User provided display name of the Execution. May be up to 128 Unicode characters.

            * `metadata`: Properties of the Execution. Top level metadata keys' heading and trailing spaces will be trimmed. The size of this field should not exceed 200KB.

              * `additional_properties`: Properties of the object.

            * `schema_title`: The title of the schema describing the metadata. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

            * `description`: Description of the Execution

            * `update_time`: Output only. Timestamp when this Execution was last updated.

          * `task_name`: Output only. The user specified name of the task that is defined in pipeline_spec.

          * `parent_task_id`: Output only. The id of the parent task if the task is within a component scope. Empty if the task is at the root level.

          * `state`: Output only. State of the task.
          Possible values:
            * STATE_UNSPECIFIED
            * PENDING
            * RUNNING
            * SUCCEEDED
            * CANCEL_PENDING
            * CANCELLING
            * CANCELLED
            * FAILED
            * SKIPPED
            * NOT_TRIGGERED

          * `task_id`: Output only. The system generated ID of the task.

          * `executor_detail`: The runtime detail of a pipeline executor.

            * `container_detail`: The detail of a container execution. It contains the job names of the lifecycle of a container execution.

              * `failed_main_jobs`: Output only. The names of the previously failed CustomJob for the main container executions. The list includes the all attempts in chronological order.

              * `main_job`: Output only. The name of the CustomJob for the main container execution.

              * `pre_caching_check_job`: Output only. The name of the CustomJob for the pre-caching-check container execution. This job will be available if the PipelineJob.pipeline_spec specifies the `pre_caching_check` hook in the lifecycle events.

              * `failed_pre_caching_check_jobs`: Output only. The names of the previously failed CustomJob for the pre-caching-check container executions. This job will be available if the PipelineJob.pipeline_spec specifies the `pre_caching_check` hook in the lifecycle events. The list includes the all attempts in chronological order.

            * `custom_job_detail`: The detailed info for a custom job executor.

              * `failed_jobs`: Output only. The names of the previously failed CustomJob. The list includes the all attempts in chronological order.

              * `job`: Output only. The name of the CustomJob.

          * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

            * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

            * `code`: The status code, which should be an enum value of google.rpc.Code.

            * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `pipeline_run_context`: Instance of a general context.

          * `name`: Immutable. The resource name of the Context.

          * `schema_title`: The title of the schema describing the metadata. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

          * `etag`: An eTag used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

          * `description`: Description of the Context

          * `display_name`: User provided display name of the Context. May be up to 128 Unicode characters.

          * `schema_version`: The version of the schema in schema_name to use. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

          * `create_time`: Output only. Timestamp when this Context was created.

          * `labels`: The labels with user-defined metadata to organize your Contexts. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Context (System labels are excluded).

            * `additional_properties`: 

          * `metadata`: Properties of the Context. Top level metadata keys' heading and trailing spaces will be trimmed. The size of this field should not exceed 200KB.

            * `additional_properties`: Properties of the object.

          * `update_time`: Output only. Timestamp when this Context was last updated.

          * `parent_contexts`: Output only. A list of resource names of Contexts that are parents of this Context. A Context may have at most 10 parent_contexts.

        * `pipeline_context`: Instance of a general context.

          * `name`: Immutable. The resource name of the Context.

          * `schema_title`: The title of the schema describing the metadata. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

          * `etag`: An eTag used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

          * `description`: Description of the Context

          * `display_name`: User provided display name of the Context. May be up to 128 Unicode characters.

          * `schema_version`: The version of the schema in schema_name to use. Schema title and version is expected to be registered in earlier Create Schema calls. And both are used together as unique identifiers to identify schemas within the local metadata store.

          * `create_time`: Output only. Timestamp when this Context was created.

          * `labels`: The labels with user-defined metadata to organize your Contexts. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. No more than 64 user labels can be associated with one Context (System labels are excluded).

            * `additional_properties`: 

          * `metadata`: Properties of the Context. Top level metadata keys' heading and trailing spaces will be trimmed. The size of this field should not exceed 200KB.

            * `additional_properties`: Properties of the object.

          * `update_time`: Output only. Timestamp when this Context was last updated.

          * `parent_contexts`: Output only. A list of resource names of Contexts that are parents of this Context. A Context may have at most 10 parent_contexts.

      * `template_metadata`: Pipeline template metadata if PipelineJob.template_uri is from supported template registry. Currently, the only supported registry is Artifact Registry.

        * `version`: The version_name in artifact registry. Will always be presented in output if the PipelineJob.template_uri is from supported template registry. Format is "sha256:abcdef123456...".

      * `state`: Output only. The detailed state of the job.
      Possible values:
        * PIPELINE_STATE_UNSPECIFIED
        * PIPELINE_STATE_QUEUED
        * PIPELINE_STATE_PENDING
        * PIPELINE_STATE_RUNNING
        * PIPELINE_STATE_SUCCEEDED
        * PIPELINE_STATE_FAILED
        * PIPELINE_STATE_CANCELLING
        * PIPELINE_STATE_CANCELLED
        * PIPELINE_STATE_PAUSED

      * `create_time`: Output only. Pipeline creation time.

      * `name`: Output only. The resource name of the PipelineJob.

      * `schedule_name`: Output only. The schedule resource name. Only returned if the Pipeline is created by Schedule API.

      * `reserved_ip_ranges`: A list of names for the reserved ip ranges under the VPC network that can be used for this Pipeline Job's workload. If set, we will deploy the Pipeline Job's workload within the provided ip ranges. Otherwise, the job will be deployed to any ip ranges under the provided VPC network. Example: ['vertex-ai-ip-range'].

      * `start_time`: Output only. Pipeline start time.

      * `service_account`: The service account that the pipeline workload runs as. If not specified, the Compute Engine default service account in the project will be used. See https://cloud.google.com/compute/docs/access/service-accounts#default_service_account Users starting the pipeline must have the `iam.serviceAccounts.actAs` permission on this service account.

      * `display_name`: The display name of the Pipeline. The name can be up to 128 characters long and can consist of any UTF-8 characters.

      * `template_uri`: A template uri from where the PipelineJob.pipeline_spec, if empty, will be downloaded.

      * `pipeline_spec`: The spec of the pipeline.

        * `additional_properties`: Properties of the object.

      * `network`: The full name of the Compute Engine [network](/compute/docs/networks-and-firewalls#networks) to which the Pipeline Job's workload should be peered. For example, `projects/12345/global/networks/myVPC`. [Format](/compute/docs/reference/rest/v1/networks/insert) is of the form `projects/{project}/global/networks/{network}`. Where {project} is a project number, as in `12345`, and {network} is a network name. Private services access must already be configured for the network. Pipeline job will apply the network configuration to the Google Cloud resources being launched, if applied, such as Vertex AI Training or Dataflow job. If left unspecified, the workload is not peered with any network.

      * `labels`: The labels with user-defined metadata to organize PipelineJob. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels. Note there is some reserved label key for Vertex AI Pipelines. - `vertex-ai-pipelines-run-billing-id`, user set value will get overrided.

        * `additional_properties`: 

      * `runtime_config`: The runtime config of a PipelineJob.

        * `gcs_output_directory`: Required. A path in a Cloud Storage bucket, which will be treated as the root output directory of the pipeline. It is used by the system to generate the paths of output artifacts. The artifact paths are generated with a sub-path pattern `{job_id}/{task_id}/{output_key}` under the specified output directory. The service account specified in this pipeline must have the `storage.objects.get` and `storage.objects.create` permissions for this bucket.

        * `parameter_values`: The runtime parameters of the PipelineJob. The parameters will be passed into PipelineJob.pipeline_spec to replace the placeholders at runtime. This field is used by pipelines built using `PipelineJob.pipeline_spec.schema_version` 2.1.0, such as pipelines built using Kubeflow Pipelines SDK 1.9 or higher and the v2 DSL.

          * `additional_properties`: 

        * `failure_policy`: Represents the failure policy of a pipeline. Currently, the default of a pipeline is that the pipeline will continue to run until no more tasks can be executed, also known as PIPELINE_FAILURE_POLICY_FAIL_SLOW. However, if a pipeline is set to PIPELINE_FAILURE_POLICY_FAIL_FAST, it will stop scheduling any new tasks when a task has failed. Any scheduled tasks will continue to completion.
        Possible values:
          * PIPELINE_FAILURE_POLICY_UNSPECIFIED
          * PIPELINE_FAILURE_POLICY_FAIL_SLOW
          * PIPELINE_FAILURE_POLICY_FAIL_FAST

        * `parameters`: Deprecated. Use RuntimeConfig.parameter_values instead. The runtime parameters of the PipelineJob. The parameters will be passed into PipelineJob.pipeline_spec to replace the placeholders at runtime. This field is used by pipelines built using `PipelineJob.pipeline_spec.schema_version` 2.0.0 or lower, such as pipelines built using Kubeflow Pipelines SDK 1.8 or lower.

          * `additional_properties`: Value is the value of the field.

        * `input_artifacts`: The runtime artifacts of the PipelineJob. The key will be the input artifact name and the value would be one of the InputArtifact.

          * `additional_properties`: The type of an input artifact.

    * `pipeline_job_id`: The ID to use for the PipelineJob, which will become the final component of the PipelineJob name. If not provided, an ID will be automatically generated. This value should be less than 128 characters, and valid characters are /a-z-/.

    * `parent`: Required. The resource name of the Location to create the PipelineJob in. Format: `projects/{project}/locations/{location}`

  * `display_name`: Required. User provided name of the Schedule. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `catch_up`: Output only. Whether to backfill missed runs when the schedule is resumed from PAUSED state. If set to true, all missed runs will be scheduled. New runs will be scheduled after the backfill is complete. Default to false.

  * `end_time`: Optional. Timestamp after which no new runs can be scheduled. If specified, The schedule will be completed when either end_time is reached or when scheduled_run_count >= max_run_count. If not specified, new runs will keep getting scheduled until this Schedule is paused or deleted. Already scheduled runs will be allowed to complete. Unset if not specified.


## GCP permissions
