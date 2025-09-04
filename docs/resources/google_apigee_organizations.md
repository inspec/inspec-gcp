+++
title = "google_apigee_organizations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_apigee_organizations"
identifier = "inspec/resources/gcp/google_apigee_organizations Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_apigee_organizations` is used to test a Google Organization resource

## Examples
```
    describe google_apigee_organizations(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_apigee_organizations` resource:

See [google_apigee_organization.md](google_apigee_organization.md) for more detailed information
  * `api_consumer_data_encryption_key_names`: an array of `google_apigee_organization` api_consumer_data_encryption_key_name
  * `runtime_database_encryption_key_names`: an array of `google_apigee_organization` runtime_database_encryption_key_name
  * `environments`: an array of `google_apigee_organization` environments
  * `runtime_types`: an array of `google_apigee_organization` runtime_type
  * `types`: an array of `google_apigee_organization` type
  * `portal_disableds`: an array of `google_apigee_organization` portal_disabled
  * `authorized_networks`: an array of `google_apigee_organization` authorized_network
  * `project_ids`: an array of `google_apigee_organization` project_id
  * `descriptions`: an array of `google_apigee_organization` description
  * `ca_certificates`: an array of `google_apigee_organization` ca_certificate
  * `subscription_types`: an array of `google_apigee_organization` subscription_type
  * `addons_configs`: an array of `google_apigee_organization` addons_config
  * `customer_names`: an array of `google_apigee_organization` customer_name
  * `created_ats`: an array of `google_apigee_organization` created_at
  * `last_modified_ats`: an array of `google_apigee_organization` last_modified_at
  * `subscription_plans`: an array of `google_apigee_organization` subscription_plan
  * `properties`: an array of `google_apigee_organization` properties
  * `states`: an array of `google_apigee_organization` state
  * `names`: an array of `google_apigee_organization` name
  * `disable_vpc_peerings`: an array of `google_apigee_organization` disable_vpc_peering
  * `control_plane_encryption_key_names`: an array of `google_apigee_organization` control_plane_encryption_key_name
  * `analytics_regions`: an array of `google_apigee_organization` analytics_region
  * `api_consumer_data_locations`: an array of `google_apigee_organization` api_consumer_data_location
  * `display_names`: an array of `google_apigee_organization` display_name
  * `apigee_project_ids`: an array of `google_apigee_organization` apigee_project_id
  * `expires_ats`: an array of `google_apigee_organization` expires_at
  * `attributes`: an array of `google_apigee_organization` attributes
  * `billing_types`: an array of `google_apigee_organization` billing_type

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
