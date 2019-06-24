---
title: About the google_compute_backend_service resource
platform: gcp
---

## Syntax
A `google_compute_backend_service` is used to test a Google BackendService resource

## Examples
```
describe google_compute_backend_service(project: 'chef-gcp-inspec', name: 'inspec-gcp-backend-service') do
  it { should exist }
  its('description') { should eq 'A description' }
  its('port_name') { should eq 'http' }
  its('protocol') { should eq 'HTTP' }
  its('timeout_sec') { should eq '10' }
  its('enable_cdn') { should eq 'true' }
end

describe google_compute_backend_service(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_backend_service` resource:

  * `affinity_cookie_ttl_sec`: Lifetime of cookies in seconds if session_affinity is GENERATED_COOKIE. If set to 0, the cookie is non-persistent and lasts only until the end of the browser session (or equivalent). The maximum allowed value for TTL is one day.  When the load balancing scheme is INTERNAL, this field is not used.

  * `backends`: The set of backends that serve this BackendService.

    * `balancing_mode`: Specifies the balancing mode for this backend.  For global HTTP(S) or TCP/SSL load balancing, the default is UTILIZATION. Valid values are UTILIZATION, RATE (for HTTP(S)) and CONNECTION (for TCP/SSL).

    * `capacity_scaler`: A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION).  Default value is 1, which means the group will serve up to 100% of its configured capacity (depending on balancingMode). A setting of 0 means the group is completely drained, offering 0% of its available Capacity. Valid range is [0.0,1.0].

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `group`: The fully-qualified URL of an Instance Group or Network Endpoint Group resource. In case of instance group this defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself. No two backends in a backend service are allowed to use same Instance Group resource.  For Network Endpoint Groups this defines list of endpoints. All endpoints of Network Endpoint Group must be hosted on instances located in the same zone as the Network Endpoint Group.  Backend service can not contain mix of Instance Group and Network Endpoint Group backends.  Note that you must specify an Instance Group or Network Endpoint Group resource using the fully-qualified URL, rather than a partial URL.

    * `max_connections`: The max number of simultaneous connections for the group. Can be used with either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or one of maxConnectionsPerInstance or maxConnectionsPerEndpoint, as appropriate for group type, must be set.

    * `max_connections_per_instance`: The max number of simultaneous connections that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.

    * `max_connections_per_endpoint`: The max number of simultaneous connections that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or maxConnectionsPerEndpoint must be set.

    * `max_rate`: The max requests per second (RPS) of the group.  Can be used with either RATE or UTILIZATION balancing modes, but required if RATE mode. For RATE mode, either maxRate or one of maxRatePerInstance or maxRatePerEndpoint, as appropriate for group type, must be set.

    * `max_rate_per_instance`: The max requests per second (RPS) that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerInstance must be set.

    * `max_rate_per_endpoint`: The max requests per second (RPS) that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerEndpoint must be set.

    * `max_utilization`: Used when balancingMode is UTILIZATION. This ratio defines the CPU utilization target for the group. The default is 0.8. Valid range is [0.0, 1.0].

  * `cdn_policy`: Cloud CDN configuration for this BackendService.

    * `cache_key_policy`: The CacheKeyPolicy for this CdnPolicy.

    * `signed_url_cache_max_age_sec`: Maximum number of seconds the response to a signed URL request will be considered fresh, defaults to 1hr (3600s). After this time period, the response will be revalidated before being served.  When serving responses to signed URL requests, Cloud CDN will internally behave as though all responses from this backend had a "Cache-Control: public, max-age=[TTL]" header, regardless of any existing Cache-Control header. The actual headers served in responses will not be altered.

  * `connection_draining`: Settings for connection draining

    * `draining_timeout_sec`: Time for which instance will be drained (not accept new connections, but still work to finish started).

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

  * `description`: An optional description of this resource.

  * `enable_cdn`: If true, enable Cloud CDN for this BackendService.

  * `health_checks`: The set of URLs to the HttpHealthCheck or HttpsHealthCheck resource for health checking this BackendService. Currently at most one health check can be specified, and a health check is required.  For internal load balancing, a URL to a HealthCheck resource must be specified instead.

  * `id`: The unique identifier for the resource.

  * `iap`: Settings for enabling Cloud Identity Aware Proxy

    * `enabled`: Enables IAP.

    * `oauth2_client_id`: OAuth2 Client ID for IAP

    * `oauth2_client_secret`: OAuth2 Client Secret for IAP

    * `oauth2_client_secret_sha256`: OAuth2 Client Secret SHA-256 for IAP

  * `load_balancing_scheme`: Indicates whether the backend service will be used with internal or external load balancing. A backend service created for one type of load balancing cannot be used with the other. Must be `EXTERNAL` or `INTERNAL_SELF_MANAGED` for a global backend service. Defaults to `EXTERNAL`.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `port_name`: Name of backend port. The same name should appear in the instance groups referenced by this service. Required when the load balancing scheme is EXTERNAL.

  * `protocol`: The protocol this BackendService uses to communicate with backends. Possible values are HTTP, HTTPS, HTTP2, TCP, and SSL. The default is HTTP. **NOTE**: HTTP2 is only valid for beta HTTP/2 load balancer types and may result in errors if used with the GA API.

  * `security_policy`: The security policy associated with this backend service.

  * `session_affinity`: Type of session affinity to use. The default is NONE.  When the load balancing scheme is EXTERNAL, can be NONE, CLIENT_IP, or GENERATED_COOKIE.  When the protocol is UDP, this field is not used.

  * `timeout_sec`: How many seconds to wait for the backend before considering it a failed request. Default is 30 seconds. Valid range is [1, 86400].



## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
