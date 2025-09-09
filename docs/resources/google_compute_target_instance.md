+++
title = "google_compute_target_instance resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_target_instance"
identifier = "inspec/resources/gcp/google_compute_target_instance Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_target_instance` InSpec audit resource to to test a Google Cloud TargetInstance resource.

## Examples

```ruby
describe google_compute_target_instance(project: 'chef-gcp-inspec', name: ' ', zone: ' value_zone') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('zone') { should cmp 'value_zone' }
	its('nat_policy') { should cmp 'value_natpolicy' }
	its('instance') { should cmp 'value_instance' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('network') { should cmp 'value_network' }
	its('security_policy') { should cmp 'value_securitypolicy' }

end

describe google_compute_target_instance(project: 'chef-gcp-inspec', name: ' ', zone: ' value_zone') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_instance` resource:


  * `kind`: [Output Only] The type of the resource. Always compute#targetInstance for target instances.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `zone`: [Output Only] URL of the zone where the target instance resides. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `nat_policy`: Must have a value of NO_NAT. Protocol forwarding delivers packets while preserving the destination IP address of the forwarding rule referencing the target instance.
  Possible values:
    * NO_NAT

  * `instance`: A URL to the virtual machine instance that handles traffic for this target instance. When creating a target instance, you can provide the fully-qualified URL or a valid partial URL to the desired virtual machine. For example, the following are all valid URLs: - https://www.googleapis.com/compute/v1/projects/project/zones/zone /instances/instance - projects/project/zones/zone/instances/instance - zones/zone/instances/instance

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `network`: The URL of the network this target instance uses to forward traffic. If not specified, the traffic will be forwarded to the network that the default network interface belongs to.

  * `security_policy`: [Output Only] The resource URL for the security policy associated with this target instance.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
