+++
title = "google_compute_interconnect_location resource"

draft = false


[menu.gcp]
title = "google_compute_interconnect_location"
identifier = "inspec/resources/gcp/google_compute_interconnect_location resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_interconnect_location` InSpec audit resource to to test a Google Cloud InterconnectLocation resource.

## Examples

```ruby
describe google_compute_interconnect_location(project: 'chef-gcp-inspec', name: 'akl-zone1-1353') do
  it { should exist }
  its('facility_provider_facility_id') { should eq 'Auckland - Albany' }
  its('facility_provider') { should eq 'Vocus' }
end

describe google_compute_interconnect_location(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_interconnect_location` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `availability_zone`: Availability zone for this InterconnectLocation. Within a metropolitan area (metro), maintenance will not be simultaneously scheduled in more than one availability zone. Example: "zone1" or "zone2".

  * `client_operation_id`: The value of requestId if you provided it in the request. Not present otherwise.

  * `facility_provider`: The name of the provider for this facility (e.g., EQUINIX).

  * `facility_provider_facility_id`: A provider-assigned Identifier for this facility (e.g., Ashburn-DC1).

  * `status`: The status of this InterconnectLocation, which can take one of the following values: * CLOSED: The InterconnectLocation is closed and is unavailable for provisioning new Interconnects. * AVAILABLE: The InterconnectLocation is available for provisioning new Interconnects.
  Possible values:
    * CLOSED
    * AVAILABLE


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
