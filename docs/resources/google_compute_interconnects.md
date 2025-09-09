+++
title = "google_compute_interconnects resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_interconnects"
identifier = "inspec/resources/gcp/google_compute_interconnects Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_interconnects` InSpec audit resource to to test a Google Cloud Interconnect resource.

## Examples

```ruby
describe google_compute_interconnects(project: 'chef-gcp-inspec') do
  it { should exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_interconnects` resource:

See [google_compute_interconnect](google_compute_interconnect) for more detailed information.

  * `admin_enableds`: an array of `google_compute_interconnect` admin_enabled
  * `creation_timestamps`: an array of `google_compute_interconnect` creation_timestamp
  * `descriptions`: an array of `google_compute_interconnect` description
  * `locations`: an array of `google_compute_interconnect` location
  * `ids`: an array of `google_compute_interconnect` id
  * `names`: an array of `google_compute_interconnect` name
  * `noc_contact_emails`: an array of `google_compute_interconnect` noc_contact_email
  * `peer_ip_addresses`: an array of `google_compute_interconnect` peer_ip_address
  * `google_ip_addresses`: an array of `google_compute_interconnect` google_ip_address
  * `client_operation_ids`: an array of `google_compute_interconnect` client_operation_id
  * `google_reference_ids`: an array of `google_compute_interconnect` google_reference_id
  * `provisioned_link_counts`: an array of `google_compute_interconnect` provisioned_link_count
  * `customer_names`: an array of `google_compute_interconnect` customer_name
  * `requested_link_counts`: an array of `google_compute_interconnect` requested_link_count
  * `operational_statuses`: an array of `google_compute_interconnect` operational_status
  * `link_types`: an array of `google_compute_interconnect` link_type
  * `interconnect_types`: an array of `google_compute_interconnect` interconnect_type
  * `interconnect_attachments`: an array of `google_compute_interconnect` interconnect_attachments
  * `expected_outages`: an array of `google_compute_interconnect` expected_outages
  * `circuit_infos`: an array of `google_compute_interconnect` circuit_infos
  * `satisfies_pzs`: an array of `google_compute_interconnect` satisfies_pzs

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
