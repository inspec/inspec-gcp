+++

title = "google_run_project_location_services Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_run_project_location_services"
identifier = "inspec/resources/gcp/google_run_project_location_services Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_run_project_location_services` InSpec audit resource to test the properties of a test a Google ProjectLocationService.

## Installation
{{% inspec_gcp_install %}}

## Syntax
A `google_run_project_location_services` is used to test a Google ProjectLocationService resource

## Examples
```
    describe google_run_project_location_services(parent: ' value_parent') do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_run_project_location_services` resource:

See [google_run_project_location_service.md](google_run_project_location_service.md) for more detailed information
* `api_versions`: an array of `google_run_project_location_service` api_version
* `kinds`: an array of `google_run_project_location_service` kind
* `metadata`: an array of `google_run_project_location_service` metadata
* `specs`: an array of `google_run_project_location_service` spec
* `statuses`: an array of `google_run_project_location_service` status
## Properties
Properties that can be accessed from the `google_run_project_location_services` resource:

See [google_run_project_location_service.md](google_run_project_location_service.md) for more detailed information
* `api_versions`: an array of `google_run_project_location_service` api_version
* `kinds`: an array of `google_run_project_location_service` kind
* `metadata`: an array of `google_run_project_location_service` metadata
* `specs`: an array of `google_run_project_location_service` spec
* `statuses`: an array of `google_run_project_location_service` status

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://run.googleapis.com/](https://console.cloud.google.com/apis/library/run.googleapis.com/) is enabled for the current project.
