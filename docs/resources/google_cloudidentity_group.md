---
title: About the google_cloudidentity_group resource
platform: gcp
---

## Syntax
A `google_cloudidentity_group` is used to test a Google Group resource

## Examples
```
describe google_cloudidentity_group(project: 'chef-gcp-inspec', name: '') do
  it { should exist }
  it { should be_up }
end
```

## Properties
Properties that can be accessed from the `google_cloudidentity_group` resource:


  * `name`: Resource name of the Group in the format: groups/{group_id}, where group_id is the unique ID assigned to the Group.

  * `group_key`: EntityKey of the Group.

    * `id`: The ID of the entity.  For Google-managed entities, the id must be the email address of an existing group or user.  For external-identity-mapped entities, the id must be a string conforming to the Identity Source's requirements.  Must be unique within a namespace.

    * `namespace`: The namespace in which the entity exists.  If not specified, the EntityKey represents a Google-managed entity such as a Google user or a Google Group.  If specified, the EntityKey represents an external-identity-mapped group. The namespace must correspond to an identity source created in Admin Console and must be in the form of `identitysources/{identity_source_id}`.

  * `parent`: The resource name of the entity under which this Group resides in the Cloud Identity resource hierarchy.  Must be of the form identitysources/{identity_source_id} for external-identity-mapped groups or customers/{customer_id} for Google Groups.

  * `display_name`: The display name of the Group.

  * `description`: An extended description to help users determine the purpose of a Group. Must not be longer than 4,096 characters.

  * `create_time`: The time when the Group was created.

  * `update_time`: The time when the Group was last updated.

  * `labels`: The labels that apply to the Group.  Must not contain more than one entry. Must contain the entry 'cloudidentity.googleapis.com/groups.discussion_forum': '' if the Group is a Google Group or 'system/groups/external': '' if the Group is an external-identity-mapped group.

  * `initial_group_config`: The initial configuration options for creating a Group.  See the [API reference](https://cloud.google.com/identity/docs/reference/rest/v1beta1/groups/create#initialgroupconfig) for possible values.
  Possible values:
    * INITIAL_GROUP_CONFIG_UNSPECIFIED
    * WITH_INITIAL_OWNER
    * EMPTY


## GCP Permissions

Ensure the [Cloud Identity API](https://console.cloud.google.com/apis/api/cloudidentity.googleapis.com/overview) is enabled for the current project.
