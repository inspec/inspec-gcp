---
title: About the google_storage_bucket_acl resource
platform: gcp
---

## Syntax
A `google_storage_bucket_acl` is used to test a Google BucketACL resource

## Examples
```
describe google_storage_bucket_acl(bucket: 'storage-bucket-name', entity: user-email) do
  it { should exist }
  its('role') { should cmp "OWNER" }

  its('bucket') { should eq 'storage-bucket-name' }
  its('email') { should include entity-email.com }
end

describe google_storage_bucket_acl(bucket: 'storage-bucket-name', entity: "allUsers") do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_storage_bucket_acl` resource:


  * `domain`: The domain associated with the entity.

  * `email`: The email address associated with the entity.

  * `entity`: The entity holding the permission, in one of the following forms:   user-userId   user-email   group-groupId   group-email   domain-domain   project-team-projectId   allUsers   allAuthenticatedUsers Examples:   The user liz@example.com would be user-liz@example.com.   The group example@googlegroups.com would be   group-example@googlegroups.com.   To refer to all members of the Google Apps for Business domain   example.com, the entity would be domain-example.com.

  * `entity_id`: The ID for the entity

  * `id`: The ID of the access-control entry.

  * `project_team`: The project team associated with the entity

    * `project_number`: The project team associated with the entity

    * `team`: The team.

  * `role`: The access permission for the entity.


## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
