---
title: About the google_kms_crypto_key_iam_binding Resource
platform: gcp
---

# google\_kms\_crypto\_key\_iam\_binding

Use the `google_kms_crypto_key_iam_binding` InSpec audit resource to test properties of a single GCP KMS Crypto Key IAM Binding.

<br>

## Availability

### Installation

This resource is available in the `inspec-gcp` [resource pack](https://www.inspec.io/docs/reference/glossary/#resource-pack).  To use it, add the following to your `inspec.yml` in your top-level profile:

    depends:
      inspec-gcp:
        git: https://github.com/inspec/inspec-gcp.git

You'll also need to setup your GCP credentials; see the resource pack [README](https://github.com/inspec/inspec-gcp#prerequisites).

## Syntax

A `google_kms_crypto_key_iam_binding` resource block declares the tests for a single KMS Crypto Key IAM Binding for specified role.

    describe google_kms_crypto_key_iam_binding(crypto_key_url: 'projects/project/locations/europe-west2/keyRings/key-ring/cryptoKeys/key-name',  role: "roles/owner") do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP KMS Crypto Key IAM Binding exists for the specified role

    describe google_kms_crypto_key_iam_binding(crypto_key_url: 'projects/project/locations/europe-west2/keyRings/key-ring/cryptoKeys/key-name',  role: "roles/owner") do
      it { should exist }
    end

### Test that a GCP KMS Crypto Key IAM Binding has the desired user included for the specified role

    describe google_kms_crypto_key_iam_binding(crypto_key_url: 'projects/project/locations/europe-west2/keyRings/key-ring/cryptoKeys/key-name',  role: "roles/owner") do
      its('members') {should include 'user:someuser@domain.com' }
    end

<br>

## Properties

*  `members`

<br>


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the project where the resource is located.