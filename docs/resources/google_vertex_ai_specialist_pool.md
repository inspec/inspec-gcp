---
title: About the google_vertex_ai_specialist_pool resource
platform: gcp
---

## Syntax
A `google_vertex_ai_specialist_pool` is used to test a Google SpecialistPool resource

## Examples
```
describe google_vertex_ai_specialist_pool(name: "projects/#{gcp_project_id}/locations/#{specialist_pool['region']}/specialistPools/#{specialist_pool['name']}", region: ' value_region') do
	it { should exist }
	its('display_name') { should cmp 'value_displayname' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_specialist_pool(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_specialist_pool` resource:


  * `display_name`: Required. The user-defined name of the SpecialistPool. The name can be up to 128 characters long and can consist of any UTF-8 characters. This field should be unique on project-level.

  * `specialist_manager_emails`: The email addresses of the managers in the SpecialistPool.

  * `specialist_managers_count`: Output only. The number of managers in this SpecialistPool.

  * `name`: Required. The resource name of the SpecialistPool.

  * `specialist_worker_emails`: The email addresses of workers in the SpecialistPool.

  * `pending_data_labeling_jobs`: Output only. The resource name of the pending data labeling jobs.


## GCP Permissions
