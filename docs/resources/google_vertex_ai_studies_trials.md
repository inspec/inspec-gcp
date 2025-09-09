+++
title = "google_vertex_ai_studies_trials resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_studies_trials"
identifier = "inspec/resources/gcp/google_vertex_ai_studies_trials Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_studies_trials` InSpec audit resource to to test a Google Cloud StudiesTrial resource.

## Examples

```ruby
    describe google_vertex_ai_studies_trials(parent: "projects/#{gcp_project_id}/locations/#{studies_trial['region']}/studies/#{studies_trial['study']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_studies_trials` resource:

See [google_vertex_ai_studies_trial](google_vertex_ai_studies_trial) for more detailed information.

  * `measurements`: an array of `google_vertex_ai_studies_trial` measurements
  * `start_times`: an array of `google_vertex_ai_studies_trial` start_time
  * `end_times`: an array of `google_vertex_ai_studies_trial` end_time
  * `parameters`: an array of `google_vertex_ai_studies_trial` parameters
  * `names`: an array of `google_vertex_ai_studies_trial` name
  * `infeasible_reasons`: an array of `google_vertex_ai_studies_trial` infeasible_reason
  * `final_measurements`: an array of `google_vertex_ai_studies_trial` final_measurement
  * `client_ids`: an array of `google_vertex_ai_studies_trial` client_id
  * `custom_jobs`: an array of `google_vertex_ai_studies_trial` custom_job
  * `states`: an array of `google_vertex_ai_studies_trial` state
  * `web_access_uris`: an array of `google_vertex_ai_studies_trial` web_access_uris
  * `ids`: an array of `google_vertex_ai_studies_trial` id

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
