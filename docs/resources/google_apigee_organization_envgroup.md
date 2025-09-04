+++
title = "google_apigee_organization_envgroup resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_apigee_organization_envgroup"
identifier = "inspec/resources/gcp/google_apigee_organization_envgroup Resource"
parent = "inspec/resources/gcp"
+++

## Syntax

A `google_apigee_organization_envgroup` is used to test a Google OrganizationEnvgroup resource

## Examples

```
describe google_apigee_organization_envgroup(name: ' value_name') do
  it { should exist }
  its('name') { should cmp 'value_name' }
  its('hostnames') { should include 'value_hostname' }
  its('last_modified_at') { should cmp 'value_lastmodifiedat' }
  its('state') { should cmp 'value_state' }
  its('created_at') { should cmp 'value_createdat' }
end

describe google_apigee_organization_envgroup(name: "does_not_exit") do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_apigee_organization_envgroup` resource:

  * `name`: ID of the environment group.

  * `last_modified_at`: The time at which the environment group was last updated as milliseconds since epoch.

  * `hostnames`: Host names for this environment group.

  * `state`: State of the environment group. Values other than ACTIVE means the resource is not ready to use.

  Possible values:
    * STATE_UNSPECIFIED
    * CREATING
    * ACTIVE
    * DELETING
    * UPDATING

  * `created_at`: The time at which the environment group was created as milliseconds since epoch.

## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
