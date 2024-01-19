---
title: About the google_dlp_job_triggers resource
platform: gcp
---

## Syntax
A `google_dlp_job_triggers` is used to test a Google JobTrigger resource

## Examples
```


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

See [google_dlp_job_trigger.md](google_dlp_job_trigger.md) for more detailed information
  * `names`: an array of `google_dlp_job_trigger` name
  * `descriptions`: an array of `google_dlp_job_trigger` description
  * `display_names`: an array of `google_dlp_job_trigger` display_name
  * `last_run_times`: an array of `google_dlp_job_trigger` last_run_time
  * `statuses`: an array of `google_dlp_job_trigger` status
  * `triggers`: an array of `google_dlp_job_trigger` triggers
  * `inspect_jobs`: an array of `google_dlp_job_trigger` inspect_job
  * `parents`: an array of `google_dlp_job_trigger` parent

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
