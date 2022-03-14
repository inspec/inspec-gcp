---
title: About the google_compute_region_instance_group resource
platform: gcp
---

## Syntax
A `google_compute_region_instance_group` is used to test a Google RegionInstanceGroup resource

## Examples
```
describe google_compute_region_instance_group(project: 'chef-gcp-inspec', region: 'us-central1', name: 'instance-group-2') do
it { should exist }
its('name') { should eq 'instance-group-2' }
its('size') { should eq '1' }
its('named_ports.first.name') { should eq 'port' }
its('named_ports.first.port') { should eq '80' }
end

describe google_compute_region_instance_group(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_instance_group` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `fingerprint`: The fingerprint of the named ports. The system uses this fingerprint to detect conflicts when multiple users change the named ports concurrently. base64-encoded string.

  * `network`: The URL of the network to which all instances in the instance group belong. If your instance has multiple network interfaces, then the network and subnetwork fields only refer to the network and subnet used by your primary interface (nic0).

  * `zone`: The URL of the zone where the instance group is located (for zonal resources).

  * `size`: The total number of instances in the instance group.

  * `region`:  The URL of the region where the instance group is located (for regional resources).

  * `named_ports`: Assigns a name to a port number. For example: {name: "http", port: 80} This allows the system to reference ports by the assigned name instead of a port number. Named ports can also contain multiple ports. For example: [{name: "http", port: 80},{name: "http", port: 8080}] Named ports apply to all instances in this instance group.

    * `name`: The name for this named port. The name must be 1-63 characters long, and comply with RFC1035.

    * `port`: The port number, which can be a value between 1 and 65535.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
