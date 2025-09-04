+++
title = "google_access_context_manager_access_level resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_access_context_manager_access_level"
identifier = "inspec/resources/gcp/google_access_context_manager_access_level Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_access_context_manager_access_level` is used to test a Google AccessLevel resource

## Examples
```

policy_name = google_access_context_manager_access_policies(org_id: '190694428152').names.first

describe google_access_context_manager_access_level(parent: policy_name, name: "ip_subnet") do
  it { should exist }
  its('title') { should cmp "ip_subnet" }
  its('basic.conditions.size') { should cmp 1 }
  its('basic.conditions.first.ip_subnetworks') { should include "192.0.2.0/24" }
end

describe google_access_context_manager_access_level(parent: policy_name, name: "none") do
  it { should_not exist }
end

```

## Properties
Properties that can be accessed from the `google_access_context_manager_access_level` resource:


  * `title`: Human readable title. Must be unique within the Policy.

  * `description`: Description of the AccessLevel and its use. Does not affect behavior.

  * `basic`: A set of predefined conditions for the access level and a combining function.

    * `combining_function`: How the conditions list should be combined to determine if a request is granted this AccessLevel. If AND is used, each Condition in conditions must be satisfied for the AccessLevel to be applied. If OR is used, at least one Condition in conditions must be satisfied for the AccessLevel to be applied.
    Possible values:
      * AND
      * OR

    * `conditions`: A set of requirements for the AccessLevel to be granted.

      * `ip_subnetworks`: A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (i.e. all the host bits must be zero) or the input is considered malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas "2001:db8::1/32" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed.

      * `required_access_levels`: A list of other access levels defined in the same Policy, referenced by resource name. Referencing an AccessLevel which does not exist is an error. All access levels listed must be granted for the Condition to be true. Format: accessPolicies/{policy_id}/accessLevels/{short_name}

      * `members`: An allowed list of members (users, service accounts). Using groups is not supported yet.  The signed-in user originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, not present in any groups, etc.). Formats: `user:{emailid}`, `serviceAccount:{emailid}`

      * `negate`: Whether to negate the Condition. If true, the Condition becomes a NAND over its non-empty fields, each field must be false for the Condition overall to be satisfied. Defaults to false.

      * `device_policy`: Device specific restrictions, all restrictions must hold for the Condition to be true. If not specified, all devices are allowed.

        * `require_screen_lock`: Whether or not screenlock is required for the DevicePolicy to be true. Defaults to false.

        * `allowed_encryption_statuses`: A list of allowed encryptions statuses. An empty list allows all statuses.

        * `allowed_device_management_levels`: A list of allowed device management levels. An empty list allows all management levels.

        * `os_constraints`: A list of allowed OS versions. An empty list allows all types and all versions.

          * `minimum_version`: The minimum allowed OS version. If not set, any version of this OS satisfies the constraint. Format: "major.minor.patch" such as "10.5.301", "9.2.1".

          * `os_type`: The operating system type of the device.
          Possible values:
            * OS_UNSPECIFIED
            * DESKTOP_MAC
            * DESKTOP_WINDOWS
            * DESKTOP_LINUX
            * DESKTOP_CHROME_OS

        * `require_admin_approval`: Whether the device needs to be approved by the customer admin.

        * `require_corp_owned`: Whether the device needs to be corp owned.

      * `regions`: The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code.

  * `custom`: Custom access level conditions are set using the Cloud Common Expression Language to represent the necessary conditions for the level to apply to a request.  See CEL spec at: https://github.com/google/cel-spec.

    * `expr`: Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. This page details the objects and attributes that are used to the build the CEL expressions for  custom access levels - https://cloud.google.com/access-context-manager/docs/custom-access-level-spec.

      * `expression`: Textual representation of an expression in Common Expression Language syntax.

      * `title`: Title for the expression, i.e. a short string describing its purpose.

      * `description`: Description of the expression

      * `location`: String indicating the location of the expression for error reporting, e.g. a file name and a position in the file

  * `parent`: Name of the parent access policy

  * `name`: Name of the access level


## GCP Permissions
