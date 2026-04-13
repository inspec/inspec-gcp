---
title: About the google_parameter_manager_parameter resource
platform: gcp
---

## Syntax
A `google_parameter_manager_parameter` is used to test a Google Parameter resource

## Examples
```
describe google_parameter_manager_parameter(name: 'projects/<project_id>/locations/global/parameters/<parameter_id>') do
	it { should exist }
end
describe google_parameter_manager_parameter(name: "does_not_exit") do
	it { should_not exist }
end
describe google_parameter_manager_parameter(name: 'projects/<project_id>/locations/<location_id>/parameters/<parameter_id>', region: <location_id>) do
	it { should exist }
end
describe google_parameter_manager_parameter(name: "does_not_exit", region: <location_id>) do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_parameter_manager_parameter` resource:


  * `name`: The resource name of the Parameter. Format: `projects/{{project_id}}/locations/global/parameters/{{parameter_id}}` or `projects/{{project_id}}/locations/{{location_id}}/parameters/{{parameter_id}}`

  * `create_time`: The time at which the Parameter was created.

  * `update_time`: The time at which the Parameter was updated.

  * `labels`: The labels assigned to this Parameter. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63}  No more than 64 labels can be assigned to a given resource.  An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

  * `format`: The format of the Parameter.

  * `kms_key`: The resource name of the Cloud KMS CryptoKey used to encrypt parameter version payload. Format `projects/{{project_id}}/locations/global/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}` or `projects/{{project_id}}/locations/{{location_id}}/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}`

  * `policy_member`: The policy member of the Parameter.

    * `iam_policy_uid_principal`: IAM policy binding member referring to a Google Cloud resource by system-assigned unique identifier.

## GCP Permissions

Ensure the [Parameter Manager API](https://console.cloud.google.com/apis/library/parametermanager.googleapis.com/) is enabled for the current project.
