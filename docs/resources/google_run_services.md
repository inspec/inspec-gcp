+++

title = "google_run_services Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_run_services"
identifier = "inspec/resources/gcp/google_run_services Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_run_services` InSpec audit resource to test the properties of a test a Google Service.

## Syntax
A `google_run_services` is used to test a Google Service resource

## Examples
```
  describe google_run_services(parent: 'value_parent') do
    it { should exist }
    its('names') { should include value_name }
    its('uris') { should include value_uri }
    its('generations') { should include value_generation }
    its('create_times') { should include value_create_time }
    its('update_times') { should include value_update_time }
    its('creators') { should include value_creator }
    its('ingresses') { should include value_ingress }
  end
```

## Parameters
Properties that can be accessed from the `google_run_services` resource:

See [google_run_service.md](google_run_service.md) for more detailed information
* `names`: an array of `google_run_service` name
* `descriptions`: an array of `google_run_service` description
* `uids`: an array of `google_run_service` uid
* `generations`: an array of `google_run_service` generation
* `labels`: an array of `google_run_service` labels
* `annotations`: an array of `google_run_service` annotations
* `create_times`: an array of `google_run_service` create_time
* `update_times`: an array of `google_run_service` update_time
* `delete_times`: an array of `google_run_service` delete_time
* `expire_times`: an array of `google_run_service` expire_time
* `creators`: an array of `google_run_service` creator
* `last_modifiers`: an array of `google_run_service` last_modifier
* `clients`: an array of `google_run_service` client
* `client_versions`: an array of `google_run_service` client_version
* `ingresses`: an array of `google_run_service` ingress
* `launch_stages`: an array of `google_run_service` launch_stage
* `binary_authorizations`: an array of `google_run_service` binary_authorization
* `templates`: an array of `google_run_service` template
* `traffics`: an array of `google_run_service` traffic
* `scalings`: an array of `google_run_service` scaling
* `default_uri_disableds`: an array of `google_run_service` default_uri_disabled
* `custom_audiences`: an array of `google_run_service` custom_audiences
* `observed_generations`: an array of `google_run_service` observed_generation
* `terminal_conditions`: an array of `google_run_service` terminal_condition
* `conditions`: an array of `google_run_service` conditions
* `latest_ready_revisions`: an array of `google_run_service` latest_ready_revision
* `latest_created_revisions`: an array of `google_run_service` latest_created_revision
* `traffic_statuses`: an array of `google_run_service` traffic_statuses
* `uris`: an array of `google_run_service` uri
* `satisfies_pzs`: an array of `google_run_service` satisfies_pzs
* `reconcilings`: an array of `google_run_service` reconciling
* `etags`: an array of `google_run_service` etag
## Properties
Properties that can be accessed from the `google_run_services` resource:

See [google_run_service.md](google_run_service.md) for more detailed information
* `names`: an array of `google_run_service` name
* `descriptions`: an array of `google_run_service` description
* `uids`: an array of `google_run_service` uid
* `generations`: an array of `google_run_service` generation
* `labels`: an array of `google_run_service` labels
* `annotations`: an array of `google_run_service` annotations
* `create_times`: an array of `google_run_service` create_time
* `update_times`: an array of `google_run_service` update_time
* `delete_times`: an array of `google_run_service` delete_time
* `expire_times`: an array of `google_run_service` expire_time
* `creators`: an array of `google_run_service` creator
* `last_modifiers`: an array of `google_run_service` last_modifier
* `clients`: an array of `google_run_service` client
* `client_versions`: an array of `google_run_service` client_version
* `ingresses`: an array of `google_run_service` ingress
* `launch_stages`: an array of `google_run_service` launch_stage
* `binary_authorizations`: an array of `google_run_service` binary_authorization
* `templates`: an array of `google_run_service` template
* `traffics`: an array of `google_run_service` traffic
* `scalings`: an array of `google_run_service` scaling
* `default_uri_disableds`: an array of `google_run_service` default_uri_disabled
* `custom_audiences`: an array of `google_run_service` custom_audiences
* `observed_generations`: an array of `google_run_service` observed_generation
* `terminal_conditions`: an array of `google_run_service` terminal_condition
* `conditions`: an array of `google_run_service` conditions
* `latest_ready_revisions`: an array of `google_run_service` latest_ready_revision
* `latest_created_revisions`: an array of `google_run_service` latest_created_revision
* `traffic_statuses`: an array of `google_run_service` traffic_statuses
* `uris`: an array of `google_run_service` uri
* `satisfies_pzs`: an array of `google_run_service` satisfies_pzs
* `reconcilings`: an array of `google_run_service` reconciling
* `etags`: an array of `google_run_service` etag

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [https://run.googleapis.com/](https://console.cloud.google.com/apis/library/run.googleapis.com/) is enabled for the current project.
