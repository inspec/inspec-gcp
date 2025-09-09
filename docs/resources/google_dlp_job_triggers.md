+++
title = "google_dlp_job_triggers resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_job_triggers"
identifier = "inspec/resources/gcp/google_dlp_job_triggers Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_job_triggers` InSpec audit resource to to test a Google Cloud JobTrigger resource.

## Examples

```ruby


describe google_dlp_job_triggers(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}") do
it { should exist }
its('names') { should include 'name1' }
its('display_name') { should include 'dp' }
its('descriptions') { should include 'description' }
its('status') { should include 'HEALTHY' }
end

```

## Properties

Properties that can be accessed from the `google_dlp_job_triggers` resource:

See [google_dlp_job_trigger](google_dlp_job_trigger) for more detailed information.

  * `names`: an array of `google_dlp_job_trigger` name
  * `descriptions`: an array of `google_dlp_job_trigger` description
  * `display_names`: an array of `google_dlp_job_trigger` display_name
  * `last_run_times`: an array of `google_dlp_job_trigger` last_run_time
  * `statuses`: an array of `google_dlp_job_trigger` status
  * `triggers`: an array of `google_dlp_job_trigger` triggers
  * `inspect_jobs`: an array of `google_dlp_job_trigger` inspect_job
  * `parents`: an array of `google_dlp_job_trigger` parent

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
