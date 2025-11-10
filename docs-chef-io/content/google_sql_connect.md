+++
title = "google_sql_connect resource"

draft = false


[menu.gcp]
title = "google_sql_connect"
identifier = "inspec/resources/gcp/google_sql_connect resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sql_connect` InSpec audit resource to to test a Google Cloud Connect resource.

## Examples

```ruby
describe google_sql_connect(project: 'chef-gcp-inspec', instance: 'test-pg') do
  it { should exist }
  its('region') { should include 'us-central1' }
  its('database_version') { should include 'POSTGRES_13' }
  its('backend_type') { should include 'SECOND_GEN' }
end

```

## Properties

Properties that can be accessed from the `google_sql_connect` resource:


  * `region`: The region where you want your Cloud SQL replicas to reside.

  * `ip_addresses`: The assigned IP addresses for the instance.

    * `ip_address`: The IP address assigned.

    * `time_to_retire`: The due time for this IP to be retired in RFC 3339 format, for example 2012-11-15T16:19:00.094Z. This field is only available when the IP is scheduled to be retired.

    * `type`: The type of this IP address. A PRIMARY address is an address that can accept incoming connections. An OUTGOING address is the source address of connections originating from the instance, if supported.
    Possible values:
      * PRIMARY
      * OUTGOING

  * `database_version`: The MySQL version running on your source database server.
  Possible values:
    * MYSQL_5_5
    * MYSQL_5_6
    * MYSQL_5_7
    * MYSQL_8_0

  * `backend_type`: * FIRST_GEN: First Generation instance. MySQL only. * SECOND_GEN: Second Generation instance or PostgreSQL instance. * EXTERNAL: A database server that is not managed by Google.
  Possible values:
    * FIRST_GEN
    * SECOND_GEN
    * EXTERNAL

  * `server_ca_cert`: Configuration specific to on-premises instances.

    * `cert`: PEM representation of the X.509 certificate.

    * `cert_serial_number`: Serial number, as extracted from the certificate.

    * `common_name`: User supplied name. Constrained to [a-zA-Z.-_ ]+.

    * `sha1_fingerprint`: Sha1 Fingerprint.

    * `instance`: Name of the database instance.

    * `create_time`: The time when the certificate was created in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.

    * `expiration_time`: The time when the certificate expires in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.


## GCP permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
