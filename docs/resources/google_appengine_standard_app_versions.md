+++
title = "google_appengine_standard_app_versions resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_appengine_standard_app_versions"
identifier = "inspec/resources/gcp/google_appengine_standard_app_versions Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_appengine_standard_app_versions` InSpec audit resource to to test a Google Cloud StandardAppVersion resource.

## Examples

```ruby
describe google_appengine_standard_app_versions(project: 'chef-gcp-inspec', location: 'europe-west2',service: 'default') do
  its('runtimes') { should include 'nodejs10' }
end
```

## Properties

Properties that can be accessed from the `google_appengine_standard_app_versions` resource:

See [google_appengine_standard_app_version](google_appengine_standard_app_version) for more detailed information.

  * `names`: an array of `google_appengine_standard_app_version` name
  * `version_ids`: an array of `google_appengine_standard_app_version` version_id
  * `runtimes`: an array of `google_appengine_standard_app_version` runtime
  * `threadsaves`: an array of `google_appengine_standard_app_version` threadsafe
  * `vpc_access_connectors`: an array of `google_appengine_standard_app_version` vpc_access_connector
  * `inbound_services`: an array of `google_appengine_standard_app_version` inbound_services
  * `instance_classes`: an array of `google_appengine_standard_app_version` instance_class
  * `automatic_scalings`: an array of `google_appengine_standard_app_version` automatic_scaling
  * `basic_scalings`: an array of `google_appengine_standard_app_version` basic_scaling
  * `manual_scalings`: an array of `google_appengine_standard_app_version` manual_scaling

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
