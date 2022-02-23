---
title: About the google_sql_databases resource
platform: gcp
---

## Syntax
A `google_sql_databases` is used to test a Google Database resource

## Examples
```
describe google_sql_databases(project: 'chef-gcp-inspec', instance: 'my-database') do
  it { should exist }
  its('names') { should include 'my-db' }
  its('instances') { should include 'my-database' }
end
```

## Properties
Properties that can be accessed from the `google_sql_databases` resource:

See [google_sql_database.md](google_sql_database.md) for more detailed information
  * `charsets`: an array of `google_sql_database` charset
  * `collations`: an array of `google_sql_database` collation
  * `names`: an array of `google_sql_database` name
  * `instances`: an array of `google_sql_database` instance

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
