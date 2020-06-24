---
title: About the google_memcache_instances resource
platform: gcp
---

## Syntax
A `google_memcache_instances` is used to test a Google Instance resource

## Examples
```
describe google_memcache_instances(project: 'chef-gcp-inspec', region: 'europe-west2') do
	its('count') { should be >= 1 }
  its('node_counts') { should include 1 }
end
```

## Properties
Properties that can be accessed from the `google_memcache_instances` resource:

See [google_memcache_instance.md](google_memcache_instance.md) for more detailed information
  * `names`: (Beta only) an array of `google_memcache_instance` name
  * `display_names`: (Beta only) an array of `google_memcache_instance` display_name
  * `create_times`: (Beta only) an array of `google_memcache_instance` create_time
  * `labels`: (Beta only) an array of `google_memcache_instance` labels
  * `zones`: (Beta only) an array of `google_memcache_instance` zones
  * `authorized_networks`: (Beta only) an array of `google_memcache_instance` authorized_network
  * `node_counts`: (Beta only) an array of `google_memcache_instance` node_count
  * `node_configs`: (Beta only) an array of `google_memcache_instance` node_config
  * `memcache_parameters`: (Beta only) an array of `google_memcache_instance` memcache_parameters
  * `regions`: (Beta only) an array of `google_memcache_instance` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
