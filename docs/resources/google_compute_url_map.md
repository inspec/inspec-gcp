---
title: About the google_compute_url_map resource
platform: gcp
---

## Syntax
A `google_compute_url_map` is used to test a Google UrlMap resource

## Examples
```
describe google_compute_url_map(project: 'chef-gcp-inspec', name: 'inspec-gcp-url-map') do
  it { should exist }
  its('description') { should eq 'URL map description' }
  its('default_service') { should match /\/inspec-gcp-backend-service$/ }
  its('host_rules.count') { should eq 1 }
  its('host_rules.first.hosts') { should include 'site.com' }
  its('path_matchers.count') { should eq 1 }
  its('path_matchers.first.default_service') { should match /\/inspec-gcp-backend-service$/ }
  its('tests.count') { should eq 1 }
  its('tests.first.host') { should eq 'test.com' }
  its('tests.first.path') { should eq '/home' }
end

describe google_compute_url_map(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_url_map` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `default_service`: The BackendService resource to which traffic is directed if none of the hostRules match. If defaultRouteAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if defaultService is specified, defaultRouteAction cannot contain any weightedBackendServices. Conversely, if routeAction specifies any weightedBackendServices, service must not be specified. Only one of defaultService, defaultUrlRedirect  or defaultRouteAction.weightedBackendService must be set.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

  * `header_action`: Specifies changes to request and response headers that need to take effect for the selected backendService. The headerAction specified here take effect after headerAction specified under pathMatcher.

    * `request_headers_to_add`: Headers to add to a matching request prior to forwarding the request to the backendService.

      * `header_name`: The name of the header.

      * `header_value`: The value of the header to add.

      * `replace`: If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

    * `request_headers_to_remove`: A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.

    * `response_headers_to_add`: Headers to add the response prior to sending the response back to the client.

      * `header_name`: The name of the header.

      * `header_value`: The value of the header to add.

      * `replace`: If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

    * `response_headers_to_remove`: A list of header names for headers that need to be removed from the response prior to sending the response back to the client.

  * `host_rules`: The list of HostRules to use against the URL.

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `hosts`: The list of host patterns to match. They must be valid hostnames, except * will match any string of ([a-z0-9-.]*). In that case, * must be the first character and must be followed in the pattern by either - or ..

    * `path_matcher`: The name of the PathMatcher to use to match the path portion of the URL if the hostRule matches the URL's host portion.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `path_matchers`: The list of named PathMatchers to use against the URL.

    * `default_service`: The BackendService resource. This will be used if none of the pathRules or routeRules defined by this PathMatcher are matched. For example, the following are all valid URLs to a BackendService resource:   - https://www.googleapis.com/compute/v1/projects/project/global/backendServices/backen dService   - compute/v1/projects/project/global/backendServices/backendService   - global/backendServices/backendService If defaultRouteAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if defaultService is specified, defaultRouteAction cannot contain any weightedBackendServices. Conversely, if defaultRouteAction specifies any weightedBackendServices, defaultService must not be specified. Only one of defaultService, defaultUrlRedirect  or defaultRouteAction.weightedBackendService must be set. Authorization requires one or more of the following Google IAM permissions on the specified resource default_service:   - compute.backendBuckets.use   - compute.backendServices.use

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `header_action`: Specifies changes to request and response headers that need to take effect for the selected backendService. HeaderAction specified here are applied after the matching HttpRouteRule HeaderAction and before the HeaderAction in the UrlMap

      * `request_headers_to_add`: Headers to add to a matching request prior to forwarding the request to the backendService.

        * `header_name`: The name of the header.

        * `header_value`: The value of the header to add.

        * `replace`: If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

      * `request_headers_to_remove`: A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.

      * `response_headers_to_add`: Headers to add the response prior to sending the response back to the client.

        * `header_name`: The name of the header.

        * `header_value`: The value of the header to add.

        * `replace`: If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

      * `response_headers_to_remove`: A list of header names for headers that need to be removed from the response prior to sending the response back to the client.

    * `name`: The name to which this PathMatcher is referred by the HostRule.

  * `tests`: The list of expected URL mapping tests. Request to update this UrlMap will succeed only if all of the test cases pass. You can specify a maximum of 100 tests per UrlMap.

    * `description`: Description of this test case.

    * `host`: Host portion of the URL.

    * `path`: Path portion of the URL.

    * `service`: Expected BackendService resource the given URL should be mapped to.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
