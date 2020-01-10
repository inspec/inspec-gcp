---
title: About the google_sql_users resource
platform: gcp
---

## Syntax
A `google_sql_users` is used to test a Google User resource

## Examples
```

describe google_sql_users(project: 'chef-gcp-inspec', database: 'my-database') do
  its('user_names') { should include 'user-name' }
end
```

## Properties
Properties that can be accessed from the `google_sql_users` resource:

See [google_sql_user.md](google_sql_user.md) for more detailed information
  * `user_hosts`: an array of `google_sql_user` host
  * `user_names`: an array of `google_sql_user` name
  * `user_instances`: an array of `google_sql_user` instance
  * `passwords`: an array of `google_sql_user` password

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
