---
title: About the google_compute_target_ssl_proxy resource
platform: gcp
---

## Syntax
A `google_compute_target_ssl_proxy` is used to test a Google TargetSslProxy resource

## Examples
```
describe google_compute_target_ssl_proxy(project: 'chef-gcp-inspec', targetSslProxy: ' ') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }
	its('service') { should cmp 'value_service' }
	its('certificate_map') { should cmp 'value_certificatemap' }
	its('proxy_header') { should cmp 'value_proxyheader' }
	its('ssl_policy') { should cmp 'value_sslpolicy' }

end

describe google_compute_target_ssl_proxy(project: 'chef-gcp-inspec', targetSslProxy: ' ') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_target_ssl_proxy` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#targetSslProxy for target SSL proxies.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `service`: URL to the BackendService resource.

  * `ssl_certificates`: URLs to SslCertificate resources that are used to authenticate connections to Backends. At least one SSL certificate must be specified. Currently, you may specify up to 15 SSL certificates. sslCertificates do not apply when the load balancing scheme is set to INTERNAL_SELF_MANAGED.

  * `certificate_map`: URL of a certificate map that identifies a certificate map associated with the given target proxy. This field can only be set for global target proxies. If set, sslCertificates will be ignored. Accepted format is //certificatemanager.googleapis.com/projects/{project }/locations/{location}/certificateMaps/{resourceName}.

  * `proxy_header`: Specifies the type of proxy header to append before sending data to the backend, either NONE or PROXY_V1. The default is NONE.
  Possible values:
    * NONE
    * PROXY_V1

  * `ssl_policy`: URL of SslPolicy resource that will be associated with the TargetSslProxy resource. If not set, the TargetSslProxy resource will not have any SSL policy configured.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
