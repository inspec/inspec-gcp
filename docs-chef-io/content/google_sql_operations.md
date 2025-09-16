+++
title = "google_sql_operations resource"

draft = false


[menu.gcp]
title = "google_sql_operations"
identifier = "inspec/resources/gcp/google_sql_operations resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sql_operations` InSpec audit resource to to test a Google Cloud Operation resource.

## Examples

```ruby
describe google_sql_operations(project: 'chef-gcp-inspec', instance: 'my-database') do
  it { should exist }
  its('names') { should include 'e5c522f1-8391-4830-a8ff-ff1cc4a7b2a5' }
  its('statuses') { should include 'DONE' }
  its('operation_types') { should include 'CREATE' }
end
```

## Properties

Properties that can be accessed from the `google_sql_operations` resource:

See [google_sql_operation](google_sql_operation) for more detailed information.

  * `users`: an array of `google_sql_operation` user
  * `names`: an array of `google_sql_operation` name
  * `statuses`: an array of `google_sql_operation` status
  * `operation_types`: an array of `google_sql_operation` operation_type
  * `instances`: an array of `google_sql_operation` instance

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
