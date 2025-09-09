+++
title = "google_kms_key_ring_import_job resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_kms_key_ring_import_job"
identifier = "inspec/resources/gcp/google_kms_key_ring_import_job Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_kms_key_ring_import_job` InSpec audit resource to to test a Google Cloud KeyRingImportJob resource.

## Examples

```ruby
describe google_kms_key_ring_import_job(project: 'chef-gcp-inspec', location: 'europe-west2', name: '') do
  it { should exist }
end

describe google_kms_key_ring_import_job(project: 'chef-gcp-inspec', location: 'nonexistent', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_kms_key_ring_import_job` resource:


  * `name`: The resource name for this ImportJob in the format projects/*/locations/*/keyRings/*/importJobs/*.

  * `import_method`: The wrapping method to be used for incoming key material.
  Possible values:
    * RSA_OAEP_3072_SHA1_AES_256
    * RSA_OAEP_4096_SHA1_AES_256

  * `protection_level`: The protection level of the ImportJob. This must match the protectionLevel of the versionTemplate on the CryptoKey you attempt to import into.
  Possible values:
    * SOFTWARE
    * HSM
    * EXTERNAL

  * `create_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `generate_time`: The time that this resource was generated. This is in RFC3339 text format.

  * `expire_time`: The time at which this resource is scheduled for expiration and can no longer be used. This is in RFC3339 text format.

  * `expire_event_time`: The time this resource expired. Only present if state is EXPIRED.

  * `state`: The current state of the ImportJob, indicating if it can be used.

  * `public_key`: The public key with which to wrap key material prior to import. Only returned if state is `ACTIVE`.

    * `pem`: The public key, encoded in PEM format. For more information, see the RFC 7468 sections for General Considerations and Textual Encoding of Subject Public Key Info.

  * `attestation`: Statement that was generated and signed by the key creator (for example, an HSM) at key creation time. Use this statement to verify attributes of the key as stored on the HSM, independently of Google. Only present if the chosen ImportMethod is one with a protection level of HSM.

    * `format`: The format of the attestation data.

    * `content`: The attestation data provided by the HSM when the key operation was performed. A base64-encoded string.

  * `key_ring`: The KeyRing that this import job belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`.

  * `import_job_id`: It must be unique within a KeyRing and match the regular expression [a-zA-Z0-9_-]{1,63}


## GCP permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
