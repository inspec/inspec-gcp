---
title: About the google_memcache_instance resource
platform: gcp
---

## Syntax
A `google_memcache_instance` is used to test a Google Instance resource

## Examples
```
describe google_memcache_instance(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'mem-instance') do
  it { should exist }
  its('node_count') { should cmp 1 }
end

describe google_memcache_instance(project: 'chef-gcp-inspec', region: 'europe-west2', name: "nonexistent") do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_memcache_instance` resource:


  * `name`: (Beta only) The resource name of the instance.

  * `display_name`: (Beta only) A user-visible name for the instance.

  * `create_time`: (Beta only) Creation timestamp in RFC3339 text format.

  * `labels`: (Beta only) Resource labels to represent user-provided metadata.

  * `zones`: (Beta only) Zones where memcache nodes should be provisioned.  If not provided, all zones will be used.

  * `authorized_network`: (Beta only) The full name of the GCE network to connect the instance to.  If not provided, 'default' will be used.

  * `node_count`: (Beta only) Number of nodes in the memcache instance.

  * `node_config`: (Beta only) Configuration for memcache nodes.

    * `cpu_count`: (Beta only) Number of CPUs per node.

    * `memory_size_mb`: (Beta only) Memory size in Mebibytes for each memcache node.

  * `parameters`: (Beta only) User-specified parameters for this memcache instance.

    * `id`: (Beta only) This is a unique ID associated with this set of parameters.

    * `params`: (Beta only) User-defined set of parameters to use in the memcache process.

  * `region`: (Beta only) The name of the Memcache region of the instance.


## GCP Permissions
