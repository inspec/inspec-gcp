---
title: About the google_apigee_organization_apis resource
platform: gcp
---

## Syntax
A `google_apigee_organization_apis` is used to test a Google OrganizationApi resource

## Examples
```
    describe google_apigee_organization_apis(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_apigee_organization_apis` resource:

See [google_apigee_organization_api.md](google_apigee_organization_api.md) for more detailed information
  * `revisions`: an array of `google_apigee_organization_api` revision
  * `latest_revision_ids`: an array of `google_apigee_organization_api` latest_revision_id
  * `meta_data`: an array of `google_apigee_organization_api` meta_data
  * `api_proxy_types`: an array of `google_apigee_organization_api` api_proxy_type
  * `read_onlies`: an array of `google_apigee_organization_api` read_only
  * `labels`: an array of `google_apigee_organization_api` labels
  * `names`: an array of `google_apigee_organization_api` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
