---
title: About the google_compute_region_notification_endpoint resource
platform: gcp
---

## Syntax
A `google_compute_region_notification_endpoint` is used to test a Google RegionNotificationEndpoint resource

## Examples
```
      describe google_compute_region_notification_endpoint(project: 'chef-gcp-inspec', region: ' value_region', name: ' ') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_compute_region_notification_endpoint` resource:


  * `kind`: Type of the resource. Always compute#notificationEndpoint for notification endpoints. 

  * `id`: string (uint64 format) A unique identifier for this resource type. The server generates this identifier. 

  * `creation_timestamp`: Creation timestamp in RFC3339 text format. 

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. 

  * `description`: An optional description of this resource. Provide this property when you create the resource. 

  * `self_link`: Server-defined URL for the resource. 

  * `region`: URL of the region where the notification endpoint resides. This field applies only to the regional resource. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body. 

  * `grpc_settings`: object Settings of the gRPC notification endpoint including the endpoint URL and the retry duration. 

    * `endpoint`: Endpoint to which gRPC notifications are sent. This must be a valid gRPCLB DNS name. 

    * `retry_duration_sec`: integer (uint32 format) How much time (in seconds) is spent attempting notification retries until a successful response is received. Default is 30s. Limit is 20m (1200s). Must be a positive number. 

    * `payload_name`: Optional. If specified, this field is used to populate the "name" field in gRPC requests. 

    * `authority`: Optional. If specified, this field is used to set the authority header by the sender of notifications. See https://tools.ietf.org/html/rfc7540#section-8.1.2.3 

    * `resend_interval`: object Optional. This field is used to configure how often to send a full update of all non-healthy backends. If unspecified, full updates are not sent. If specified, must be in the range between 600 seconds to 3600 seconds. Nanos are disallowed. Can only be set for regional notification endpoints. 

      * `seconds`: string (int64 format) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years 

      * `nanos`: integer Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. 


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
