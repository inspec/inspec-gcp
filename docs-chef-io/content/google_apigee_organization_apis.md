+++
title = "google_apigee_organization_apis resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_apigee_organization_apis"
identifier = "inspec/resources/gcp/google_apigee_organization_apis resource"
parent = "inspec/resources/gcp"
+++

Use the `google_apigee_organization_apis` InSpec audit resource to to test a Google Cloud OrganizationApi resource.

## Examples

```ruby
    describe google_apigee_organization_apis(parent: ' value_parent') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_apigee_organization_apis` resource:

See [google_apigee_organization_api](google_apigee_organization_api) for more detailed information.

  * `revisions`: an array of `google_apigee_organization_api` revision
  * `latest_revision_ids`: an array of `google_apigee_organization_api` latest_revision_id
  * `meta_data`: an array of `google_apigee_organization_api` meta_data
  * `api_proxy_types`: an array of `google_apigee_organization_api` api_proxy_type
  * `read_onlies`: an array of `google_apigee_organization_api` read_only
  * `labels`: an array of `google_apigee_organization_api` labels
  * `names`: an array of `google_apigee_organization_api` name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
