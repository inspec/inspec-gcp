+++
title = "google_orgpolicy_project_constraints resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_orgpolicy_project_constraints"
identifier = "inspec/resources/gcp/google_orgpolicy_project_constraints Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_orgpolicy_project_constraints` is used to test a Google Orgpolicy Project Constraint resource

## Examples
```
  describe google_orgpolicy_project_constraints(parent: 'projects/test') do
    it { should exist }
    its('names') { should include 'value_name'}
    its('display_names') { should include 'value_display_name'}
    its('descriptions') { should include 'value_description'}
    its('constraint_defaults') { should include value_constraint_default'}
  end
```

## Properties
Properties that can be accessed from the `google_orgpolicy_project_constraint` resource:

  * `display_names`: The human readable name. Mutable.

  * `descriptions`: Detailed description of what this constraint controls as well as how and where it is enforced. Mutable.

  * `constraint_defaults`: The evaluation behavior of this constraint in the absence of a policy.
  Possible values:
    * CONSTRAINT_DEFAULT_UNSPECIFIED
    * ALLOW
    * DENY

  * `supports_dry_runs`: Shows if dry run is supported for this constraint or not.

  * `names`: Immutable. The resource name of the constraint. Must be in one of the following forms: * `projects/{project_number}/constraints/{constraint_name}` * `folders/{folder_id}/constraints/{constraint_name}` * `organizations/{organization_id}/constraints/{constraint_name}` For example, "/projects/123/constraints/compute.disableSerialPortAccess".

  * `list_constraints`: A constraint that allows or disallows a list of string values, which are configured by an Organization Policy administrator with a policy.

    * `supports_under`: Indicates whether subtrees of the Resource Manager resource hierarchy can be used in `Policy.allowed_values` and `Policy.denied_values`. For example, `"under:folders/123"` would match any resource under the 'folders/123' folder.

    * `supports_in`: Indicates whether values grouped into categories can be used in `Policy.allowed_values` and `Policy.denied_values`. For example, `"in:Python"` would match any value in the 'Python' group.

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://orgpolicy.googleapis.com/](https://console.cloud.google.com/apis/library/orgpolicy.googleapis.com/) is enabled for the current project.
