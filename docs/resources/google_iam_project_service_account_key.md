---
title: About the google_iam_project_service_account_key resource
platform: gcp
---

## Syntax
A `google_iam_project_service_account_key` is used to test a Google ProjectServiceAccountKey resource

## Examples
```
describe google_iam_project_service_account_key(name: ' value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('private_key_type') { should cmp 'value_privatekeytype' }
	its('key_algorithm') { should cmp 'value_keyalgorithm' }
	its('private_key_data') { should cmp 'value_privatekeydata' }
	its('public_key_data') { should cmp 'value_publickeydata' }
	its('valid_after_time') { should cmp 'value_validaftertime' }
	its('valid_before_time') { should cmp 'value_validbeforetime' }
	its('key_origin') { should cmp 'value_keyorigin' }
	its('key_type') { should cmp 'value_keytype' }

end

describe google_iam_project_service_account_key(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_iam_project_service_account_key` resource:


  * `name`: The resource name of the service account key in the following format `projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT}/keys/{key}`.

  * `private_key_type`: The output format for the private key. Only provided in `CreateServiceAccountKey` responses, not in `GetServiceAccountKey` or `ListServiceAccountKey` responses. Google never exposes system-managed private keys, and never retains user-managed private keys.
  Possible values:
    * TYPE_UNSPECIFIED
    * TYPE_PKCS12_FILE
    * TYPE_GOOGLE_CREDENTIALS_FILE

  * `key_algorithm`: Specifies the algorithm (and possibly key size) for the key.
  Possible values:
    * KEY_ALG_UNSPECIFIED
    * KEY_ALG_RSA_1024
    * KEY_ALG_RSA_2048

  * `private_key_data`: The private key data. Only provided in `CreateServiceAccountKey` responses. Make sure to keep the private key data secure because it allows for the assertion of the service account identity. When base64 decoded, the private key data can be used to authenticate with Google API client libraries and with gcloud auth activate-service-account.

  * `public_key_data`: The public key data. Only provided in `GetServiceAccountKey` responses.

  * `valid_after_time`: The key can be used after this timestamp.

  * `valid_before_time`: The key can be used before this timestamp. For system-managed key pairs, this timestamp is the end time for the private key signing operation. The public key could still be used for verification for a few hours after this time.

  * `key_origin`: The key origin.
  Possible values:
    * ORIGIN_UNSPECIFIED
    * USER_PROVIDED
    * GOOGLE_PROVIDED

  * `key_type`: The key type.
  Possible values:
    * KEY_TYPE_UNSPECIFIED
    * USER_MANAGED
    * SYSTEM_MANAGED

  * `disabled`: The key status.


## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
