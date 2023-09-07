---
title: About the google_vertex_ai_custom_job resource
platform: gcp
---

## Syntax
A `google_vertex_ai_custom_job` is used to test a Google CustomJob resource

## Examples
```
      describe google_vertex_ai_custom_job(name: ' value_name') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_custom_job` resource:


  * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

  * `web_access_uris`: Output only. URIs for accessing [interactive shells](https://cloud.google.com/vertex-ai/docs/training/monitor-debug-interactive-shell) (one URI for each training node). Only available if job_spec.enable_web_access is `true`. The keys are names of each node in the training job; for example, `workerpool0-0` for the primary node, `workerpool1-0` for the first node in the second worker pool, and `workerpool1-1` for the second node in the second worker pool. The values are the URIs for each node's interactive shell.

    * `additional_properties`: 

  * `job_spec`: Represents the spec of a CustomJob.

    * `worker_pool_specs`: Required. The spec of the worker pools including machine type and Docker image. All worker pools except the first one are optional and can be skipped by providing an empty value.

      * `container_spec`: The spec of a Container.

        * `env`: Environment variables to be passed to the container. Maximum limit is 100.

          * `name`: Required. Name of the environment variable. Must be a valid C identifier.

          * `value`: Required. Variables that reference a $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not.

        * `args`: The arguments to be passed when starting the container.

        * `command`: The command to be invoked when the container is started. It overrides the entrypoint instruction in Dockerfile when provided.

        * `image_uri`: Required. The URI of a container image in the Container Registry that is to be run on each worker replica.

      * `machine_spec`: Specification of a single machine.

        * `accelerator_type`: Immutable. The type of accelerator(s) that may be attached to the machine as per accelerator_count.
        Possible values:
          * ACCELERATOR_TYPE_UNSPECIFIED
          * NVIDIA_TESLA_K80
          * NVIDIA_TESLA_P100
          * NVIDIA_TESLA_V100
          * NVIDIA_TESLA_P4
          * NVIDIA_TESLA_T4
          * NVIDIA_TESLA_A100
          * NVIDIA_A100_80GB
          * NVIDIA_L4
          * TPU_V2
          * TPU_V3
          * TPU_V4_POD

        * `machine_type`: Immutable. The type of the machine. See the [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types) See the [list of machine types supported for custom training](https://cloud.google.com/vertex-ai/docs/training/configure-compute#machine-types). For DeployedModel this field is optional, and the default value is `n1-standard-2`. For BatchPredictionJob or as part of WorkerPoolSpec this field is required.

        * `accelerator_count`: The number of accelerators to attach to the machine.

      * `replica_count`: Optional. The number of worker replicas to use for this worker pool.

      * `nfs_mounts`: Optional. List of NFS mount spec.

        * `path`: Required. Source path exported from NFS server. Has to start with '/', and combined with the ip address, it indicates the source mount path in the form of `server:path`

        * `mount_point`: Required. Destination mount path. The NFS will be mounted for the user under /mnt/nfs/

        * `server`: Required. IP address of the NFS server.

      * `python_package_spec`: The spec of a Python packaged code.

        * `package_uris`: Required. The Google Cloud Storage location of the Python package files which are the training program and its dependent packages. The maximum number of package URIs is 100.

        * `env`: Environment variables to be passed to the python module. Maximum limit is 100.

          * `name`: Required. Name of the environment variable. Must be a valid C identifier.

          * `value`: Required. Variables that reference a $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not.

        * `executor_image_uri`: Required. The URI of a container image in Artifact Registry that will run the provided Python package. Vertex AI provides a wide range of executor images with pre-installed packages to meet users' various use cases. See the list of [pre-built containers for training](https://cloud.google.com/vertex-ai/docs/training/pre-built-containers). You must use an image from this list.

        * `args`: Command line arguments to be passed to the Python task.

        * `python_module`: Required. The Python module name to run after installing the packages.

      * `disk_spec`: Represents the spec of disk options.

        * `boot_disk_type`: Type of the boot disk (default is "pd-ssd"). Valid values: "pd-ssd" (Persistent Disk Solid State Drive) or "pd-standard" (Persistent Disk Hard Disk Drive).

        * `boot_disk_size_gb`: Size in GB of the boot disk (default is 100GB).

    * `enable_web_access`: Optional. Whether you want Vertex AI to enable [interactive shell access](https://cloud.google.com/vertex-ai/docs/training/monitor-debug-interactive-shell) to training containers. If set to `true`, you can access interactive shells at the URIs given by CustomJob.web_access_uris or Trial.web_access_uris (within HyperparameterTuningJob.trials).

    * `tensorboard`: Optional. The name of a Vertex AI Tensorboard resource to which this CustomJob will upload Tensorboard logs. Format: `projects/{project}/locations/{location}/tensorboards/{tensorboard}`

    * `experiment`: Optional. The Experiment associated with this job. Format: `projects/{project}/locations/{location}/metadataStores/{metadataStores}/contexts/{experiment-name}`

    * `experiment_run`: Optional. The Experiment Run associated with this job. Format: `projects/{project}/locations/{location}/metadataStores/{metadataStores}/contexts/{experiment-name}-{experiment-run-name}`

    * `scheduling`: All parameters related to queuing and scheduling of custom jobs.

      * `disable_retries`: Optional. Indicates if the job should retry for internal errors after the job starts running. If true, overrides `Scheduling.restart_job_on_worker_restart` to false.

      * `timeout`: The maximum job running time. The default is 7 days.

      * `restart_job_on_worker_restart`: Restarts the entire CustomJob if a worker gets restarted. This feature can be used by distributed training jobs that are not resilient to workers leaving and joining a job.

    * `enable_dashboard_access`: Optional. Whether you want Vertex AI to enable access to the customized dashboard in training chief container. If set to `true`, you can access the dashboard at the URIs given by CustomJob.web_access_uris or Trial.web_access_uris (within HyperparameterTuningJob.trials).

    * `service_account`: Specifies the service account for workload run-as account. Users submitting jobs must have act-as permission on this run-as account. If unspecified, the [Vertex AI Custom Code Service Agent](https://cloud.google.com/vertex-ai/docs/general/access-control#service-agents) for the CustomJob's project is used.

    * `base_output_directory`: The Google Cloud Storage location where the output is to be written to.

      * `output_uri_prefix`: Required. Google Cloud Storage URI to output directory. If the uri doesn't end with '/', a '/' will be automatically appended. The directory is created if it doesn't exist.

    * `reserved_ip_ranges`: Optional. A list of names for the reserved ip ranges under the VPC network that can be used for this job. If set, we will deploy the job within the provided ip ranges. Otherwise, the job will be deployed to any ip ranges under the provided VPC network. Example: ['vertex-ai-ip-range'].

    * `network`: Optional. The full name of the Compute Engine [network](/compute/docs/networks-and-firewalls#networks) to which the Job should be peered. For example, `projects/12345/global/networks/myVPC`. [Format](/compute/docs/reference/rest/v1/networks/insert) is of the form `projects/{project}/global/networks/{network}`. Where {project} is a project number, as in `12345`, and {network} is a network name. To specify this field, you must have already [configured VPC Network Peering for Vertex AI](https://cloud.google.com/vertex-ai/docs/general/vpc-peering). If this field is left unspecified, the job is not peered with any network.

  * `start_time`: Output only. Time when the CustomJob for the first time entered the `JOB_STATE_RUNNING` state.

  * `labels`: The labels with user-defined metadata to organize CustomJobs. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `create_time`: Output only. Time when the CustomJob was created.

  * `update_time`: Output only. Time when the CustomJob was most recently updated.

  * `end_time`: Output only. Time when the CustomJob entered any of the following states: `JOB_STATE_SUCCEEDED`, `JOB_STATE_FAILED`, `JOB_STATE_CANCELLED`.

  * `state`: Output only. The detailed state of the job.
  Possible values:
    * JOB_STATE_UNSPECIFIED
    * JOB_STATE_QUEUED
    * JOB_STATE_PENDING
    * JOB_STATE_RUNNING
    * JOB_STATE_SUCCEEDED
    * JOB_STATE_FAILED
    * JOB_STATE_CANCELLING
    * JOB_STATE_CANCELLED
    * JOB_STATE_PAUSED
    * JOB_STATE_EXPIRED
    * JOB_STATE_UPDATING
    * JOB_STATE_PARTIALLY_SUCCEEDED

  * `display_name`: Required. The display name of the CustomJob. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `name`: Output only. Resource name of a CustomJob.


## GCP Permissions
