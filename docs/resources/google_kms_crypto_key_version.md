+++
title = "google_kms_crypto_key_version resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_kms_crypto_key_version"
identifier = "inspec/resources/gcp/google_kms_crypto_key_version Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_kms_crypto_key_version` is used to test a Google CryptoKeyVersion resource

## Examples
```
describe google_kms_crypto_key_version(project: 'chef-gcp-inspec', location: 'europe-west2', key_ring: 'kms-key-ring', crypto_key: '', name: 'kms-key') do
  it { should exist }
  its('crypto_key_name') { should cmp 'kms-key' }
  its('primary_state') { should eq "ENABLED" }
  its('purpose') { should eq "ENCRYPT_DECRYPT" }
  its('next_rotation_time') { should be > Time.now - 100000 }
  its('create_time') { should be > Time.now - 365*60*60*24*10 }
end

describe google_kms_crypto_key_version(project: 'chef-gcp-inspec', location: 'europe-west2', key_ring: 'kms-key-ring', crypto_key: '', name: "nonexistent") do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_kms_crypto_key_version` resource:


  * `name`: The resource name for the CryptoKey.

  * `create_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `generate_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `destroy_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `destroy_event_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `state`: The state of a CryptoKeyVersion, indicating if it can be used.
  Possible values:
    * CRYPTO_KEY_VERSION_STATE_UNSPECIFIED
    * PENDING_GENERATION
    * ENABLED
    * DISABLED
    * DESTROYED
    * DESTROY_SCHEDULED
    * PENDING_IMPORT
    * IMPORT_FAILED

  * `protection_level`: ProtectionLevel specifies how cryptographic operations are performed. For more information, see Protection levels.
  Possible values:
    * PROTECTION_LEVEL_UNSPECIFIED
    * SOFTWARE
    * HSM
    * EXTERNAL
    * EXTERNAL_VPC

  * `algorithm`: The algorithm of the CryptoKeyVersion, indicating what parameters must be used for each cryptographic operation. The GOOGLE_SYMMETRIC_ENCRYPTION algorithm is usable with CryptoKey.purpose ENCRYPT_DECRYPT. Algorithms beginning with "RSA_SIGN_" are usable with CryptoKey.purpose ASYMMETRIC_SIGN. The fields in the name after "RSA_SIGN_" correspond to the following parameters: padding algorithm, modulus bit length, and digest algorithm. For PSS, the salt length used is equal to the length of digest algorithm. For example, RSA_SIGN_PSS_2048_SHA256 will use PSS with a salt length of 256 bits or 32 bytes. Algorithms beginning with "RSA_DECRYPT_" are usable with CryptoKey.purpose ASYMMETRIC_DECRYPT. The fields in the name after "RSA_DECRYPT_" correspond to the following parameters: padding algorithm, modulus bit length, and digest algorithm. Algorithms beginning with "EC_SIGN_" are usable with CryptoKey.purpose ASYMMETRIC_SIGN. The fields in the name after "EC_SIGN_" correspond to the following parameters: elliptic curve, digest algorithm. Algorithms beginning with "HMAC_" are usable with CryptoKey.purpose MAC. The suffix following "HMAC_" corresponds to the hash algorithm being used (eg. SHA256).
  Possible values:
    * CRYPTO_KEY_VERSION_ALGORITHM_UNSPECIFIED
    * GOOGLE_SYMMETRIC_ENCRYPTION
    * RSA_SIGN_PSS_2048_SHA256
    * RSA_SIGN_PSS_3072_SHA256
    * RSA_SIGN_PSS_4096_SHA256
    * RSA_SIGN_PSS_4096_SHA512
    * RSA_SIGN_PKCS1_2048_SHA256
    * RSA_SIGN_PKCS1_3072_SHA256
    * RSA_SIGN_PKCS1_4096_SHA512
    * RSA_SIGN_PKCS1_4096_SHA256
    * RSA_SIGN_RAW_PKCS1_2048
    * RSA_SIGN_RAW_PKCS1_3072
    * RSA_SIGN_RAW_PKCS1_4096
    * RSA_DECRYPT_OAEP_2048_SHA256
    * RSA_DECRYPT_OAEP_3072_SHA256
    * RSA_DECRYPT_OAEP_4096_SHA256
    * RSA_DECRYPT_OAEP_4096_SHA512
    * RSA_DECRYPT_OAEP_2048_SHA1
    * RSA_DECRYPT_OAEP_3072_SHA1
    * RSA_DECRYPT_OAEP_4096_SHA1
    * EC_SIGN_P256_SHA256
    * EC_SIGN_P384_SHA384
    * EC_SIGN_SECP256K1_SHA256
    * HMAC_SHA256
    * EXTERNAL_SYMMETRIC_ENCRYPTION

  * `attestation`: Statement that was generated and signed by the key creator (for example, an HSM) at key creation time. Use this statement to verify attributes of the key as stored on the HSM, independently of Google. Only present if the chosen ImportMethod is one with a protection level of HSM.

    * `format`: The format of the attestation data.

    * `content`: The attestation data provided by the HSM when the key operation was performed. A base64-encoded string.

  * `import_job`: Output only. The name of the ImportJob used in the most recent import of this CryptoKeyVersion. Only present if the underlying key material was imported.

  * `import_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `import_failure_reason`: Output only. The root cause of the most recent import failure. Only present if state is IMPORT_FAILED.

  * `external_protection_level_options`: ExternalProtectionLevelOptions stores a group of additional fields for configuring a CryptoKeyVersion that are specific to the EXTERNAL protection level and EXTERNAL_VPC protection levels.

    * `external_key_uri`: The URI for an external resource that this CryptoKeyVersion represents.

    * `ekm_connection_key_path`: The path to the external key material on the EKM when using EkmConnection e.g., "v0/my/key". Set this field instead of externalKeyUri when using an EkmConnection.

  * `reimport_eligible`: Output only. Whether or not this key version is eligible for reimport, by being specified as a target in ImportCryptoKeyVersionRequest.crypto_key_version.

  * `key_ring`: The KeyRing that this key belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`.

  * `crypto_key`: The KeyRing that this key belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}/cryptoKeys/{{cryptoKey}}'`.


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
