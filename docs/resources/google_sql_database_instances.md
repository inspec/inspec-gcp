---
title: About the google_sql_database_instances resource
platform: gcp
---

## Syntax
A `google_sql_database_instances` is used to test a Google DatabaseInstance resource

## Examples
```

describe google_sql_database_instances(project: 'chef-gcp-inspec') do
  its('instance_states') { should include 'RUNNABLE' }
  its('instance_names') { should include 'my-database' }
end
```

## Properties
Properties that can be accessed from the `google_sql_database_instances` resource:

See [google_sql_database_instance.md](google_sql_database_instance.md) for more detailed information
  * `backend_types`: an array of `google_sql_database_instance` backend_type
  * `connection_names`: an array of `google_sql_database_instance` connection_name
  * `instance_versions`: an array of `google_sql_database_instance` database_version
  * `failover_replicas`: an array of `google_sql_database_instance` failover_replica
  * `instance_types`: an array of `google_sql_database_instance` instance_type
  * `ip_addresses`: an array of `google_sql_database_instance` ip_addresses
  * `ipv6_addresses`: an array of `google_sql_database_instance` ipv6_address
  * `master_instance_names`: an array of `google_sql_database_instance` master_instance_name
  * `max_disk_sizes`: an array of `google_sql_database_instance` max_disk_size
  * `instance_names`: an array of `google_sql_database_instance` name
  * `instance_regions`: an array of `google_sql_database_instance` region
  * `replica_configurations`: an array of `google_sql_database_instance` replica_configuration
  * `settings`: an array of `google_sql_database_instance` settings
  * `instance_zones`: an array of `google_sql_database_instance` gce_zone
  * `instance_states`: an array of `google_sql_database_instance` state

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
