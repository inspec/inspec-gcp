---
title: About the google_vertex_ai_nas_jobs_nas_trial_details resource
platform: gcp
---

## Syntax
A `google_vertex_ai_nas_jobs_nas_trial_details` is used to test a Google NasJobsNasTrialDetail resource

## Examples
```
    describe google_vertex_ai_nas_jobs_nas_trial_details(parent: "projects/#{gcp_project_id}/locations/#{nas_jobs_nas_trial_detail['region']}/nasJobs/#{nas_jobs_nas_trial_detail['nasJob']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_nas_jobs_nas_trial_details` resource:

See [google_vertex_ai_nas_jobs_nas_trial_detail.md](google_vertex_ai_nas_jobs_nas_trial_detail.md) for more detailed information
  * `parameters`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` parameters
  * `names`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` name
  * `search_trials`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` search_trial
  * `train_trials`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` train_trial

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
