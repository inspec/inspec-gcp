---
title: About the google_compute_global_network_endpoint_group resource
platform: gcp
---

## Syntax
A `google_compute_global_network_endpoint_group` is used to test a Google GlobalNetworkEndpointGroup resource

## Examples
```

describe google_compute_global_network_endpoint_group(project: 'chef-gcp-inspec', name: 'inspec-gcp-global-endpoint-group') do
  it { should exist }
  its('default_port') { should cmp '90' }
  its('network_endpoint_type'){ should cmp 'INTERNET_IP_PORT' }
end

describe google_compute_global_network_endpoint_group(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end

```

## Properties
Properties that can be accessed from the `google_compute_global_network_endpoint_group` resource:


  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `network_endpoint_type`: Type of network endpoints in this network endpoint group.
  Possible values:
    * INTERNET_IP_PORT
    * INTERNET_FQDN_PORT

  * `default_port`: The default port used if the port number is not specified in the network endpoint.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
