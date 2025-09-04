+++
title = "google_sql_ssl_cert resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_sql_ssl_cert"
identifier = "inspec/resources/gcp/google_sql_ssl_cert Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_sql_ssl_cert` is used to test a Google SslCert resource

## Examples
```
describe google_sql_ssl_cert(project: 'chef-gcp-inspec', instance: 'test-pg', sha1_fingerprint:  '80c5c611c0a591db967c7dda3467e23127288fed') do
  it { should exist }
  its('instance') { should eq 'test-pg' }
  its('common_name') { should eq 'C=US,O=Google\, Inc,CN=Google Cloud SQL Server CA,dnQualifier=68c79386-b63e-4998-8254-ba59729cdf78' }
  its('sha1_fingerprint') { should eq '80c5c611c0a591db967c7dda3467e23127288fed' }
end

describe google_sql_ssl_cert(project: 'chef-gcp-inspec', instance: 'nonexistent', sha1_fingerprint:  '80c5c611c0a591db967c7dda3467e23127288fed') do
  it { should_not exist }
end

```

## Properties
Properties that can be accessed from the `google_sql_ssl_cert` resource:


  * `cert`: PEM representation of the X.509 certificate.

  * `cert_serial_number`: Serial number, as extracted from the certificate.

  * `common_name`: User supplied name. Constrained to [a-zA-Z.-_ ]+.

  * `create_time`: The time when the certificate was created in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.

  * `expiration_time`: The time when the certificate expires in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.

  * `instance`: The name of the Cloud SQL instance. This does not include the project ID.

  * `sha1_fingerprint`: The SHA-1 of the certificate.


## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
