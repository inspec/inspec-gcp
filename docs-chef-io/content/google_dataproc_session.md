+++
title = "google_dataproc_session resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_dataproc_session"
identifier = "inspec/resources/gcp/google_dataproc_session resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_session` InSpec audit resource to test the properties of a Google Cloud Session resource.

## Examples

```ruby
describe google_dataproc_session(name: ' value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('uuid') { should cmp 'value_uuid' }
	its('create_time') { should cmp 'value_createtime' }
	its('state') { should cmp 'value_state' }
	its('state_message') { should cmp 'value_statemessage' }
	its('state_time') { should cmp 'value_statetime' }
	its('creator') { should cmp 'value_creator' }
	its('user') { should cmp 'value_user' }
	its('session_template') { should cmp 'value_sessiontemplate' }

end

describe google_dataproc_session(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters

Parameters that can be accessed from the `google_dataproc_session` resource:

## Properties

Properties that can be accessed from the `google_dataproc_session` resource:


  * `name`: Required. The resource name of the session.

  * `uuid`: Output only. A session UUID (Unique Universal Identifier). The service generates this value when it creates the session.

  * `create_time`: Output only. The time when the session was created.

  * `jupyter_session`: Jupyter configuration for an interactive session.

    * `kernel`: Optional. Kernel
    Possible values:
      * KERNEL_UNSPECIFIED
      * PYTHON
      * SCALA

    * `display_name`: Optional. Display name, shown in the Jupyter kernelspec card.

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

  * `state`: Output only. A state of the session.
  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * TERMINATING
    * TERMINATED
    * FAILED

  * `state_message`: Output only. Session state details, such as the failure description if the state is FAILED.

  * `state_time`: Output only. The time when the session entered the current state.

  * `creator`: Output only. The email address of the user who created the session.

  * `labels`: Optional. The labels to associate with the session. Label keys must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). Label values may be empty, but, if present, must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a session.

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

  * `user`: Optional. The email address of the user who owns the session.

  * `state_history`: Output only. Historical state information for the session.

    * `state`: Output only. The state of the session at this point in the session history.
    Possible values:
      * STATE_UNSPECIFIED
      * CREATING
      * ACTIVE
      * TERMINATING
      * TERMINATED
      * FAILED

    * `state_message`: Output only. Details about the state at this point in the session history.

    * `state_start_time`: Output only. The time when the session entered the historical state.

  * `session_template`: Optional. The session template used by the session.Only resource names, including project ID and location, are valid.Example: * https://www.googleapis.com/compute/v1/projects/[project_id]/locations/[dataproc_region]/sessionTemplates/[template_id] * projects/[project_id]/locations/[dataproc_region]/sessionTemplates/[template_id]The template must be in the same project and Dataproc region as the session.


## GCP permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
