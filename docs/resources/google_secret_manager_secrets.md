+++
title = "google_secret_manager_secrets resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_secret_manager_secrets"
identifier = "inspec/resources/gcp/google_secret_manager_secrets Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_secret_manager_secrets` InSpec audit resource to to test a Google Cloud Secret resource.

## Examples

```ruby
    describe google_secret_manager_secrets(parent: ' value_parent') do
    it { should exist }
  end

```

## Properties

Properties that can be accessed from the `google_secret_manager_secrets` resource:

See [google_secret_manager_secret](google_secret_manager_secret) for more detailed information.

  * `names`: an array of `google_secret_manager_secret` name
  * `create_times`: an array of `google_secret_manager_secret` create_time
  * `labels`: an array of `google_secret_manager_secret` labels
  * `replications`: an array of `google_secret_manager_secret` replication
  * `topics`: an array of `google_secret_manager_secret` topics
  * `expire_times`: an array of `google_secret_manager_secret` expire_time
  * `ttls`: an array of `google_secret_manager_secret` ttl
  * `rotations`: an array of `google_secret_manager_secret` rotation
  * `secret_ids`: an array of `google_secret_manager_secret` secret_id

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Secret Manager API](https://console.cloud.google.com/apis/library/secretmanager.googleapis.com/) is enabled for the current project.
