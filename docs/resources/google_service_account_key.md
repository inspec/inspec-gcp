+++
title = "google_service_account_key resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_service_account_key"
identifier = "inspec/resources/gcp/google_service_account_key Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_service_account_key` InSpec audit resource to to test a Google Cloud ServiceAccountKey resource.

## Examples

```ruby
google_service_account_keys(project: 'chef-gcp-inspec', service_account: "display-name@project-id.iam.gserviceaccount.com").key_names.each do |sa_key_name|
	describe google_service_account_key(project: 'chef-gcp-inspec', service_account: "display-name@project-id.iam.gserviceaccount.com", name: sa_key_name.split('/').last) do
		it { should exist }
		its('key_type') { should_not cmp 'USER_MANAGED' }
	end
end
```

### Test that a GCP project IAM service account key has the expected key algorithm

    describe google_service_account_key(name: "projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080" ) do
      its('key_algorithm') { should eq "KEY_ALG_RSA_2048" }
    end

## Properties

Properties that can be accessed from the `google_service_account_key` resource:


  * `name`: The name of the key.

  * `private_key_type`: Output format for the service account key.
  Possible values:
    * TYPE_UNSPECIFIED
    * TYPE_PKCS12_FILE
    * TYPE_GOOGLE_CREDENTIALS_FILE

  * `key_algorithm`: Specifies the algorithm for the key.
  Possible values:
    * KEY_ALG_UNSPECIFIED
    * KEY_ALG_RSA_1024
    * KEY_ALG_RSA_2048

  * `private_key_data`: Private key data. Base-64 encoded.

  * `public_key_data`: Public key data. Base-64 encoded.

  * `valid_after_time`: Key can only be used after this time.

  * `valid_before_time`: Key can only be used before this time.

  * `key_type`: Specifies the type of the key. Possible values include KEY_TYPE_UNSPECIFIED, USER_MANAGED and SYSTEM_MANAGED
  Possible values:
    * KEY_TYPE_UNSPECIFIED
    * USER_MANAGED
    * SYSTEM_MANAGED

  * `key_origin`: The key origin.
  Possible values:
    * ORIGIN_UNSPECIFIED
    * USER_PROVIDED
    * GOOGLE_PROVIDED

  * `service_account`: The name of the serviceAccount.

  * `path`: The full name of the file that will hold the service account private key. The management of this file will depend on the value of sync_file parameter.  File path must be absolute.
  * `disabled`: The key status.


## GCP permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
