+++
title = "google_artifactregistry_project_location_repository resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_artifactregistry_project_location_repository"
identifier = "inspec/resources/gcp/google_artifactregistry_project_location_repository Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_artifactregistry_project_location_repository` InSpec audit resource to to test a Google Cloud ProjectLocationRepository resource.

## Examples

```ruby
describe google_artifactregistry_project_location_repository(name: ' value_name') do
	it { should exist }

end

describe google_artifactregistry_project_location_repository(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_artifactregistry_project_location_repository` resource:


  * `maven_config`: MavenRepositoryConfig is maven related repository details. Provides additional configuration details for repositories of the maven format type.

    * `allow_snapshot_overwrites`: The repository with this flag will allow publishing the same snapshot versions.

    * `version_policy`: Version policy defines the versions that the registry will accept.
    Possible values:
      * VERSION_POLICY_UNSPECIFIED
      * RELEASE
      * SNAPSHOT

  * `docker_config`: DockerRepositoryConfig is docker related repository details. Provides additional configuration details for repositories of the docker format type.

    * `immutable_tags`: The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created.

  * `virtual_repository_config`: Virtual repository configuration.

    * `upstream_policies`: Policies that configure the upstream artifacts distributed by the Virtual Repository. Upstream policies cannot be set on a standard repository.

      * `id`: The user-provided ID of the upstream policy.

      * `repository`: A reference to the repository resource, for example: `projects/p1/locations/us-central1/repositories/repo1`.

      * `priority`: Entries with a greater priority value take precedence in the pull order.

  * `remote_repository_config`: Remote repository configuration.

    * `docker_repository`: Configuration for a Docker remote repository.

      * `public_repository`: One of the publicly available Docker repositories supported by Artifact Registry.
      Possible values:
        * PUBLIC_REPOSITORY_UNSPECIFIED
        * DOCKER_HUB

    * `maven_repository`: Configuration for a Maven remote repository.

      * `public_repository`: One of the publicly available Maven repositories supported by Artifact Registry.
      Possible values:
        * PUBLIC_REPOSITORY_UNSPECIFIED
        * MAVEN_CENTRAL

    * `npm_repository`: Configuration for a Npm remote repository.

      * `public_repository`: One of the publicly available Npm repositories supported by Artifact Registry.
      Possible values:
        * PUBLIC_REPOSITORY_UNSPECIFIED
        * NPMJS

    * `python_repository`: Configuration for a Python remote repository.

      * `public_repository`: One of the publicly available Python repositories supported by Artifact Registry.
      Possible values:
        * PUBLIC_REPOSITORY_UNSPECIFIED
        * PYPI

    * `apt_repository`: Configuration for an Apt remote repository.

      * `public_repository`: Publicly available Apt repositories constructed from a common repository base and a custom repository path.

        * `repository_base`: A common public repository base for Apt.
        Possible values:
          * REPOSITORY_BASE_UNSPECIFIED
          * DEBIAN
          * UBUNTU
          * DEBIAN_SNAPSHOT

        * `repository_path`: A custom field to define a path to a specific repository from the base.

    * `yum_repository`: Configuration for a Yum remote repository.

      * `public_repository`: Publicly available Yum repositories constructed from a common repository base and a custom repository path.

        * `repository_base`: A common public repository base for Yum.
        Possible values:
          * REPOSITORY_BASE_UNSPECIFIED
          * CENTOS
          * CENTOS_DEBUG
          * CENTOS_VAULT
          * CENTOS_STREAM
          * ROCKY
          * EPEL

        * `repository_path`: A custom field to define a path to a specific repository from the base.

    * `description`: The description of the remote source.

    * `upstream_credentials`: The credentials to access the remote repository.

      * `username_password_credentials`: Username and password credentials.

        * `username`: The username to access the remote repository.

        * `password_secret_version`: The Secret Manager key version that holds the password to access the remote repository. Must be in the format of `projects/{project}/secrets/{secret}/versions/{version}`.

  * `name`: The name of the repository, for example: `projects/p1/locations/us-central1/repositories/repo1`.

  * `format`: Optional. The format of packages that are stored in the repository.
  Possible values:
    * FORMAT_UNSPECIFIED
    * DOCKER
    * MAVEN
    * NPM
    * APT
    * YUM
    * GOOGET
    * PYTHON
    * KFP
    * GO

  * `description`: The user-provided description of the repository.

  * `labels`: Labels with user-defined metadata. This field may contain up to 64 entries. Label keys and values may be no longer than 63 characters. Label keys must begin with a lowercase letter and may only contain lowercase letters, numeric characters, underscores, and dashes.

    * `additional_properties`: 

  * `create_time`: Output only. The time when the repository was created.

  * `update_time`: Output only. The time when the repository was last updated.

  * `kms_key_name`: The Cloud KMS resource name of the customer managed encryption key that's used to encrypt the contents of the Repository. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. This value may not be changed after the Repository has been created.

  * `mode`: Optional. The mode of the repository.
  Possible values:
    * MODE_UNSPECIFIED
    * STANDARD_REPOSITORY
    * VIRTUAL_REPOSITORY
    * REMOTE_REPOSITORY

  * `cleanup_policies`: Optional. Cleanup policies for this repository. Cleanup policies indicate when certain package versions can be automatically deleted. Map keys are policy IDs supplied by users during policy creation. They must unique within a repository and be under 128 characters in length.

    * `additional_properties`: Artifact policy configuration for repository cleanup policies.

  * `size_bytes`: Output only. The size, in bytes, of all artifact storage in this repository. Repositories that are generally available or in public preview use this to calculate storage costs.

  * `satisfies_pzs`: Output only. If set, the repository satisfies physical zone separation.

  * `cleanup_policy_dry_run`: Optional. If true, the cleanup pipeline is prevented from deleting versions in this repository.


## GCP permissions

Ensure the [Artifact Registry API](https://console.cloud.google.com/apis/library/artifactregistry.googleapis.com/) is enabled for the current project.
