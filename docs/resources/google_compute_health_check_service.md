---
title: About the google_compute_health_check_service resource
platform: gcp
---

## Syntax
A `google_compute_health_check_service` is used to test a Google HealthCheckService resource

## Examples
```
describe google_compute_health_check_service(project: 'chef-gcp-inspec', region: 'us-central1', name: 'instance-group-2') do
it { should exist }
its('name') { should eq 'instance-group-2' }
its('health_status_aggregation_policy') { should eq 'NO_AGGREGATION' }
end

describe google_compute_health_check_service(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_health_check_service` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `health_status_aggregation_policy`: Optional. Policy for how the results from multiple health checks for the same endpoint are aggregated. Defaults to NO_AGGREGATION if unspecified. NO_AGGREGATION. An EndpointHealth message is returned for each <endpoint, health check> pair in the health check service. AND. If any health check of an endpoint reports UNHEALTHY, then UNHEALTHY is the HealthState of the endpoint. If all health checks report HEALTHY, the HealthState of the endpoint is HEALTHY.
  Possible values:
    * HEALTHY
    * UNHEALTHY

  * `health_checks`: A list of URLs to the HealthCheck resources. Must have at least one HealthCheck, and not more than 10. HealthCheck resources must have portSpecification=USE_SERVING_PORT or portSpecification=USE_FIXED_PORT. For regional HealthCheckService, the HealthCheck must be regional and in the same region. For global HealthCheckService, HealthCheck must be global. Mix of regional and global HealthChecks is not supported. Multiple regional HealthChecks must belong to the same region. Regional HealthChecks must belong to the same region as zones of NEGs.

  * `network_endpoint_groups`: A list of URLs to the NetworkEndpointGroup resources. Must not have more than 100. For regional HealthCheckService, NEGs must be in zones in the region of the HealthCheckService.

  * `notification_endpoints`: A list of URLs to the NotificationEndpoint resources. Must not have more than 10. A list of endpoints for receiving notifications of change in health status. For regional HealthCheckService, NotificationEndpoint must be regional and in the same region. For global HealthCheckService, NotificationEndpoint must be global.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a HealthCheckService. An up-to-date fingerprint must be provided in order to patch/update the HealthCheckService; Otherwise, the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve the HealthCheckService. A base64-encoded string.

  * `next_page_token`: This token allows you to get the next page of results for list requests. If the number of results is larger than maxResults, use the nextPageToken as a value for the query parameter pageToken in the next list request. Subsequent list requests will have their own nextPageToken to continue paging through the results.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
