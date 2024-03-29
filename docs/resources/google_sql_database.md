---
title: About the google_sql_database resource
platform: gcp
---

## Syntax
A `google_sql_database` is used to test a Google Database resource

## Examples
```
describe google_sql_database(project: 'chef-gcp-inspec', instance: 'my-database', gcp_db_name: 'my-db') do
  it { should exist }
  its('name') { should eq 'my-db' }
  its('instance') { should eq 'my-database' }
end
```

## Properties
Properties that can be accessed from the `google_sql_database` resource:


  * `charset`: The charset value. See MySQL's [Supported Character Sets and Collations](https://dev.mysql.com/doc/refman/5.7/en/charset-charsets.html) and Postgres' [Character Set Support](https://www.postgresql.org/docs/9.6/static/multibyte.html) for more details and supported values. Postgres databases only support a value of `UTF8` at creation time.

  * `collation`: The collation value. See MySQL's [Supported Character Sets and Collations](https://dev.mysql.com/doc/refman/5.7/en/charset-charsets.html) and Postgres' [Collation Support](https://www.postgresql.org/docs/9.6/static/collation.html) for more details and supported values. Postgres databases only support a value of `en_US.UTF8` at creation time.

  * `name`: The name of the database in the Cloud SQL instance. This does not include the project ID or instance name.

  * `instance`: The name of the Cloud SQL instance. This does not include the project ID.


## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
