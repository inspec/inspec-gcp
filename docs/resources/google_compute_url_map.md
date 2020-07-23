---
title: About the google_compute_url_map resource
platform: gcp
---

## Syntax
A `google_compute_url_map` is used to test a Google UrlMap resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

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

  * `default_service`: The full or partial URL of the defaultService resource to which traffic is directed if none of the hostRules match. If defaultRouteAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if defaultService is specified, defaultRouteAction cannot contain any weightedBackendServices. Conversely, if routeAction specifies any weightedBackendServices, service must not be specified. Only one of defaultService, defaultUrlRedirect or defaultRouteAction.weightedBackendService must be set.

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

    * `default_service`: The full or partial URL to the BackendService resource. This will be used if none of the pathRules or routeRules defined by this PathMatcher are matched. For example, the following are all valid URLs to a BackendService resource:   - https://www.googleapis.com/compute/v1/projects/project/global/backendServices/backendService   - compute/v1/projects/project/global/backendServices/backendService   - global/backendServices/backendService If defaultRouteAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if defaultService is specified, defaultRouteAction cannot contain any weightedBackendServices. Conversely, if defaultRouteAction specifies any weightedBackendServices, defaultService must not be specified. Only one of defaultService, defaultUrlRedirect or defaultRouteAction.weightedBackendService must be set. Authorization requires one or more of the following Google IAM permissions on the specified resource defaultService:   - compute.backendBuckets.use   - compute.backendServices.use

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

    * `default_url_redirect`: When none of the specified hostRules match, the request is redirected to a URL specified by defaultUrlRedirect. If defaultUrlRedirect is specified, defaultService or defaultRouteAction must not be set.

      * `host_redirect`: The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.

      * `https_redirect`: If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.

      * `path_redirect`: The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

      * `prefix_redirect`: The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

      * `redirect_response_code`: The HTTP Status code to use for this RedirectAction. Supported values are:  * MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301.  * FOUND, which corresponds to 302.  * SEE_OTHER which corresponds to 303.  * TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained.  * PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.
      Possible values:
        * FOUND
        * MOVED_PERMANENTLY_DEFAULT
        * PERMANENT_REDIRECT
        * SEE_OTHER
        * TEMPORARY_REDIRECT

      * `strip_query`: If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained.

    * `default_route_action`: defaultRouteAction takes effect when none of the pathRules or routeRules match. The load balancer performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected backend. If defaultRouteAction specifies any weightedBackendServices, defaultService must not be set. Conversely if defaultService is set, defaultRouteAction cannot contain any weightedBackendServices.  Only one of defaultRouteAction or defaultUrlRedirect must be set.

      * `url_rewrite`: The spec to modify the URL of the request, prior to forwarding the request to the matched service.

        * `path_prefix_rewrite`: Prior to forwarding the request to the selected backend service, the matching portion of the request's path is replaced by pathPrefixRewrite.  The value must be between 1 and 1024 characters.

        * `host_rewrite`: Prior to forwarding the request to the selected service, the request's host header is replaced with contents of hostRewrite.  The value must be between 1 and 255 characters.

      * `timeout`: Specifies the timeout for the selected route. Timeout is computed from the time the request has been fully processed (i.e. end-of-stream) up until the response has been completely processed. Timeout includes all retries.  If not specified, will use the largest timeout among all backend services associated with the route.

        * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

        * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

      * `retry_policy`: Specifies the retry policy associated with this route.

        * `retry_conditions`: Specfies one or more conditions when this retry rule applies. Valid values are:  5xx: Loadbalancer will attempt a retry if the backend service responds with any 5xx response code, or if the backend service does not respond at all, example: disconnects, reset, read timeout, connection failure, and refused streams. gateway-error: Similar to 5xx, but only applies to response codes 502, 503 or 504. connect-failure: Loadbalancer will retry on failures connecting to backend services, for example due to connection timeouts. retriable-4xx: Loadbalancer will retry for retriable 4xx response codes. Currently the only retriable error supported is 409. refused-stream:Loadbalancer will retry if the backend service resets the stream with a REFUSED_STREAM error code. This reset type indicates that it is safe to retry. cancelled: Loadbalancer will retry if the gRPC status code in the response header is set to cancelled deadline-exceeded: Loadbalancer will retry if the gRPC status code in the response header is set to deadline-exceeded resource-exhausted: Loadbalancer will retry if the gRPC status code in the response header is set to resource-exhausted unavailable: Loadbalancer will retry if the gRPC status code in the response header is set to unavailable

        * `num_retries`: Specifies the allowed number retries. This number must be > 0. If not specified, defaults to 1.

        * `per_try_timeout`: Specifies a non-zero timeout per retry attempt.  If not specified, will use the timeout set in HttpRouteAction. If timeout in HttpRouteAction is not set, will use the largest timeout among all backend services associated with the route.

          * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

          * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

      * `request_mirror_policy`: Specifies the policy on how requests intended for the route's backends are shadowed to a separate mirrored backend service. Loadbalancer does not wait for responses from the shadow service. Prior to sending traffic to the shadow service, the host / authority header is suffixed with -shadow.

        * `backend_service`: The full or partial URL to the BackendService resource being mirrored to.

      * `cors_policy`: The specification for allowing client side cross-origin requests. Please see [W3C Recommendation for Cross Origin Resource Sharing](https://www.w3.org/TR/cors/)

        * `allow_origins`: Specifies the list of origins that will be allowed to do CORS requests. An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.

        * `allow_origin_regexes`: Specifies the regualar expression patterns that match allowed origins. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.

        * `allow_methods`: Specifies the content for the Access-Control-Allow-Methods header.

        * `allow_headers`: Specifies the content for the Access-Control-Allow-Headers header.

        * `expose_headers`: Specifies the content for the Access-Control-Expose-Headers header.

        * `max_age`: Specifies how long results of a preflight request can be cached in seconds. This translates to the Access-Control-Max-Age header.

        * `allow_credentials`: In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access-Control-Allow-Credentials header.

        * `disabled`: If true, specifies the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect.

      * `fault_injection_policy`: The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. As part of fault injection, when clients send requests to a backend service, delays can be introduced by Loadbalancer on a percentage of requests before sending those request to the backend service. Similarly requests from clients can be aborted by the Loadbalancer for a percentage of requests.  timeout and retryPolicy will be ignored by clients that are configured with a faultInjectionPolicy.

        * `delay`: The specification for how client requests are delayed as part of fault injection, before being sent to a backend service.

          * `fixed_delay`: Specifies the value of the fixed delay interval.

            * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

            * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

          * `percentage`: The percentage of traffic (connections/operations/requests) on which delay will be introduced as part of fault injection. The value must be between 0.0 and 100.0 inclusive.

        * `abort`: The specification for how client requests are aborted as part of fault injection.

          * `http_status`: The HTTP status code used to abort the request. The value must be between 200 and 599 inclusive.

          * `percentage`: The percentage of traffic (connections/operations/requests) which will be aborted as part of fault injection. The value must be between 0.0 and 100.0 inclusive.

  * `tests`: The list of expected URL mapping tests. Request to update this UrlMap will succeed only if all of the test cases pass. You can specify a maximum of 100 tests per UrlMap.

    * `description`: Description of this test case.

    * `host`: Host portion of the URL.

    * `path`: Path portion of the URL.

    * `service`: Expected BackendService resource the given URL should be mapped to.

  * `default_url_redirect`: When none of the specified hostRules match, the request is redirected to a URL specified by defaultUrlRedirect. If defaultUrlRedirect is specified, defaultService or defaultRouteAction must not be set.

    * `host_redirect`: The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.

    * `https_redirect`: If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.

    * `path_redirect`: The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

    * `prefix_redirect`: The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

    * `redirect_response_code`: The HTTP Status code to use for this RedirectAction. Supported values are:  * MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301.  * FOUND, which corresponds to 302.  * SEE_OTHER which corresponds to 303.  * TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained.  * PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.
    Possible values:
      * FOUND
      * MOVED_PERMANENTLY_DEFAULT
      * PERMANENT_REDIRECT
      * SEE_OTHER
      * TEMPORARY_REDIRECT

    * `strip_query`: If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. The default is set to false.

  * `default_route_action`: defaultRouteAction takes effect when none of the hostRules match. The load balancer performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected backend. If defaultRouteAction specifies any weightedBackendServices, defaultService must not be set. Conversely if defaultService is set, defaultRouteAction cannot contain any weightedBackendServices.  Only one of defaultRouteAction or defaultUrlRedirect must be set.

    * `weighted_backend_services`: A list of weighted backend services to send traffic to when a route match occurs. The weights determine the fraction of traffic that flows to their corresponding backend service. If all traffic needs to go to a single backend service, there must be one weightedBackendService with weight set to a non 0 number.  Once a backendService is identified and before forwarding the request to the backend service, advanced routing actions like Url rewrites and header transformations are applied depending on additional settings specified in this HttpRouteAction.

      * `backend_service`: The full or partial URL to the default BackendService resource. Before forwarding the request to backendService, the loadbalancer applies any relevant headerActions specified as part of this backendServiceWeight.

      * `weight`: Specifies the fraction of traffic sent to backendService, computed as weight / (sum of all weightedBackendService weights in routeAction) .  The selection of a backend service is determined only for new traffic. Once a user's request has been directed to a backendService, subsequent requests will be sent to the same backendService as determined by the BackendService's session affinity policy.  The value must be between 0 and 1000

      * `header_action`: Specifies changes to request and response headers that need to take effect for the selected backendService.  headerAction specified here take effect before headerAction in the enclosing HttpRouteRule, PathMatcher and UrlMap.

        * `request_headers_to_remove`: A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.

        * `request_headers_to_add`: Headers to add to a matching request prior to forwarding the request to the backendService.

          * `header_name`: The name of the header to add.

          * `header_value`: The value of the header to add.

          * `replace`: If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

        * `response_headers_to_remove`: A list of header names for headers that need to be removed from the response prior to sending the response back to the client.

        * `response_headers_to_add`: Headers to add the response prior to sending the response back to the client.

          * `header_name`: The name of the header to add.

          * `header_value`: The value of the header to add.

          * `replace`: If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

    * `url_rewrite`: The spec to modify the URL of the request, prior to forwarding the request to the matched service.

      * `path_prefix_rewrite`: Prior to forwarding the request to the selected backend service, the matching portion of the request's path is replaced by pathPrefixRewrite.  The value must be between 1 and 1024 characters.

      * `host_rewrite`: Prior to forwarding the request to the selected service, the request's host header is replaced with contents of hostRewrite.  The value must be between 1 and 255 characters.

    * `timeout`: Specifies the timeout for the selected route. Timeout is computed from the time the request has been fully processed (i.e. end-of-stream) up until the response has been completely processed. Timeout includes all retries.  If not specified, will use the largest timeout among all backend services associated with the route.

      * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

      * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

    * `retry_policy`: Specifies the retry policy associated with this route.

      * `retry_conditions`: Specfies one or more conditions when this retry rule applies. Valid values are:  5xx: Loadbalancer will attempt a retry if the backend service responds with any 5xx response code, or if the backend service does not respond at all, example: disconnects, reset, read timeout, connection failure, and refused streams. gateway-error: Similar to 5xx, but only applies to response codes 502, 503 or 504. connect-failure: Loadbalancer will retry on failures connecting to backend services, for example due to connection timeouts. retriable-4xx: Loadbalancer will retry for retriable 4xx response codes. Currently the only retriable error supported is 409. refused-stream:Loadbalancer will retry if the backend service resets the stream with a REFUSED_STREAM error code. This reset type indicates that it is safe to retry. cancelled: Loadbalancer will retry if the gRPC status code in the response header is set to cancelled deadline-exceeded: Loadbalancer will retry if the gRPC status code in the response header is set to deadline-exceeded resource-exhausted: Loadbalancer will retry if the gRPC status code in the response header is set to resource-exhausted unavailable: Loadbalancer will retry if the gRPC status code in the response header is set to unavailable

      * `num_retries`: Specifies the allowed number retries. This number must be > 0. If not specified, defaults to 1.

      * `per_try_timeout`: Specifies a non-zero timeout per retry attempt.  If not specified, will use the timeout set in HttpRouteAction. If timeout in HttpRouteAction is not set, will use the largest timeout among all backend services associated with the route.

        * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

        * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

    * `request_mirror_policy`: Specifies the policy on how requests intended for the route's backends are shadowed to a separate mirrored backend service. Loadbalancer does not wait for responses from the shadow service. Prior to sending traffic to the shadow service, the host / authority header is suffixed with -shadow.

      * `backend_service`: The full or partial URL to the BackendService resource being mirrored to.

    * `cors_policy`: The specification for allowing client side cross-origin requests. Please see [W3C Recommendation for Cross Origin Resource Sharing](https://www.w3.org/TR/cors/)

      * `allow_origins`: Specifies the list of origins that will be allowed to do CORS requests. An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.

      * `allow_origin_regexes`: Specifies the regualar expression patterns that match allowed origins. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.

      * `allow_methods`: Specifies the content for the Access-Control-Allow-Methods header.

      * `allow_headers`: Specifies the content for the Access-Control-Allow-Headers header.

      * `expose_headers`: Specifies the content for the Access-Control-Expose-Headers header.

      * `max_age`: Specifies how long results of a preflight request can be cached in seconds. This translates to the Access-Control-Max-Age header.

      * `allow_credentials`: In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access-Control-Allow-Credentials header.

      * `disabled`: If true, specifies the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect.

    * `fault_injection_policy`: The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. As part of fault injection, when clients send requests to a backend service, delays can be introduced by Loadbalancer on a percentage of requests before sending those request to the backend service. Similarly requests from clients can be aborted by the Loadbalancer for a percentage of requests.  timeout and retryPolicy will be ignored by clients that are configured with a faultInjectionPolicy.

      * `delay`: The specification for how client requests are delayed as part of fault injection, before being sent to a backend service.

        * `fixed_delay`: Specifies the value of the fixed delay interval.

          * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

          * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

        * `percentage`: The percentage of traffic (connections/operations/requests) on which delay will be introduced as part of fault injection. The value must be between 0.0 and 100.0 inclusive.

      * `abort`: The specification for how client requests are aborted as part of fault injection.

        * `http_status`: The HTTP status code used to abort the request. The value must be between 200 and 599 inclusive.

        * `percentage`: The percentage of traffic (connections/operations/requests) which will be aborted as part of fault injection. The value must be between 0.0 and 100.0 inclusive.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
