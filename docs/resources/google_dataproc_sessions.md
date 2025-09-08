+++

title = "google_dataproc_sessions Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_dataproc_sessions"
identifier = "inspec/resources/gcp/google_dataproc_sessions Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_sessions` InSpec audit resource to test the properties of a test a Google Session.

## Syntax
A `google_dataproc_sessions` is used to test a Google Session resource

## Examples
```
    describe google_dataproc_sessions(parent: ' value_parent') do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_dataproc_sessions` resource:

See [google_dataproc_session.md](google_dataproc_session.md) for more detailed information
* `names`: an array of `google_dataproc_session` name
* `uuids`: an array of `google_dataproc_session` uuid
* `create_times`: an array of `google_dataproc_session` create_time
* `jupyter_sessions`: an array of `google_dataproc_session` jupyter_session
* `runtime_infos`: an array of `google_dataproc_session` runtime_info
* `states`: an array of `google_dataproc_session` state
* `state_messages`: an array of `google_dataproc_session` state_message
* `state_times`: an array of `google_dataproc_session` state_time
* `creators`: an array of `google_dataproc_session` creator
* `labels`: an array of `google_dataproc_session` labels
* `runtime_configs`: an array of `google_dataproc_session` runtime_config
* `environment_configs`: an array of `google_dataproc_session` environment_config
* `users`: an array of `google_dataproc_session` user
* `state_histories`: an array of `google_dataproc_session` state_history
* `session_templates`: an array of `google_dataproc_session` session_template
## Properties
Properties that can be accessed from the `google_dataproc_sessions` resource:

See [google_dataproc_session.md](google_dataproc_session.md) for more detailed information
* `names`: an array of `google_dataproc_session` name
* `uuids`: an array of `google_dataproc_session` uuid
* `create_times`: an array of `google_dataproc_session` create_time
* `jupyter_sessions`: an array of `google_dataproc_session` jupyter_session
* `runtime_infos`: an array of `google_dataproc_session` runtime_info
* `states`: an array of `google_dataproc_session` state
* `state_messages`: an array of `google_dataproc_session` state_message
* `state_times`: an array of `google_dataproc_session` state_time
* `creators`: an array of `google_dataproc_session` creator
* `labels`: an array of `google_dataproc_session` labels
* `runtime_configs`: an array of `google_dataproc_session` runtime_config
* `environment_configs`: an array of `google_dataproc_session` environment_config
* `users`: an array of `google_dataproc_session` user
* `state_histories`: an array of `google_dataproc_session` state_history
* `session_templates`: an array of `google_dataproc_session` session_template

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
