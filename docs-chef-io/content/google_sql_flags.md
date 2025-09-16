+++
title = "google_sql_flags resource"

draft = false


[menu.gcp]
title = "google_sql_flags"
identifier = "inspec/resources/gcp/google_sql_flags resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sql_flags` InSpec audit resource to to test a Google Cloud Flag resource.

## Examples

```ruby
describe google_sql_flags do
its('names') { should include , 'audit_log' }
its('types') { should include , 'STRING' }
its('applies_tos.first') { should include , 'MYSQL_5_6' }
its('allowed_string_values.first') { should include , 'true' }
its('requires_restarts') { should include , 'true' }
end
```

## Properties

Properties that can be accessed from the `google_sql_flags` resource:

See [google_sql_flag](google_sql_flag) for more detailed information.

  * `allowed_string_values`: an array of `google_sql_flag` allowed_string_values
  * `applies_tos`: an array of `google_sql_flag` applies_to
  * `max_values`: an array of `google_sql_flag` max_value
  * `min_values`: an array of `google_sql_flag` min_value
  * `names`: an array of `google_sql_flag` name
  * `requires_restarts`: an array of `google_sql_flag` requires_restart
  * `types`: an array of `google_sql_flag` type

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
