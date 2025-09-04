+++
title = "google_secret_manager_secret resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_secret_manager_secret"
identifier = "inspec/resources/gcp/google_secret_manager_secret Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_secret_manager_secret` is used to test a Google Secret resource

## Examples
```
describe google_secret_manager_secret(name: ' value_name') do
	it { should exist }

end

describe google_secret_manager_secret(name: "does_not_exit") do
	it { should_not exist }
end

```

## Properties
Properties that can be accessed from the `google_secret_manager_secret` resource:


  * `name`: The resource name of the Secret. Format: `projects/{{project}}/secrets/{{secret_id}}`

  * `create_time`: The time at which the Secret was created.

  * `labels`: The labels assigned to this Secret.  Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62}  Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63}  No more than 64 labels can be assigned to a given resource.  An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

  * `replication`: The replication policy of the secret data attached to the Secret. It cannot be changed after the Secret has been created.

    * `automatic`: The Secret will automatically be replicated without any restrictions.

    * `user_managed`: The Secret will automatically be replicated without any restrictions.

      * `replicas`: The list of Replicas for this Secret. Cannot be empty.

        * `location`: The canonical IDs of the location to replicate data. For example: "us-east1".

        * `customer_managed_encryption`: Customer Managed Encryption for the secret.

          * `kms_key_name`: Describes the Cloud KMS encryption key that will be used to protect destination secret.

  * `topics`: A list of up to 10 Pub/Sub topics to which messages are published when control plane operations are called on the secret or its versions.

    * `name`: The resource name of the Pub/Sub topic that will be published to, in the following format: projects/*/topics/*. For publication to succeed, the Secret Manager Service Agent service account must have pubsub.publisher permissions on the topic.

  * `expire_time`: Timestamp in UTC when the Secret is scheduled to expire. This is always provided on output, regardless of what was sent on input. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `ttl`: The TTL for the Secret. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

  * `rotation`: The rotation time and period for a Secret. At `next_rotation_time`, Secret Manager will send a Pub/Sub notification to the topics configured on the Secret. `topics` must be set to configure rotation.

    * `next_rotation_time`: Timestamp in UTC at which the Secret is scheduled to rotate. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

    * `rotation_period`: The Duration between rotation notifications. Must be in seconds and at least 3600s (1h) and at most 3153600000s (100 years). If rotationPeriod is set, `next_rotation_time` must be set. `next_rotation_time` will be advanced by this period when the service automatically sends rotation notifications.

  * `secret_id`: This must be unique within the project.


## GCP Permissions

Ensure the [Secret Manager API](https://console.cloud.google.com/apis/library/secretmanager.googleapis.com/) is enabled for the current project.
