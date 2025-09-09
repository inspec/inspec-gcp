+++
title = "google_sql_databases resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_sql_databases"
identifier = "inspec/resources/gcp/google_sql_databases Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sql_databases` InSpec audit resource to to test a Google Cloud Database resource.

## Examples

```ruby
describe google_sql_databases(project: 'chef-gcp-inspec', instance: 'my-database') do
  it { should exist }
  its('names') { should include 'my-db' }
  its('instances') { should include 'my-database' }
end
```

## Properties

Properties that can be accessed from the `google_sql_databases` resource:

See [google_sql_database](google_sql_database) for more detailed information.

  * `charsets`: an array of `google_sql_database` charset
  * `collations`: an array of `google_sql_database` collation
  * `names`: an array of `google_sql_database` name
  * `instances`: an array of `google_sql_database` instance

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
