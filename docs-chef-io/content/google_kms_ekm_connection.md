+++
title = "google_kms_ekm_connection resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_kms_ekm_connection"
identifier = "inspec/resources/gcp/google_kms_ekm_connection resource"
parent = "inspec/resources/gcp"
+++

Use the `google_kms_ekm_connection` InSpec audit resource to to test a Google Cloud EkmConnection resource.

## Examples

```ruby
describe google_kms_ekm_connection(project: 'chef-gcp-inspec', location: 'europe-west2', name: '') do
  it { should exist }
  its('name') { should cmp '' }
end

describe google_kms_ekm_connection(project: 'chef-gcp-inspec', location: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_kms_ekm_connection` resource:


  * `name`: Resource name for the location, which may vary between implementations. For example: projects/example-project/locations/us-east1

  * `create_time`: string (Timestamp format) Output only. The time at which the EkmConnection was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `service_resolvers`: object (ServiceResolver) A list of ServiceResolvers where the EKM can be reached. There should be one ServiceResolver per EKM replica. Currently, only a single ServiceResolver is supported.

    * `service_directory_service`: Required. The resource name of the Service Directory service pointing to an EKM replica, in the format projects/*/locations/*/namespaces/*/services/*.

    * `endpoint_filter`: Optional. The filter applied to the endpoints of the resolved service. If no filter is specified, all endpoints will be considered. An endpoint will be chosen arbitrarily from the filtered list for each request. For endpoint filter syntax and examples, see https://cloud.google.com/service-directory/docs/reference/rpc/google.cloud.servicedirectory.v1#resolveservicerequest.

    * `hostname`: Required. The hostname of the EKM replica used at TLS and HTTP layers.

    * `server_certificates`: A Certificate represents an X.509 certificate used to authenticate HTTPS connections to EKM replicas.

      * `raw_der`: Required. The raw certificate bytes in DER format. A base64-encoded string.

      * `parsed`: Output only. True if the certificate was parsed successfully.

      * `issuer`: Output only. The issuer distinguished name in RFC 2253 format. Only present if parsed is true.

      * `subject`: Output only. The subject distinguished name in RFC 2253 format. Only present if parsed is true.

      * `subject_alternative_dns_names`: Output only. The subject Alternative DNS names. Only present if parsed is true.

      * `not_before_time`: string (Timestamp format) Output only. The certificate is not valid before this time. Only present if parsed is true. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

      * `not_after_time`: string (Timestamp format) Output only. The certificate is not valid after this time. Only present if parsed is true. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

      * `serial_number`: Output only. The certificate serial number as a hex string. Only present if parsed is true.

      * `sha256_fingerprint`: Output only. The SHA-256 certificate fingerprint as a hex string. Only present if parsed is true.

  * `location`: Resource name for the location.


## GCP permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
