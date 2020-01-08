---
title: About the google_storage_buckets resource
platform: gcp
---

## Syntax
A `google_storage_buckets` is used to test a Google Bucket resource

## Examples
```
describe google_storage_buckets(project: 'chef-gcp-inspec') do
  its('bucket_names') { should include bucket-name }
end
```

## Properties
Properties that can be accessed from the `google_storage_buckets` resource:

See [google_storage_bucket.md](google_storage_bucket.md) for more detailed information
  * `acls`: an array of `google_storage_bucket` acl
  * `cors`: an array of `google_storage_bucket` cors
  * `default_object_acls`: an array of `google_storage_bucket` default_object_acl
  * `bucket_ids`: an array of `google_storage_bucket` id
  * `lifecycles`: an array of `google_storage_bucket` lifecycle
  * `bucket_locations`: an array of `google_storage_bucket` location
  * `loggings`: an array of `google_storage_bucket` logging
  * `metagenerations`: an array of `google_storage_bucket` metageneration
  * `bucket_names`: an array of `google_storage_bucket` name
  * `owners`: an array of `google_storage_bucket` owner
  * `bucket_project_numbers`: an array of `google_storage_bucket` project_number
  * `storage_classes`: an array of `google_storage_bucket` storage_class
  * `time_createds`: an array of `google_storage_bucket` time_created
  * `updateds`: an array of `google_storage_bucket` updated
  * `versionings`: an array of `google_storage_bucket` versioning
  * `websites`: an array of `google_storage_bucket` website
  * `projects`: an array of `google_storage_bucket` project
  * `predefined_default_object_acls`: an array of `google_storage_bucket` predefined_default_object_acl

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
