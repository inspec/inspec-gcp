+++
title = "google_compute_network_edge_security_service resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_network_edge_security_service"
identifier = "inspec/resources/gcp/google_compute_network_edge_security_service Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_network_edge_security_service` InSpec audit resource to to test a Google Cloud NetworkEdgeSecurityService resource.

## Examples

```ruby
describe google_compute_network_edge_security_service(name: 'value_name', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('region') { should cmp 'value_region' }
	its('fingerprint') { should cmp 'value_fingerprint' }
	its('security_policy') { should cmp 'value_securitypolicy' }

end

describe google_compute_network_edge_security_service(name: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_network_edge_security_service` resource:


  * `kind`: [Output only] Type of the resource. Always compute#networkEdgeSecurityService for NetworkEdgeSecurityServices

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `region`: [Output Only] URL of the region where the resource resides. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a NetworkEdgeSecurityService. An up-to-date fingerprint must be provided in order to update the NetworkEdgeSecurityService, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve a NetworkEdgeSecurityService.

  * `security_policy`: The resource URL for the network edge security service associated with this network edge security service.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
