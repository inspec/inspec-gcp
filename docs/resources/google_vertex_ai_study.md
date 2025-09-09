+++
title = "google_vertex_ai_study resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_study"
identifier = "inspec/resources/gcp/google_vertex_ai_study Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_study` InSpec audit resource to to test a Google Cloud Study resource.

## Examples

```ruby
describe google_vertex_ai_study(name: "projects/#{gcp_project_id}/locations/#{study['region']}/studies/#{study['name']}", region: ' value_region') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('display_name') { should cmp 'value_displayname' }
	its('state') { should cmp 'value_state' }
	its('create_time') { should cmp 'value_createtime' }
	its('inactive_reason') { should cmp 'value_inactivereason' }

end

describe google_vertex_ai_study(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_study` resource:


  * `study_spec`: Required. Configuration of the Study.

  * `name`: Output only. The name of a study. The study's globally unique identifier. Format: `projects/{project}/locations/{location}/studies/{study}`

  * `display_name`: Required. Describes the Study, default value is empty string.

  * `state`: Output only. The detailed state of a Study.
  Possible values:
    * STATE_UNSPECIFIED
    * ACTIVE
    * INACTIVE
    * COMPLETED

  * `create_time`: Output only. Time at which the study was created.

  * `inactive_reason`: Output only. A human readable reason why the Study is inactive. This should be empty if a study is ACTIVE or COMPLETED.


## GCP permissions
