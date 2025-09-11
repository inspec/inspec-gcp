+++
title = "google_vertex_ai_nas_job resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_nas_job"
identifier = "inspec/resources/gcp/google_vertex_ai_nas_job resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_nas_job` InSpec audit resource to to test a Google Cloud NasJob resource.

## Examples

```ruby
describe google_vertex_ai_nas_job(name: "projects/#{gcp_project_id}/locations/#{nas_job['region']}/nasJobs/#{nas_job['name']}", region: ' value_region') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('end_time') { should cmp 'value_endtime' }
	its('state') { should cmp 'value_state' }
	its('create_time') { should cmp 'value_createtime' }
	its('display_name') { should cmp 'value_displayname' }
	its('start_time') { should cmp 'value_starttime' }
	its('update_time') { should cmp 'value_updatetime' }

end

describe google_vertex_ai_nas_job(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_nas_job` resource:


  * `nas_job_output`: Represents a uCAIP NasJob output.

    * `multi_trial_job_output`: The output of a multi-trial Neural Architecture Search (NAS) jobs.

      * `search_trials`: Output only. List of NasTrials that were started as part of search stage.

        * `id`: Output only. The identifier of the NasTrial assigned by the service.

        * `state`: Output only. The detailed state of the NasTrial.
        Possible values:
          * STATE_UNSPECIFIED
          * REQUESTED
          * ACTIVE
          * STOPPING
          * SUCCEEDED
          * INFEASIBLE

        * `final_measurement`: A message representing a Measurement of a Trial. A Measurement contains the Metrics got by executing a Trial using suggested hyperparameter values.

          * `metrics`: Output only. A list of metrics got by evaluating the objective functions using suggested Parameter values.

            * `metric_id`: Output only. The ID of the Metric. The Metric should be defined in StudySpec's Metrics.

            * `value`: Output only. The value for this metric.

          * `elapsed_duration`: Output only. Time that the Trial has been running at the point of this Measurement.

          * `step_count`: Output only. The number of steps the machine learning model has been trained for. Must be non-negative.

        * `start_time`: Output only. Time when the NasTrial was started.

        * `end_time`: Output only. Time when the NasTrial's status changed to `SUCCEEDED` or `INFEASIBLE`.

      * `train_trials`: Output only. List of NasTrials that were started as part of train stage.

        * `id`: Output only. The identifier of the NasTrial assigned by the service.

        * `state`: Output only. The detailed state of the NasTrial.
        Possible values:
          * STATE_UNSPECIFIED
          * REQUESTED
          * ACTIVE
          * STOPPING
          * SUCCEEDED
          * INFEASIBLE

        * `final_measurement`: A message representing a Measurement of a Trial. A Measurement contains the Metrics got by executing a Trial using suggested hyperparameter values.

          * `metrics`: Output only. A list of metrics got by evaluating the objective functions using suggested Parameter values.

            * `metric_id`: Output only. The ID of the Metric. The Metric should be defined in StudySpec's Metrics.

            * `value`: Output only. The value for this metric.

          * `elapsed_duration`: Output only. Time that the Trial has been running at the point of this Measurement.

          * `step_count`: Output only. The number of steps the machine learning model has been trained for. Must be non-negative.

        * `start_time`: Output only. Time when the NasTrial was started.

        * `end_time`: Output only. Time when the NasTrial's status changed to `SUCCEEDED` or `INFEASIBLE`.

  * `name`: Output only. Resource name of the NasJob.

  * `end_time`: Output only. Time when the NasJob entered any of the following states: `JOB_STATE_SUCCEEDED`, `JOB_STATE_FAILED`, `JOB_STATE_CANCELLED`.

  * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

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

  * `create_time`: Output only. Time when the NasJob was created.

  * `display_name`: Required. The display name of the NasJob. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `nas_job_spec`: Represents the spec of a NasJob.

    * `search_space_spec`: It defines the search space for Neural Architecture Search (NAS).

    * `resume_nas_job_id`: The ID of the existing NasJob in the same Project and Location which will be used to resume search. search_space_spec and nas_algorithm_spec are obtained from previous NasJob hence should not provide them again for this NasJob.

    * `multi_trial_algorithm_spec`: The spec of multi-trial Neural Architecture Search (NAS).

      * `search_trial_spec`: Represent spec for search trials.

        * `max_failed_trial_count`: The number of failed trials that need to be seen before failing the NasJob. If set to 0, Vertex AI decides how many trials must fail before the whole job fails.

        * `max_parallel_trial_count`: Required. The maximum number of trials to run in parallel.

        * `search_trial_job_spec`: Represents the spec of a CustomJob.

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

        * `max_trial_count`: Required. The maximum number of Neural Architecture Search (NAS) trials to run.

      * `multi_trial_algorithm`: The multi-trial Neural Architecture Search (NAS) algorithm type. Defaults to `REINFORCEMENT_LEARNING`.
      Possible values:
        * MULTI_TRIAL_ALGORITHM_UNSPECIFIED
        * REINFORCEMENT_LEARNING
        * GRID_SEARCH

      * `train_trial_spec`: Represent spec for train trials.

        * `frequency`: Required. Frequency of search trials to start train stage. Top N [TrainTrialSpec.max_parallel_trial_count] search trials will be trained for every M [TrainTrialSpec.frequency] trials searched.

        * `max_parallel_trial_count`: Required. The maximum number of trials to run in parallel.

        * `train_trial_job_spec`: Represents the spec of a CustomJob.

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

      * `metric`: Represents a metric to optimize.

        * `goal`: Required. The optimization goal of the metric.
        Possible values:
          * GOAL_TYPE_UNSPECIFIED
          * MAXIMIZE
          * MINIMIZE

        * `metric_id`: Required. The ID of the metric. Must not contain whitespaces.

  * `enable_restricted_image_training`: Optional. Enable a separation of Custom model training and restricted image training for tenant project.

  * `start_time`: Output only. Time when the NasJob for the first time entered the `JOB_STATE_RUNNING` state.

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `labels`: The labels with user-defined metadata to organize NasJobs. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `update_time`: Output only. Time when the NasJob was most recently updated.


## GCP permissions
