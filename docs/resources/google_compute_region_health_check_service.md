---
title: About the google_compute_region_health_check_service resource
platform: gcp
---

## Syntax
A `google_compute_region_health_check_service` is used to test a Google RegionHealthCheckService resource

## Examples
```
describe google_compute_region_health_check_service(healthCheckService: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('region') { should cmp 'value_region' }
	its('health_status_aggregation_strategy') { should cmp 'value_healthstatusaggregationstrategy' }
	its('health_status_aggregation_policy') { should cmp 'value_healthstatusaggregationpolicy' }
	its('fingerprint') { should cmp 'value_fingerprint' }

end

describe google_compute_region_health_check_service(healthCheckService: ' ', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_region_health_check_service` resource:


  * `kind`: [Output only] Type of the resource. Always compute#healthCheckServicefor health check services.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL with id for the resource.

  * `name`: Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `region`: [Output Only] URL of the region where the health check service resides. This field is not applicable to global health check services. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.

  * `health_status_aggregation_strategy`: This field is deprecated. Use health_status_aggregation_policy instead. Policy for how the results from multiple health checks for the same endpoint are aggregated. - NO_AGGREGATION. An EndpointHealth message is returned for each backend in the health check service. - AND. If any backend's health check reports UNHEALTHY, then UNHEALTHY is the HealthState of the entire health check service. If all backend's are healthy, the HealthState of the health check service is HEALTHY. .
  Possible values:
    * AND
    * NO_AGGREGATION

  * `health_status_aggregation_policy`: Optional. Policy for how the results from multiple health checks for the same endpoint are aggregated. Defaults to NO_AGGREGATION if unspecified. - NO_AGGREGATION. An EndpointHealth message is returned for each pair in the health check service. - AND. If any health check of an endpoint reports UNHEALTHY, then UNHEALTHY is the HealthState of the endpoint. If all health checks report HEALTHY, the HealthState of the endpoint is HEALTHY. . This is only allowed with regional HealthCheckService.
  Possible values:
    * AND
    * NO_AGGREGATION

  * `health_checks`: A list of URLs to the HealthCheck resources. Must have at least one HealthCheck, and not more than 10 for regional HealthCheckService, and not more than 1 for global HealthCheckService. HealthCheck resources must have portSpecification=USE_SERVING_PORT or portSpecification=USE_FIXED_PORT. For regional HealthCheckService, the HealthCheck must be regional and in the same region. For global HealthCheckService, HealthCheck must be global. Mix of regional and global HealthChecks is not supported. Multiple regional HealthChecks must belong to the same region. Regional HealthChecks must belong to the same region as zones of NetworkEndpointGroups. For global HealthCheckService using global INTERNET_IP_PORT NetworkEndpointGroups, the global HealthChecks must specify sourceRegions, and HealthChecks that specify sourceRegions can only be used with global INTERNET_IP_PORT NetworkEndpointGroups.

  * `network_endpoint_groups`: A list of URLs to the NetworkEndpointGroup resources. Must not have more than 100. For regional HealthCheckService, NEGs must be in zones in the region of the HealthCheckService. For global HealthCheckServices, the NetworkEndpointGroups must be global INTERNET_IP_PORT.

  * `notification_endpoints`: A list of URLs to the NotificationEndpoint resources. Must not have more than 10. A list of endpoints for receiving notifications of change in health status. For regional HealthCheckService, NotificationEndpoint must be regional and in the same region. For global HealthCheckService, NotificationEndpoint must be global.

  * `fingerprint`: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking. This field will be ignored when inserting a HealthCheckService. An up-to-date fingerprint must be provided in order to patch/update the HealthCheckService; Otherwise, the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make a get() request to retrieve the HealthCheckService.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
