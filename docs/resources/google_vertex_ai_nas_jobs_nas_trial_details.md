+++
title = "google_vertex_ai_nas_jobs_nas_trial_details resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_nas_jobs_nas_trial_details"
identifier = "inspec/resources/gcp/google_vertex_ai_nas_jobs_nas_trial_details Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_nas_jobs_nas_trial_details` InSpec audit resource to to test a Google Cloud NasJobsNasTrialDetail resource.

## Examples

```ruby
    describe google_vertex_ai_nas_jobs_nas_trial_details(parent: "projects/#{gcp_project_id}/locations/#{nas_jobs_nas_trial_detail['region']}/nasJobs/#{nas_jobs_nas_trial_detail['nasJob']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_nas_jobs_nas_trial_details` resource:

See [google_vertex_ai_nas_jobs_nas_trial_detail](google_vertex_ai_nas_jobs_nas_trial_detail) for more detailed information.

  * `parameters`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` parameters
  * `names`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` name
  * `search_trials`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` search_trial
  * `train_trials`: an array of `google_vertex_ai_nas_jobs_nas_trial_detail` train_trial

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
