+++
title = "About the Chef InSpec Google Cloud Platform resource pack"
draft = false
linkTitle = "GCP resource pack"
summary = "Chef InSpec resources for auditing Google Cloud Platform."

[cascade]
  [cascade.params]
    platform = "gcp"

[menu.gcp]
  title = "About GCP resources"
  identifier = "inspec/resources/gcp/about"
  parent = "inspec/resources/gcp"
  weight = 10
+++

Chef InSpec has resources for auditing Google Cloud Platform (GCP).

## Prerequisites

To use Chef InSpec GCP resources:

- [Install and configure the Google Cloud SDK](https://cloud.google.com/sdk/docs/).

## Initialize an InSpec profile for auditing GCP

To use the GCP resources, follow these steps:

1. Create a [service account](https://cloud.google.com/docs/authentication/getting-started) with the scopes appropriate for your needs.

1. Download the credential JSON file, for example `project-credentials.json`, to your workspace and activate your service account:

    ```bash
    gcloud auth activate-service-account --key-file project-credentials.json
    ```

1. Create an InSpec profile for testing GCP resources:

    ```bash
    inspec init profile --platform gcp <PROFILE_NAME>
    ```

1. Create controls using the resources listed below.

1. Assuming the `inputs.yml` file contains your GCP project ID, you execute the profile can then be executed using the following command:

    ```bash
    inspec exec <PROFILE_NAME> --input-file=<PROFILE_NAME>/inputs.yml -t gcp://
    ```

## Google Cloud Platform resources

The following InSpec Google Cloud resources are available in this resource pack.

{{< inspec_resources_filter >}}

{{< inspec_resources section="gcp" platform="gcp" >}}
