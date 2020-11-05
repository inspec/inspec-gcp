---
title: About the google_cloudbuild_trigger resource
platform: gcp
---

## Syntax
A `google_cloudbuild_trigger` is used to test a Google Trigger resource

## Examples
```
describe google_cloudbuild_triggers(project: 'chef-gcp-inspec') do
  its('count') { should eq 1 }
end

google_cloudbuild_triggers(project: 'chef-gcp-inspec').ids.each do |id|
  describe google_cloudbuild_trigger(project: 'chef-gcp-inspec', id: id) do
    its('filename') { should eq 'cloudbuild.yaml' }
    its('trigger_template.branch_name') { should eq 'trigger-branch' }
    its('trigger_template.repo_name') { should eq 'trigger-repo' }
    its('trigger_template.project_id') { should eq 'trigger-project' }
  end
end
```

## Properties
Properties that can be accessed from the `google_cloudbuild_trigger` resource:


  * `id`: The unique identifier for the trigger.

  * `name`: Name of the trigger. Must be unique within the project.

  * `description`: Human-readable description of the trigger.

  * `tags`: Tags for annotation of a BuildTrigger

  * `disabled`: Whether the trigger is disabled or not. If true, the trigger will never result in a build.

  * `create_time`: Time when the trigger was created.

  * `substitutions`: Substitutions data for Build resource.

  * `filename`: Path, from the source root, to a file whose contents is used for the template. Either a filename or build template must be provided.

  * `ignored_files`: ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`.  If ignoredFiles and changed files are both empty, then they are not used to determine whether or not to trigger a build.  If ignoredFiles is not empty, then we ignore any files that match any of the ignored_file globs. If the change has no files that are outside of the ignoredFiles globs, then we do not trigger a build.

  * `included_files`: ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`.  If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is empty, then as far as this filter is concerned, we should trigger the build.  If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is not empty, then we make sure that at least one of those files matches a includedFiles glob. If not, then we do not trigger a build.

  * `trigger_template`: Template describing the types of source changes to trigger a build.  Branch and tag names in trigger templates are interpreted as regular expressions. Any branch or tag change that matches that regular expression will trigger a build.

    * `project_id`: ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.

    * `repo_name`: Name of the Cloud Source Repository. If omitted, the name "default" is assumed.

    * `dir`: Directory, relative to the source root, in which to run the build.  This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution.

    * `invert_regex`: Only trigger a build if the revision regex does NOT match the revision regex.

    * `branch_name`: Name of the branch to build. Exactly one a of branch name, tag, or commit SHA must be provided. This field is a regular expression.

    * `tag_name`: Name of the tag to build. Exactly one of a branch name, tag, or commit SHA must be provided. This field is a regular expression.

    * `commit_sha`: Explicit commit SHA to build. Exactly one of a branch name, tag, or commit SHA must be provided.

  * `github`: (Beta only) Describes the configuration of a trigger that creates a build whenever a GitHub event is received.

    * `owner`: Owner of the repository. For example: The owner for https://github.com/googlecloudplatform/cloud-builders is "googlecloudplatform".

    * `name`: Name of the repository. For example: The name for https://github.com/googlecloudplatform/cloud-builders is "cloud-builders".

    * `pull_request`: filter to match changes in pull requests.  Specify only one of pullRequest or push.

      * `branch`: Regex of branches to match.

      * `comment_control`: Whether to block builds on a "/gcbrun" comment from a repository owner or collaborator.
      Possible values:
        * COMMENTS_DISABLED
        * COMMENTS_ENABLED
        * COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY

      * `invert_regex`: If true, branches that do NOT match the git_ref will trigger a build.

    * `push`: filter to match changes in refs, like branches or tags.  Specify only one of pullRequest or push.

      * `invert_regex`: When true, only trigger a build if the revision regex does NOT match the git_ref regex.

      * `branch`: Regex of branches to match.  Specify only one of branch or tag.

      * `tag`: Regex of tags to match.  Specify only one of branch or tag.

  * `build`: Contents of the build template. Either a filename or build template must be provided.

    * `source`: The location of the source files to build.

      * `storage_source`: Location of the source in an archive file in Google Cloud Storage.

        * `bucket`: Google Cloud Storage bucket containing the source.

        * `object`: Google Cloud Storage object containing the source. This object must be a gzipped archive file (.tar.gz) containing source to build.

        * `generation`: Google Cloud Storage generation for the object.  If the generation is omitted, the latest generation will be used

      * `repo_source`: Location of the source in a Google Cloud Source Repository.

        * `project_id`: ID of the project that owns the Cloud Source Repository.  If omitted, the project ID requesting the build is assumed.

        * `repo_name`: Name of the Cloud Source Repository.

        * `dir`: Directory, relative to the source root, in which to run the build. This must be a relative path. If a step's dir is specified and is an absolute path,  this value is ignored for that step's execution.

        * `invert_regex`: Only trigger a build if the revision regex does NOT match the revision regex.

        * `substitutions`: Substitutions to use in a triggered build. Should only be used with triggers.run

        * `branch_name`: Regex matching branches to build. Exactly one a of branch name, tag, or commit SHA must be provided. The syntax of the regular expressions accepted is the syntax accepted by RE2 and  described at https://github.com/google/re2/wiki/Syntax

        * `tag_name`: Regex matching tags to build. Exactly one a of branch name, tag, or commit SHA must be provided. The syntax of the regular expressions accepted is the syntax accepted by RE2 and  described at https://github.com/google/re2/wiki/Syntax

        * `commit_sha`: Explicit commit SHA to build. Exactly one a of branch name, tag, or commit SHA must be provided.

    * `tags`: Tags for annotation of a Build. These are not docker tags.

    * `images`: A list of images to be pushed upon the successful completion of all build steps. The images are pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build status is marked FAILURE.

    * `substitutions`: Substitutions data for Build resource.

    * `queue_ttl`: TTL in queue for this build. If provided and the build is enqueued longer than this value,  the build will expire and the build status will be EXPIRED. The TTL starts ticking from createTime. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

    * `logs_bucket`: Google Cloud Storage bucket where logs should be written.  Logs file names will be of the format ${logsBucket}/log-${build_id}.txt.

    * `timeout`: Amount of time that this build should be allowed to run, to second granularity. If this amount of time elapses, work on the build will cease and the build status will be TIMEOUT. This timeout must be equal to or greater than the sum of the timeouts for build steps within the build. The expected format is the number of seconds followed by s. Default time is ten minutes (600s).

    * `secrets`: Secrets to decrypt using Cloud Key Management Service.

      * `kms_key_name`: Cloud KMS key name to use to decrypt these envs.

      * `secret_env`: Map of environment variable name to its encrypted value. Secret environment variables must be unique across all of a build's secrets,  and must be used by at least one build step. Values can be at most 64 KB in size.  There can be at most 100 secret values across all of a build's secrets.

    * `steps`: The operations to be performed on the workspace.

      * `name`: The name of the container image that will run this particular build step.  If the image is available in the host's Docker daemon's cache, it will be run directly. If not, the host will attempt to pull the image first, using the builder service account's credentials if necessary.  The Docker daemon's cache will already have the latest versions of all of the officially supported build steps (https://github.com/GoogleCloudPlatform/cloud-builders). The Docker daemon will also have cached many of the layers for some popular images, like "ubuntu", "debian", but they will be refreshed at the time you attempt to use them.  If you built an image in a previous build step, it will be stored in the host's Docker daemon's cache and is available to use as the name for a later build step.

      * `args`: A list of arguments that will be presented to the step when it is started.  If the image used to run the step's container has an entrypoint, the args are used as arguments to that entrypoint. If the image does not define an entrypoint, the first element in args is used as the entrypoint, and the remainder will be used as arguments.

      * `env`: A list of environment variable definitions to be used when running a step.  The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".

      * `id`: Unique identifier for this build step, used in `wait_for` to reference this build step as a dependency.

      * `entrypoint`: Entrypoint to be used instead of the build step image's default entrypoint. If unset, the image's default entrypoint is used

      * `dir`: Working directory to use when running this step's container.  If this value is a relative path, it is relative to the build's working directory. If this value is absolute, it may be outside the build's working directory, in which case the contents of the path may not be persisted across build step executions, unless a `volume` for that path is specified.  If the build specifies a `RepoSource` with `dir` and a step with a `dir`, which specifies an absolute path, the `RepoSource` `dir` is ignored for the step's execution.

      * `secret_env`: A list of environment variables which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's `Secret`.

      * `timeout`: Time limit for executing this build step. If not defined, the step has no time limit and will be allowed to continue to run until either it completes or the build itself times out.

      * `timing`: Output only. Stores timing information for executing this build step.

      * `volumes`: List of volumes to mount into the build step.  Each volume is created as an empty volume prior to execution of the build step. Upon completion of the build, volumes and their contents are discarded.  Using a named volume in only one step is not valid as it is indicative of a build request with an incorrect configuration.

        * `name`: Name of the volume to mount.  Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps.

        * `path`: Path at which to mount the volume.  Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths.

      * `wait_for`: The ID(s) of the step(s) that this build step depends on.  This build step will not start until all the build steps in `wait_for` have completed successfully. If `wait_for` is empty, this build step will start when all previous build steps in the `Build.Steps` list have completed successfully.

    * `artifacts`: Artifacts produced by the build that should be uploaded upon successful completion of all build steps.

      * `images`: A list of images to be pushed upon the successful completion of all build steps.  The images will be pushed using the builder service account's credentials.  The digests of the pushed images will be stored in the Build resource's results field.  If any of the images fail to be pushed, the build is marked FAILURE.

      * `objects`: A list of objects to be uploaded to Cloud Storage upon successful completion of all build steps.  Files in the workspace matching specified paths globs will be uploaded to the Cloud Storage location using the builder service account's credentials.  The location and generation of the uploaded objects will be stored in the Build resource's results field.  If any objects fail to be pushed, the build is marked FAILURE.

        * `location`: Cloud Storage bucket and optional object path, in the form "gs://bucket/path/to/somewhere/".  Files in the workspace matching any path pattern will be uploaded to Cloud Storage with this location as a prefix.

        * `paths`: Path globs used to match files in the build's workspace.

        * `timing`: Output only. Stores timing information for pushing all artifact objects.

          * `start_time`: Start of time span.  A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

          * `end_time`: End of time span.  A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

    * `options`: Special options for this build.

      * `source_provenance_hash`: Requested hash for SourceProvenance.

      * `requested_verify_option`: Requested verifiability options.
      Possible values:
        * NOT_VERIFIED
        * VERIFIED

      * `machine_type`: Compute Engine machine type on which to run the build.
      Possible values:
        * UNSPECIFIED
        * N1_HIGHCPU_8
        * N1_HIGHCPU_32

      * `disk_size_gb`: Requested disk size for the VM that runs the build. Note that this is NOT "disk free"; some of the space will be used by the operating system and build utilities. Also note that this is the minimum disk size that will be allocated for the build -- the build may run with a larger disk than requested. At present, the maximum disk size is 1000GB; builds that request more than the maximum are rejected with an error.

      * `substitution_option`: Option to specify behavior when there is an error in the substitution checks.  NOTE this is always set to ALLOW_LOOSE for triggered builds and cannot be overridden in the build configuration file.
      Possible values:
        * MUST_MATCH
        * ALLOW_LOOSE

      * `dynamic_substitutions`: Option to specify whether or not to apply bash style string operations to the substitutions.  NOTE this is always enabled for triggered builds and cannot be overridden in the build configuration file.

      * `log_streaming_option`: Option to define build log streaming behavior to Google Cloud Storage.
      Possible values:
        * STREAM_DEFAULT
        * STREAM_ON
        * STREAM_OFF

      * `worker_pool`: Option to specify a WorkerPool for the build. Format projects/{project}/workerPools/{workerPool}  This field is experimental.

      * `logging`: Option to specify the logging mode, which determines if and where build logs are stored.
      Possible values:
        * LOGGING_UNSPECIFIED
        * LEGACY
        * GCS_ONLY
        * STACKDRIVER_ONLY
        * NONE

      * `env`: A list of global environment variable definitions that will exist for all build steps in this build. If a variable is defined in both globally and in a build step, the variable will use the build step value.  The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".

      * `secret_env`: A list of global environment variables, which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's Secret. These variables will be available to all build steps in this build.

      * `volumes`: Global list of volumes to mount for ALL build steps  Each volume is created as an empty volume prior to starting the build process. Upon completion of the build, volumes and their contents are discarded. Global volume names and paths cannot conflict with the volumes defined a build step.  Using a global volume in a build with only one step is not valid as it is indicative of a build request with an incorrect configuration.

        * `name`: Name of the volume to mount.  Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps.

        * `path`: Path at which to mount the volume.  Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths.


## GCP Permissions

Ensure the [Cloud Build API](https://console.cloud.google.com/apis/library/cloudbuild.googleapis.com/) is enabled for the current project.
