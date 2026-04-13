---
title: About the google_cloudkms_project_location_key_ring resource
platform: gcp
---

## Syntax
A `google_cloudkms_project_location_key_ring` is used to test a Google ProjectLocationKeyRing resource

## Examples
```
describe google_cloudkms_project_location_key_ring(name: ' value_name') do
	it { should exist }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }

end

describe google_cloudkms_project_location_key_ring(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_cloudkms_project_location_key_ring` resource:


  * `name`: Output only. The resource name for the KeyRing in the format `projects/*/locations/*/keyRings/*`.

  * `create_time`: Output only. The time at which this KeyRing was created.


## GCP Permissions

Ensure the [https://cloudkms.googleapis.com/](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
