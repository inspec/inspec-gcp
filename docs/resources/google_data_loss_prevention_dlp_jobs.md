---
title: About the google_data_loss_prevention_dlp_jobs resource
platform: gcp
---

## Syntax
A `google_data_loss_prevention_dlp_jobs` is used to test a Google DlpJob resource

## Examples
```
describe google_data_loss_prevention_dlp_jobs(project: 'chef-gcp-inspec') do
  it { should exist }
end
```

## Properties
Properties that can be accessed from the `google_data_loss_prevention_dlp_jobs` resource:

See [google_data_loss_prevention_dlp_job.md](google_data_loss_prevention_dlp_job.md) for more detailed information
  * `names`: an array of `google_data_loss_prevention_dlp_job` name
  * `types`: an array of `google_data_loss_prevention_dlp_job` type
  * `states`: an array of `google_data_loss_prevention_dlp_job` state
  * `create_times`: an array of `google_data_loss_prevention_dlp_job` create_time
  * `start_times`: an array of `google_data_loss_prevention_dlp_job` start_time
  * `end_times`: an array of `google_data_loss_prevention_dlp_job` end_time
  * `job_trigger_names`: an array of `google_data_loss_prevention_dlp_job` job_trigger_name
  * `errors`: an array of `google_data_loss_prevention_dlp_job` errors
  * `action_details`: an array of `google_data_loss_prevention_dlp_job` action_details
  * `risk_details`: an array of `google_data_loss_prevention_dlp_job` risk_details
  * `inspect_details`: an array of `google_data_loss_prevention_dlp_job` inspect_details
  * `parents`: an array of `google_data_loss_prevention_dlp_job` parent

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
