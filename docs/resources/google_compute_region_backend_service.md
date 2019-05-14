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

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `health_checks`: The list of HealthChecks for checking the health of the backend service. Currently at most one health check can be specified, and a health check is required.

  * `backends`: The list of backends that serve this RegionBackendService.

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `group`: The fully-qualified URL of an Instance Group. This defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself. No two backends in a backend service are allowed to use same Instance Group resource.  Note that you must specify an Instance Group resource using the fully-qualified URL, rather than a partial URL.  The instance group must be within the same region as the BackendService.

  * `description`: An optional description of this resource.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

  * `protocol`: The protocol this BackendService uses to communicate with backends.  The possible values are TCP and UDP, and the default is TCP.

  * `session_affinity`: Type of session affinity to use. The default is NONE.  Can be NONE, CLIENT_IP, CLIENT_IP_PROTO, or CLIENT_IP_PORT_PROTO.  When the protocol is UDP, this field is not used.

  * `region`: The region where the regional backend service resides.

  * `timeout_sec`: How many seconds to wait for the backend before considering it a failed request. Default is 30 seconds. Valid range is [1, 86400].

  * `connection_draining`: Settings for connection draining

    * `draining_timeout_sec`: Time for which instance will be drained (not accept new connections, but still work to finish started).

  * `load_balancing_scheme`: This signifies what the ForwardingRule will be used for and can only be INTERNAL for RegionBackendServices



## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
