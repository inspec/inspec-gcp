---
title: About the google_compute_backend_buckets resource
platform: gcp
---

## Syntax
A `google_compute_backend_buckets` is used to test a Google BackendBucket resource

## Examples
```
describe google_compute_backend_buckets(project: 'chef-gcp-inspec', name: 'inspec-gcp-backend-bucket') do
  its('descriptions') { should include 'Backend bucket example' }
  its('bucket_names') { should include 'gcp-inspec-storage-bucket' }
end
```

## Properties
Properties that can be accessed from the `google_compute_backend_buckets` resource:

See [google_compute_backend_bucket.md](google_compute_backend_bucket.md) for more detailed information
  * `bucket_names`: an array of `google_compute_backend_bucket` bucket_name
  * `cdn_policies`: an array of `google_compute_backend_bucket` cdn_policy
  * `creation_timestamps`: an array of `google_compute_backend_bucket` creation_timestamp
  * `descriptions`: an array of `google_compute_backend_bucket` description
  * `enable_cdns`: an array of `google_compute_backend_bucket` enable_cdn
  * `ids`: an array of `google_compute_backend_bucket` id
  * `names`: an array of `google_compute_backend_bucket` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
