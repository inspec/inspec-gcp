---
title: About the google_compute_region_backend_service resource
platform: gcp
---

## Syntax
A `google_compute_region_backend_service` is used to test a Google RegionBackendService resource

## Examples
```
describe google_compute_region_backend_service(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-gcp-region-backend-service') do
  it { should exist }
  its('description') { should eq 'A regional description' }
  its('protocol') { should eq 'TCP' }
  its('timeout_sec') { should eq '15' }
end

describe google_compute_region_backend_service(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_backend_service` resource:


  * `backends`: The set of backends that serve this RegionBackendService.

    * `balancing_mode`: Specifies the balancing mode for this backend. Defaults to CONNECTION.

    * `capacity_scaler`: A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION).  A setting of 0 means the group is completely drained, offering 0% of its available Capacity. Valid range is [0.0,1.0].

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `group`: The fully-qualified URL of an Instance Group or Network Endpoint Group resource. In case of instance group this defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself. No two backends in a backend service are allowed to use same Instance Group resource.  For Network Endpoint Groups this defines list of endpoints. All endpoints of Network Endpoint Group must be hosted on instances located in the same zone as the Network Endpoint Group.  Backend services cannot mix Instance Group and Network Endpoint Group backends.  When the `load_balancing_scheme` is INTERNAL, only instance groups are supported.  Note that you must specify an Instance Group or Network Endpoint Group resource using the fully-qualified URL, rather than a partial URL.

    * `max_connections`: The max number of simultaneous connections for the group. Can be used with either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or one of maxConnectionsPerInstance or maxConnectionsPerEndpoint, as appropriate for group type, must be set.

    * `max_connections_per_instance`: The max number of simultaneous connections that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.

    * `max_connections_per_endpoint`: The max number of simultaneous connections that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or maxConnectionsPerEndpoint must be set.

    * `max_rate`: The max requests per second (RPS) of the group.  Can be used with either RATE or UTILIZATION balancing modes, but required if RATE mode. Either maxRate or one of maxRatePerInstance or maxRatePerEndpoint, as appropriate for group type, must be set.

    * `max_rate_per_instance`: The max requests per second (RPS) that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerInstance must be set.

    * `max_rate_per_endpoint`: The max requests per second (RPS) that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerEndpoint must be set.

    * `max_utilization`: Used when balancingMode is UTILIZATION. This ratio defines the CPU utilization target for the group. Valid range is [0.0, 1.0].

  * `connection_draining`: Settings for connection draining

    * `draining_timeout_sec`: Time for which instance will be drained (not accept new connections, but still work to finish started).

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

  * `health_checks`: The set of URLs to HealthCheck resources for health checking this RegionBackendService. Currently at most one health check can be specified, and a health check is required.

  * `id`: The unique identifier for the resource.

  * `load_balancing_scheme`: Indicates what kind of load balancing this regional backend service will be used for. A backend service created for one type of load balancing cannot be used with the other(s). Must be `INTERNAL` or `INTERNAL_MANAGED`. Defaults to `INTERNAL`.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `protocol`: The protocol this RegionBackendService uses to communicate with backends. Possible values are HTTP, HTTPS, HTTP2, SSL, TCP, and UDP. The default is HTTP. **NOTE**: HTTP2 is only valid for beta HTTP/2 load balancer types and may result in errors if used with the GA API.

  * `session_affinity`: Type of session affinity to use. The default is NONE. Session affinity is not applicable if the protocol is UDP.

  * `timeout_sec`: How many seconds to wait for the backend before considering it a failed request. Default is 30 seconds. Valid range is [1, 86400].

  * `region`: A reference to the region where the regional backend service resides.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
