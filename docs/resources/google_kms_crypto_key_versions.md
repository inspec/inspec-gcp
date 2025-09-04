+++
title = "google_kms_crypto_key_versions resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_kms_crypto_key_versions"
identifier = "inspec/resources/gcp/google_kms_crypto_key_versions Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_kms_crypto_key_versions` is used to test a Google CryptoKeyVersion resource

## Examples
```
describe google_kms_crypto_key_versions(project: 'chef-gcp-inspec', location: 'europe-west2', key_ring: 'kms-key-ring', crypto_key: '') do
  its('count') { should be >= 1 }
  its('crypto_key_names') { should include 'kms-key' }
end
```

## Properties
Properties that can be accessed from the `google_kms_crypto_key_versions` resource:

See [google_kms_crypto_key_version.md](google_kms_crypto_key_version.md) for more detailed information
  * `names`: an array of `google_kms_crypto_key_version` name
  * `create_times`: an array of `google_kms_crypto_key_version` create_time
  * `generate_times`: an array of `google_kms_crypto_key_version` generate_time
  * `destroy_times`: an array of `google_kms_crypto_key_version` destroy_time
  * `destroy_event_times`: an array of `google_kms_crypto_key_version` destroy_event_time
  * `states`: an array of `google_kms_crypto_key_version` state
  * `protection_levels`: an array of `google_kms_crypto_key_version` protection_level
  * `algorithms`: an array of `google_kms_crypto_key_version` algorithm
  * `attestations`: an array of `google_kms_crypto_key_version` attestation
  * `import_jobs`: an array of `google_kms_crypto_key_version` import_job
  * `import_times`: an array of `google_kms_crypto_key_version` import_time
  * `import_failure_reasons`: an array of `google_kms_crypto_key_version` import_failure_reason
  * `external_protection_level_options`: an array of `google_kms_crypto_key_version` external_protection_level_options
  * `reimport_eligibles`: an array of `google_kms_crypto_key_version` reimport_eligible
  * `key_rings`: an array of `google_kms_crypto_key_version` key_ring
  * `crypto_keys`: an array of `google_kms_crypto_key_version` crypto_key

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
