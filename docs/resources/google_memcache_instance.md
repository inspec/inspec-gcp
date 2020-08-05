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

  * `memcache_nodes`: (Beta only) Additional information about the instance state, if available.

    * `node_id`: (Beta only) Identifier of the Memcached node. The node id does not include project or location like the Memcached instance name.

    * `zone`: (Beta only) Location (GCP Zone) for the Memcached node.

    * `port`: (Beta only) The port number of the Memcached server on this node.

    * `host`: (Beta only) Hostname or IP address of the Memcached node used by the clients to connect to the Memcached server on this node.

    * `state`: (Beta only) Current state of the Memcached node.

  * `create_time`: (Beta only) Creation timestamp in RFC3339 text format.

  * `labels`: (Beta only) Resource labels to represent user-provided metadata.

  * `memcache_full_version`: (Beta only) The full version of memcached server running on this instance.

  * `zones`: (Beta only) Zones where memcache nodes should be provisioned.  If not provided, all zones will be used.

  * `authorized_network`: (Beta only) The full name of the GCE network to connect the instance to.  If not provided, 'default' will be used.

  * `node_count`: (Beta only) Number of nodes in the memcache instance.

  * `memcache_version`: (Beta only) The major version of Memcached software. If not provided, latest supported version will be used. Currently the latest supported major version is MEMCACHE_1_5. The minor version will be automatically determined by our system based on the latest supported minor version.
  Possible values:
    * MEMCACHE_1_5

  * `node_config`: (Beta only) Configuration for memcache nodes.

    * `cpu_count`: (Beta only) Number of CPUs per node.

    * `memory_size_mb`: (Beta only) Memory size in Mebibytes for each memcache node.

  * `parameters`: (Beta only) User-specified parameters for this memcache instance.

    * `id`: (Beta only) This is a unique ID associated with this set of parameters.

    * `params`: (Beta only) User-defined set of parameters to use in the memcache process.

  * `region`: (Beta only) The name of the Memcache region of the instance.


## GCP Permissions
