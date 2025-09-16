+++
title = "google_compute_region_target_http_proxy resource"

draft = false


[menu.gcp]
title = "google_compute_region_target_http_proxy"
identifier = "inspec/resources/gcp/google_compute_region_target_http_proxy resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_target_http_proxy` InSpec audit resource to to test a Google Cloud RegionTargetHttpProxy resource.

## Examples

```ruby
describe google_compute_region_target_http_proxy(project: 'chef-gcp-inspec', region: ' value_region', targetHttpProxy: ' ') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('url_map') { should cmp 'value_urlmap' }
	its('region') { should cmp 'value_region' }
	its('fingerprint') { should cmp 'value_fingerprint' }

end

describe google_compute_region_target_http_proxy(project: 'chef-gcp-inspec', region: ' value_region', targetHttpProxy: ' ') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_region_target_http_proxy` resource:


  * `kind`: [Output Only] Type of resource. Always compute#targetHttpProxy for target HTTP proxies.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `url_map`: URL to the UrlMap resource that defines the mapping from URL to the BackendService.

  * `region`: [Output Only] URL of the region where the regional Target HTTP Proxy resides. This field is not applicable to global Target HTTP Proxies.

  * `proxy_bind`: This field only applies when the forwarding rule that references this target proxy has a loadBalancingScheme set to INTERNAL_SELF_MANAGED. When this field is set to true, Envoy proxies set up inbound traffic interception and bind to the IP address and port specified in the forwarding rule. This is generally useful when using Traffic Director to configure Envoy as a gateway or middle proxy (in other words, not a sidecar proxy). The Envoy proxy listens for inbound requests and handles requests when it receives them. The default is false.

  * `http_filters`: URLs to networkservices.HttpFilter resources enabled for xDS clients using this configuration. For example, https://networkservices.googleapis.com/v1alpha1/projects/project/locations/ locationhttpFilters/httpFilter Only filters that handle outbound connection and stream events may be specified. These filters work in conjunction with a default set of HTTP filters that may already be configured by Traffic Director. Traffic Director will determine the final location of these filters within xDS configuration based on the name of the HTTP filter. If Traffic Director positions multiple filters at the same location, those filters will be in the same order as specified in this list. httpFilters only applies for loadbalancers with loadBalancingScheme set to INTERNAL_SELF_MANAGED. See ForwardingRule for more details.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a TargetHttpProxy. An up-to-date fingerprint must be provided in order to patch/update the TargetHttpProxy; otherwise, the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve the TargetHttpProxy.

  * `http_keep_alive_timeout_sec`: Specifies how long to keep a connection open, after completing a response, while there is no matching traffic (in seconds). If an HTTP keep-alive is not specified, a default value (610 seconds) will be used. For global external Application Load Balancers, the minimum allowed value is 5 seconds and the maximum allowed value is 1200 seconds. For classic Application Load Balancers, this option is not supported.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
