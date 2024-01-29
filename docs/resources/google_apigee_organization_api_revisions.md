---
title: About the google_apigee_organization_api_revisions resource
platform: gcp
---

## Syntax
A `google_apigee_organization_api_revisions` is used to test a Google OrganizationApiRevision resource

## Examples
```
    describe google_apigee_organization_api_revisions() do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_apigee_organization_api_revisions` resource:

See [google_apigee_organization_api_revision.md](google_apigee_organization_api_revision.md) for more detailed information
  * `extensions`: an array of `google_apigee_organization_api_revision` extensions
  * `content_types`: an array of `google_apigee_organization_api_revision` content_type
  * `data`: an array of `google_apigee_organization_api_revision` data

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Apigee API](https://console.cloud.google.com/apis/library/apigee.googleapis.com/) is enabled for the current project.
