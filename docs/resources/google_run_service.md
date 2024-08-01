+++

title = "google_run_service Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_run_service"
identifier = "inspec/resources/gcp/google_run_service Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_run_service` InSpec audit resource to test the properties of a test a Google Service.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_run_service` is used to test a Google Service resource

## Examples
```
describe google_run_service(name: ' value_name') do
	it { should exist }
	its('api_version') { should cmp '' }
	its('kind') { should cmp '' }

end

describe google_run_service(name: "does_not_exit") do
	it { should_not exist }
end
```

## Parameters
Properties that can be accessed from the `google_run_service` resource:

## Properties
Properties that can be accessed from the `google_run_service` resource:


  * `api_version`: The API version for this call. It must be "serving.knative.dev/v1".

  * `kind`: The kind of resource. It must be "Service".

  * `metadata`: google.cloud.run.meta.v1.ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create.

    * `name`: Required. The name of the resource. Name is required when creating top-level resources (Service, Job), must be unique within a Cloud Run project/region, and cannot be changed once created.

    * `generate_name`: Not supported by Cloud Run

    * `namespace`: Required. Defines the space within each name must be unique within a Cloud Run region. In Cloud Run, it must be project ID or number.

    * `self_link`: URL representing this object.

    * `uid`: Unique, system-generated identifier for this resource.

    * `resource_version`: Opaque, system-generated value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server or omit the value to disable conflict-detection.

    * `generation`: A system-provided sequence number representing a specific generation of the desired state.

    * `creation_timestamp`: UTC timestamp representing the server time when this object was created.

    * `labels`: Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and routes.

      * `additional_properties`: 

    * `annotations`: Unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. In Cloud Run, annotations with 'run.googleapis.com/' and 'autoscaling.knative.dev' are restricted, and the accepted annotations will be different depending on the resource type. * `autoscaling.knative.dev/maxScale`: Revision. * `autoscaling.knative.dev/minScale`: Revision. * `run.googleapis.com/binary-authorization-breakglass`: Service, Job, * `run.googleapis.com/binary-authorization`: Service, Job, Execution. * `run.googleapis.com/client-name`: All resources. * `run.googleapis.com/cloudsql-instances`: Revision, Execution. * `run.googleapis.com/container-dependencies`: Revision . * `run.googleapis.com/cpu-throttling`: Revision. * `run.googleapis.com/custom-audiences`: Service. * `run.googleapis.com/default-url-disabled`: Service. * `run.googleapis.com/description`: Service. * `run.googleapis.com/encryption-key-shutdown-hours`: Revision * `run.googleapis.com/encryption-key`: Revision, Execution. * `run.googleapis.com/execution-environment`: Revision, Execution. * `run.googleapis.com/gc-traffic-tags`: Service. * `run.googleapis.com/ingress`: Service. * `run.googleapis.com/launch-stage`: Service, Job. * `run.googleapis.com/minScale`: Service (ALPHA) * `run.googleapis.com/network-interfaces`: Revision, Execution. * `run.googleapis.com/post-key-revocation-action-type`: Revision. * `run.googleapis.com/secrets`: Revision, Execution. * `run.googleapis.com/secure-session-agent`: Revision. * `run.googleapis.com/sessionAffinity`: Revision. * `run.googleapis.com/startup-cpu-boost`: Revision. * `run.googleapis.com/vpc-access-connector`: Revision, Execution. * `run.googleapis.com/vpc-access-egress`: Revision, Execution.

      * `additional_properties`: 

    * `owner_references`: Not supported by Cloud Run

      * `api_version`: This is not supported or used by Cloud Run.

      * `kind`: This is not supported or used by Cloud Run.

      * `name`: This is not supported or used by Cloud Run.

      * `uid`: This is not supported or used by Cloud Run.

      * `controller`: This is not supported or used by Cloud Run.

      * `block_owner_deletion`: This is not supported or used by Cloud Run.

    * `deletion_timestamp`: The read-only soft deletion timestamp for this resource. In Cloud Run, users are not able to set this field. Instead, they must call the corresponding Delete API.

    * `deletion_grace_period_seconds`: Not supported by Cloud Run

    * `finalizers`: Not supported by Cloud Run

    * `cluster_name`: Not supported by Cloud Run

  * `spec`: ServiceSpec holds the desired state of the Route (from the client), which is used to manipulate the underlying Route and Configuration(s).

    * `template`: RevisionTemplateSpec describes the data a revision should have when created from a template.

      * `metadata`: google.cloud.run.meta.v1.ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create.

        * `name`: Required. The name of the resource. Name is required when creating top-level resources (Service, Job), must be unique within a Cloud Run project/region, and cannot be changed once created.

        * `generate_name`: Not supported by Cloud Run

        * `namespace`: Required. Defines the space within each name must be unique within a Cloud Run region. In Cloud Run, it must be project ID or number.

        * `self_link`: URL representing this object.

        * `uid`: Unique, system-generated identifier for this resource.

        * `resource_version`: Opaque, system-generated value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server or omit the value to disable conflict-detection.

        * `generation`: A system-provided sequence number representing a specific generation of the desired state.

        * `creation_timestamp`: UTC timestamp representing the server time when this object was created.

        * `labels`: Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and routes.

          * `additional_properties`: 

        * `annotations`: Unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. In Cloud Run, annotations with 'run.googleapis.com/' and 'autoscaling.knative.dev' are restricted, and the accepted annotations will be different depending on the resource type. * `autoscaling.knative.dev/maxScale`: Revision. * `autoscaling.knative.dev/minScale`: Revision. * `run.googleapis.com/binary-authorization-breakglass`: Service, Job, * `run.googleapis.com/binary-authorization`: Service, Job, Execution. * `run.googleapis.com/client-name`: All resources. * `run.googleapis.com/cloudsql-instances`: Revision, Execution. * `run.googleapis.com/container-dependencies`: Revision . * `run.googleapis.com/cpu-throttling`: Revision. * `run.googleapis.com/custom-audiences`: Service. * `run.googleapis.com/default-url-disabled`: Service. * `run.googleapis.com/description`: Service. * `run.googleapis.com/encryption-key-shutdown-hours`: Revision * `run.googleapis.com/encryption-key`: Revision, Execution. * `run.googleapis.com/execution-environment`: Revision, Execution. * `run.googleapis.com/gc-traffic-tags`: Service. * `run.googleapis.com/ingress`: Service. * `run.googleapis.com/launch-stage`: Service, Job. * `run.googleapis.com/minScale`: Service (ALPHA) * `run.googleapis.com/network-interfaces`: Revision, Execution. * `run.googleapis.com/post-key-revocation-action-type`: Revision. * `run.googleapis.com/secrets`: Revision, Execution. * `run.googleapis.com/secure-session-agent`: Revision. * `run.googleapis.com/sessionAffinity`: Revision. * `run.googleapis.com/startup-cpu-boost`: Revision. * `run.googleapis.com/vpc-access-connector`: Revision, Execution. * `run.googleapis.com/vpc-access-egress`: Revision, Execution.

          * `additional_properties`: 

        * `owner_references`: Not supported by Cloud Run

          * `api_version`: This is not supported or used by Cloud Run.

          * `kind`: This is not supported or used by Cloud Run.

          * `name`: This is not supported or used by Cloud Run.

          * `uid`: This is not supported or used by Cloud Run.

          * `controller`: This is not supported or used by Cloud Run.

          * `block_owner_deletion`: This is not supported or used by Cloud Run.

        * `deletion_timestamp`: The read-only soft deletion timestamp for this resource. In Cloud Run, users are not able to set this field. Instead, they must call the corresponding Delete API.

        * `deletion_grace_period_seconds`: Not supported by Cloud Run

        * `finalizers`: Not supported by Cloud Run

        * `cluster_name`: Not supported by Cloud Run

      * `spec`: RevisionSpec holds the desired state of the Revision (from the client).

        * `container_concurrency`: ContainerConcurrency specifies the maximum allowed in-flight (concurrent) requests per container instance of the Revision. If not specified or 0, defaults to 80 when requested CPU >= 1 and defaults to 1 when requested CPU < 1.

        * `timeout_seconds`: TimeoutSeconds holds the max duration the instance is allowed for responding to a request. Cloud Run: defaults to 300 seconds (5 minutes). Maximum allowed value is 3600 seconds (1 hour).

        * `service_account_name`: Email address of the IAM service account associated with the revision of the service. The service account represents the identity of the running revision, and determines what permissions the revision has. If not provided, the revision will use the project's default service account.

        * `containers`: Required. Containers holds the list which define the units of execution for this Revision. In the context of a Revision, we disallow a number of fields on this Container, including: name and lifecycle.

          * `name`: Name of the container specified as a DNS_LABEL (RFC 1123).

          * `image`: Required. Name of the container image in Dockerhub, Google Artifact Registry, or Google Container Registry. If the host is not provided, Dockerhub is assumed.

          * `command`: Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references are not supported in Cloud Run.

          * `args`: Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run.

          * `env`: List of environment variables to set in the container. EnvVar with duplicate names are generally allowed; if referencing a secret, the name must be unique for the container. For non-secret EnvVar names, the Container will only get the last-declared one.

            * `name`: Required. Name of the environment variable.

            * `value`: Value of the environment variable. Defaults to "". Variable references are not supported in Cloud Run.

            * `value_from`: EnvVarSource represents a source for the value of an EnvVar.

              * `config_map_key_ref`: Not supported by Cloud Run.

                * `local_object_reference`: Not supported by Cloud Run. LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.

                  * `name`: Name of the referent.

                * `key`: Required. Not supported by Cloud Run.

                * `optional`: Not supported by Cloud Run.

                * `name`: Required. Not supported by Cloud Run.

              * `secret_key_ref`: SecretKeySelector selects a key of a Secret.

                * `local_object_reference`: Not supported by Cloud Run. LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.

                  * `name`: Name of the referent.

                * `key`: Required. A Cloud Secret Manager secret version. Must be 'latest' for the latest version, an integer for a specific version, or a version alias. The key of the secret to select from. Must be a valid secret key.

                * `optional`: Specify whether the Secret or its key must be defined.

                * `name`: The name of the secret in Cloud Secret Manager. By default, the secret is assumed to be in the same project. If the secret is in another project, you must define an alias. An alias definition has the form: :projects//secrets/. If multiple alias definitions are needed, they must be separated by commas. The alias definitions must be set on the run.googleapis.com/secrets annotation. The name of the secret in the pod's namespace to select from.

          * `resources`: ResourceRequirements describes the compute resource requirements.

            * `limits`: Limits describes the maximum amount of compute resources allowed. Only 'cpu' and 'memory' keys are supported. * For supported 'cpu' values, go to https://cloud.google.com/run/docs/configuring/cpu. * For supported 'memory' values and syntax, go to https://cloud.google.com/run/docs/configuring/memory-limits

              * `additional_properties`: 

            * `requests`: Requests describes the minimum amount of compute resources required. Only `cpu` and `memory` are supported. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. * For supported 'cpu' values, go to https://cloud.google.com/run/docs/configuring/cpu. * For supported 'memory' values and syntax, go to https://cloud.google.com/run/docs/configuring/memory-limits

              * `additional_properties`: 

          * `working_dir`: Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image.

          * `ports`: List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on.

            * `name`: If specified, used to specify which protocol to use. Allowed values are "http1" and "h2c".

            * `container_port`: Port number the container listens on. If present, this must be a valid port number, 0 < x < 65536. If not present, it will default to port 8080. For more information, see https://cloud.google.com/run/docs/container-contract#port

            * `protocol`: Protocol for port. Must be "TCP". Defaults to "TCP".

          * `env_from`: Not supported by Cloud Run.

            * `prefix`: An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.

            * `config_map_ref`: Not supported by Cloud Run. ConfigMapEnvSource selects a ConfigMap to populate the environment variables with. The contents of the target ConfigMap's Data field will represent the key-value pairs as environment variables.

              * `local_object_reference`: Not supported by Cloud Run. LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.

                * `name`: Name of the referent.

              * `optional`: Specify whether the ConfigMap must be defined.

              * `name`: The ConfigMap to select from.

            * `secret_ref`: Not supported by Cloud Run. SecretEnvSource selects a Secret to populate the environment variables with. The contents of the target Secret's Data field will represent the key-value pairs as environment variables.

              * `local_object_reference`: Not supported by Cloud Run. LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.

                * `name`: Name of the referent.

              * `optional`: Specify whether the Secret must be defined

              * `name`: The Secret to select from.

          * `volume_mounts`: Volume to mount into the container's filesystem. Only supports SecretVolumeSources. Pod volumes to mount into the container's filesystem.

            * `name`: Required. The name of the volume. There must be a corresponding Volume with the same name.

            * `read_only`: Sets the mount to be read-only or read-write. Not used by Cloud Run.

            * `mount_path`: Required. Path within the container at which the volume should be mounted. Must not contain ':'.

            * `sub_path`: Path within the volume from which the container's volume should be mounted. Defaults to "" (volume's root).

          * `liveness_probe`: Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.

            * `initial_delay_seconds`: Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240.

            * `timeout_seconds`: Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than period_seconds; if period_seconds is not set, must be less or equal than 10.

            * `period_seconds`: How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeout_seconds.

            * `success_threshold`: Minimum consecutive successes for the probe to be considered successful after having failed. Must be 1 if set.

            * `failure_threshold`: Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.

            * `exec`: Not supported by Cloud Run. ExecAction describes a "run in container" action.

              * `command`: Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

            * `http_get`: HTTPGetAction describes an action based on HTTP Get requests.

              * `path`: Path to access on the HTTP server.

              * `host`: Not supported by Cloud Run.

              * `scheme`: Not supported by Cloud Run.

              * `http_headers`: Custom headers to set in the request. HTTP allows repeated headers.

                * `name`: Required. The header field name

                * `value`: The header field value

              * `port`: Port number to access on the container. Number must be in the range 1 to 65535.

            * `tcp_socket`: TCPSocketAction describes an action based on opening a socket

              * `port`: Port number to access on the container. Number must be in the range 1 to 65535.

              * `host`: Not supported by Cloud Run.

            * `grpc`: GRPCAction describes an action involving a GRPC port.

              * `port`: Port number of the gRPC service. Number must be in the range 1 to 65535.

              * `service`: Service is the name of the service to place in the gRPC HealthCheckRequest. If this is not specified, the default behavior is defined by gRPC.

          * `readiness_probe`: Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.

            * `initial_delay_seconds`: Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240.

            * `timeout_seconds`: Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than period_seconds; if period_seconds is not set, must be less or equal than 10.

            * `period_seconds`: How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeout_seconds.

            * `success_threshold`: Minimum consecutive successes for the probe to be considered successful after having failed. Must be 1 if set.

            * `failure_threshold`: Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.

            * `exec`: Not supported by Cloud Run. ExecAction describes a "run in container" action.

              * `command`: Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

            * `http_get`: HTTPGetAction describes an action based on HTTP Get requests.

              * `path`: Path to access on the HTTP server.

              * `host`: Not supported by Cloud Run.

              * `scheme`: Not supported by Cloud Run.

              * `http_headers`: Custom headers to set in the request. HTTP allows repeated headers.

                * `name`: Required. The header field name

                * `value`: The header field value

              * `port`: Port number to access on the container. Number must be in the range 1 to 65535.

            * `tcp_socket`: TCPSocketAction describes an action based on opening a socket

              * `port`: Port number to access on the container. Number must be in the range 1 to 65535.

              * `host`: Not supported by Cloud Run.

            * `grpc`: GRPCAction describes an action involving a GRPC port.

              * `port`: Port number of the gRPC service. Number must be in the range 1 to 65535.

              * `service`: Service is the name of the service to place in the gRPC HealthCheckRequest. If this is not specified, the default behavior is defined by gRPC.

          * `startup_probe`: Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.

            * `initial_delay_seconds`: Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240.

            * `timeout_seconds`: Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than period_seconds; if period_seconds is not set, must be less or equal than 10.

            * `period_seconds`: How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeout_seconds.

            * `success_threshold`: Minimum consecutive successes for the probe to be considered successful after having failed. Must be 1 if set.

            * `failure_threshold`: Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.

            * `exec`: Not supported by Cloud Run. ExecAction describes a "run in container" action.

              * `command`: Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

            * `http_get`: HTTPGetAction describes an action based on HTTP Get requests.

              * `path`: Path to access on the HTTP server.

              * `host`: Not supported by Cloud Run.

              * `scheme`: Not supported by Cloud Run.

              * `http_headers`: Custom headers to set in the request. HTTP allows repeated headers.

                * `name`: Required. The header field name

                * `value`: The header field value

              * `port`: Port number to access on the container. Number must be in the range 1 to 65535.

            * `tcp_socket`: TCPSocketAction describes an action based on opening a socket

              * `port`: Port number to access on the container. Number must be in the range 1 to 65535.

              * `host`: Not supported by Cloud Run.

            * `grpc`: GRPCAction describes an action involving a GRPC port.

              * `port`: Port number of the gRPC service. Number must be in the range 1 to 65535.

              * `service`: Service is the name of the service to place in the gRPC HealthCheckRequest. If this is not specified, the default behavior is defined by gRPC.

          * `termination_message_path`: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log.

          * `termination_message_policy`: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

          * `image_pull_policy`: Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise.

          * `security_context`: Not supported by Cloud Run. SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext. When both are set, the values in SecurityContext take precedence.

            * `run_as_user`: The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

        * `volumes`: 

          * `name`: Volume's name. In Cloud Run Fully Managed, the name 'cloudsql' is reserved.

          * `secret`: A volume representing a secret stored in Google Secret Manager. The secret's value will be presented as the content of a file whose name is defined in the item path. If no items are defined, the name of the file is the secret_name. The contents of the target Secret's Data field will be presented in a volume as files using the keys in the Data field as the file names.

            * `secret_name`: The name of the secret in Cloud Secret Manager. By default, the secret is assumed to be in the same project. If the secret is in another project, you must define an alias. An alias definition has the form: :projects//secrets/. If multiple alias definitions are needed, they must be separated by commas. The alias definitions must be set on the run.googleapis.com/secrets annotation. Name of the secret in the container's namespace to use.

            * `items`: A list of secret versions to mount in the volume. If no items are specified, the volume will expose a file with the same name as the secret name. The contents of the file will be the data in the latest version of the secret. If items are specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify both a key and a path.

              * `key`: The Cloud Secret Manager secret version. Can be 'latest' for the latest value, or an integer or a secret alias for a specific version. The key to project.

              * `path`: The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.

              * `mode`: (Optional) Mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. Notes * Internally, a umask of 0222 will be applied to any non-zero value. * This is an integer representation of the mode bits. So, the octal integer value should look exactly as the chmod numeric notation with a leading zero. Some examples: for chmod 777 (a=rwx), set to 0777 (octal) or 511 (base-10). For chmod 640 (u=rw,g=r), set to 0640 (octal) or 416 (base-10). For chmod 755 (u=rwx,g=rx,o=rx), set to 0755 (octal) or 493 (base-10). * This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

            * `default_mode`: Integer representation of mode bits to use on created files by default. Must be a value between 01 and 0777 (octal). If 0 or not set, it will default to 0444. Directories within the path are not affected by this setting. Notes * Internally, a umask of 0222 will be applied to any non-zero value. * This is an integer representation of the mode bits. So, the octal integer value should look exactly as the chmod numeric notation with a leading zero. Some examples: for chmod 777 (a=rwx), set to 0777 (octal) or 511 (base-10). For chmod 640 (u=rw,g=r), set to 0640 (octal) or 416 (base-10). For chmod 755 (u=rwx,g=rx,o=rx), set to 0755 (octal) or 493 (base-10). * This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

            * `optional`: Not supported by Cloud Run.

          * `config_map`: Not supported by Cloud Run. Adapts a ConfigMap into a volume. The contents of the target ConfigMap's Data field will be presented in a volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths.

            * `name`: Name of the config.

            * `items`: (Optional) If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified that is not present in the Secret, the volume setup will error unless it is marked optional.

              * `key`: The Cloud Secret Manager secret version. Can be 'latest' for the latest value, or an integer or a secret alias for a specific version. The key to project.

              * `path`: The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.

              * `mode`: (Optional) Mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. Notes * Internally, a umask of 0222 will be applied to any non-zero value. * This is an integer representation of the mode bits. So, the octal integer value should look exactly as the chmod numeric notation with a leading zero. Some examples: for chmod 777 (a=rwx), set to 0777 (octal) or 511 (base-10). For chmod 640 (u=rw,g=r), set to 0640 (octal) or 416 (base-10). For chmod 755 (u=rwx,g=rx,o=rx), set to 0755 (octal) or 493 (base-10). * This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

            * `default_mode`: (Optional) Integer representation of mode bits to use on created files by default. Must be a value between 01 and 0777 (octal). If 0 or not set, it will default to 0644. Directories within the path are not affected by this setting. Notes * Internally, a umask of 0222 will be applied to any non-zero value. * This is an integer representation of the mode bits. So, the octal integer value should look exactly as the chmod numeric notation with a leading zero. Some examples: for chmod 777 (a=rwx), set to 0777 (octal) or 511 (base-10). For chmod 640 (u=rw,g=r), set to 0640 (octal) or 416 (base-10). For chmod 755 (u=rwx,g=rx,o=rx), set to 0755 (octal) or 493 (base-10). * This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

            * `optional`: (Optional) Specify whether the Secret or its keys must be defined.

          * `empty_dir`: In memory (tmpfs) ephemeral storage. It is ephemeral in the sense that when the sandbox is taken down, the data is destroyed with it (it does not persist across sandbox runs).

            * `medium`: The medium on which the data is stored. The default is "" which means to use the node's default medium. Must be an empty string (default) or Memory. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir

            * `size_limit`: Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers. The default is nil which means that the limit is undefined. More info: https://cloud.google.com/run/docs/configuring/in-memory-volumes#configure-volume. Info in Kubernetes: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir

          * `nfs`: Represents a persistent volume that will be mounted using NFS. This volume will be shared between all instances of the resource and data will not be deleted when the instance is shut down.

            * `server`: Hostname or IP address of the NFS server.

            * `path`: Path that is exported by the NFS server.

            * `read_only`: If true, mount the NFS volume as read only. Defaults to false.

          * `csi`: Storage volume source using the Container Storage Interface.

            * `driver`: name of the CSI driver for the requested storage system. Cloud Run supports the following drivers: * gcsfuse.run.googleapis.com : Mount a Cloud Storage Bucket as a volume.

            * `read_only`: If true, mount the volume as read only. Defaults to false.

            * `volume_attributes`: stores driver specific attributes. For Google Cloud Storage volumes, the following attributes are supported: * bucketName: the name of the Cloud Storage bucket to mount. The Cloud Run Service identity must have access to this bucket.

              * `additional_properties`: 

        * `runtime_class_name`: Runtime. Leave unset for default.

        * `enable_service_links`: Not supported by Cloud Run.

        * `image_pull_secrets`: Not supported by Cloud Run.

          * `name`: Name of the referent.

        * `node_selector`: Optional. The Node Selector configuration. Map of selector key to a value which matches a node.

          * `additional_properties`: 

    * `traffic`: Specifies how to distribute traffic over a collection of Knative Revisions and Configurations to the Service's main URL.

      * `configuration_name`: [Deprecated] Not supported in Cloud Run. It must be empty.

      * `revision_name`: Points this traffic target to a specific Revision. This field is mutually exclusive with latest_revision.

      * `percent`: Percent specifies percent of the traffic to this Revision or Configuration. This defaults to zero if unspecified.

      * `tag`: Tag is used to expose a dedicated url for referencing this target exclusively.

      * `latest_revision`: Uses the "status.latestReadyRevisionName" of the Service to determine the traffic target. When it changes, traffic will automatically migrate from the prior "latest ready" revision to the new one. This field must be false if RevisionName is set. This field defaults to true otherwise. If the field is set to true on Status, this means that the Revision was resolved from the Service's latest ready revision.

      * `url`: Output only. URL displays the URL for accessing tagged traffic targets. URL is displayed in status, and is disallowed on spec. URL must contain a scheme (e.g. https://) and a hostname, but may not contain anything else (e.g. basic auth, url path, etc.)

  * `status`: The current state of the Service. Output only.

    * `observed_generation`: Returns the generation last seen by the system. Clients polling for completed reconciliation should poll until observedGeneration = metadata.generation and the Ready condition's status is True or False.

    * `conditions`: Conditions communicate information about ongoing/complete reconciliation processes that bring the `spec` inline with the observed state of the world. Service-specific conditions include: * `ConfigurationsReady`: `True` when the underlying Configuration is ready. * `RoutesReady`: `True` when the underlying Route is ready. * `Ready`: `True` when all underlying resources are ready.

      * `type`: type is used to communicate the status of the reconciliation process. Types common to all resources include: * "Ready" or "Completed": True when the Resource is ready.

      * `status`: Status of the condition, one of True, False, Unknown.

      * `reason`: Optional. One-word CamelCase reason for the condition's last transition. These are intended to be stable, unique values which the client may use to trigger error handling logic, whereas messages which may be changed later by the server.

      * `message`: Optional. Human readable message indicating details about the current status.

      * `last_transition_time`: Optional. Last time the condition transitioned from one status to another.

      * `severity`: Optional. How to interpret this condition. One of Error, Warning, or Info. Conditions of severity Info do not contribute to resource readiness.

    * `latest_ready_revision_name`: Name of the latest Revision from this Service's Configuration that has had its `Ready` condition become `True`.

    * `latest_created_revision_name`: Name of the last revision that was created from this Service's Configuration. It might not be ready yet, for that use LatestReadyRevisionName.

    * `traffic`: Holds the configured traffic distribution. These entries will always contain RevisionName references. When ConfigurationName appears in the spec, this will hold the LatestReadyRevisionName that we last observed.

      * `configuration_name`: [Deprecated] Not supported in Cloud Run. It must be empty.

      * `revision_name`: Points this traffic target to a specific Revision. This field is mutually exclusive with latest_revision.

      * `percent`: Percent specifies percent of the traffic to this Revision or Configuration. This defaults to zero if unspecified.

      * `tag`: Tag is used to expose a dedicated url for referencing this target exclusively.

      * `latest_revision`: Uses the "status.latestReadyRevisionName" of the Service to determine the traffic target. When it changes, traffic will automatically migrate from the prior "latest ready" revision to the new one. This field must be false if RevisionName is set. This field defaults to true otherwise. If the field is set to true on Status, this means that the Revision was resolved from the Service's latest ready revision.

      * `url`: Output only. URL displays the URL for accessing tagged traffic targets. URL is displayed in status, and is disallowed on spec. URL must contain a scheme (e.g. https://) and a hostname, but may not contain anything else (e.g. basic auth, url path, etc.)

    * `url`: URL that will distribute traffic over the provided traffic targets. It generally has the form `https://{route-hash}-{project-hash}-{cluster-level-suffix}.a.run.app`

    * `address`: Information for connecting over HTTP(s).

      * `url`: 


## GCP Permissions

Ensure the [https://run.googleapis.com/](https://console.cloud.google.com/apis/library/run.googleapis.com/) is enabled for the current project.
