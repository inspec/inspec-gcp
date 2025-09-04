+++
title = "google_container_server_config resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_container_server_config"
identifier = "inspec/resources/gcp/google_container_server_config Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_container_server_config` is used to test a Google ServerConfig resource

## Examples
```

describe google_container_server_config(project: 'chef-gcp-inspec', location: 'europe-west2-a') do
  its('valid_master_versions') { should include '1.21.5-gke.1802'}
end
```

## Properties
Properties that can be accessed from the `google_container_server_config` resource:


  * `default_cluster_version`: Version of Kubernetes the service deploys by default.

  * `default_image_type`: Default image type.

  * `valid_image_types`: List of valid image types.

  * `valid_node_versions`: List of valid node upgrade target versions, in descending order.

  * `valid_master_versions`: List of valid master versions, in descending order.

  * `channels`: List of release channel configurations.

    * `channel`: The release channel this configuration applies to.
    Possible values:
      * UNSPECIFIED
      * RAPID
      * REGULAR
      * STABLE

    * `default_version`: The default version for newly created clusters on the channel.

    * `valid_versions`: List of valid versions for the channel.

  * `location`: The name of the Google Compute Engine location to return ServerConfig for.


## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
