---
title: About the google_kms_key_ring_import_jobs resource
platform: gcp
---

## Syntax
A `google_kms_key_ring_import_jobs` is used to test a Google KeyRingImportJob resource

## Examples
```
describe google_kms_key_ring_import_job(project: 'chef-gcp-inspec',  location: 'europe-west2') do
  it { should exist }
end
```

## Properties
Properties that can be accessed from the `google_kms_key_ring_import_jobs` resource:

See [google_kms_key_ring_import_job.md](google_kms_key_ring_import_job.md) for more detailed information
  * `names`: an array of `google_kms_key_ring_import_job` name
  * `import_methods`: an array of `google_kms_key_ring_import_job` import_method
  * `protection_levels`: an array of `google_kms_key_ring_import_job` protection_level
  * `create_times`: an array of `google_kms_key_ring_import_job` create_time
  * `generate_times`: an array of `google_kms_key_ring_import_job` generate_time
  * `expire_times`: an array of `google_kms_key_ring_import_job` expire_time
  * `expire_event_times`: an array of `google_kms_key_ring_import_job` expire_event_time
  * `states`: an array of `google_kms_key_ring_import_job` state
  * `public_keys`: an array of `google_kms_key_ring_import_job` public_key
  * `attestations`: an array of `google_kms_key_ring_import_job` attestation
  * `key_rings`: an array of `google_kms_key_ring_import_job` key_ring
  * `import_job_ids`: an array of `google_kms_key_ring_import_job` import_job_id

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
