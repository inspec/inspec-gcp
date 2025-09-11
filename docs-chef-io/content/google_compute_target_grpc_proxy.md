+++
title = "google_compute_target_grpc_proxy resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_target_grpc_proxy"
identifier = "inspec/resources/gcp/google_compute_target_grpc_proxy resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_target_grpc_proxy` InSpec audit resource to to test a Google Cloud TargetGrpcProxy resource.

## Examples

```ruby
describe google_compute_target_grpc_proxy(project: 'chef-gcp-inspec', name: ' ') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('url_map') { should cmp 'value_urlmap' }
	its('fingerprint') { should cmp 'value_fingerprint' }

end

describe google_compute_target_grpc_proxy(project: 'chef-gcp-inspec', name: ' ') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_grpc_proxy` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#targetGrpcProxy for target grpc proxies.

  * `id`: [Output Only] The unique identifier for the resource type. The server generates this identifier.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL with id for the resource.

  * `url_map`: URL to the UrlMap resource that defines the mapping from URL to the BackendService. The protocol field in the BackendService must be set to GRPC.

  * `validate_for_proxyless`: If true, indicates that the BackendServices referenced by the urlMap may be accessed by gRPC applications without using a sidecar proxy. This will enable configuration checks on urlMap and its referenced BackendServices to not allow unsupported features. A gRPC application must use "xds:///" scheme in the target URI of the service it is connecting to. If false, indicates that the BackendServices referenced by the urlMap will be accessed by gRPC applications via a sidecar proxy. In this case, a gRPC application must not use "xds:///" scheme in the target URI of the service it is connecting to

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a TargetGrpcProxy. An up-to-date fingerprint must be provided in order to patch/update the TargetGrpcProxy; otherwise, the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve the TargetGrpcProxy.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
