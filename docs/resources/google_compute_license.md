---
title: About the google_compute_license resource
platform: gcp
---

## Syntax
A `google_compute_license` is used to test a Google License resource

## Examples
```
describe google_compute_v1_license(name: ' value_name', project: 'chef-gcp-inspec') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('name') { should cmp 'value_name' }
	its('id') { should cmp 'value_id' }
	its('license_code') { should cmp 'value_licensecode' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('description') { should cmp 'value_description' }
	its('self_link') { should cmp 'value_selflink' }

end

describe google_compute_v1_license(name: "does_not_exit", project: 'chef-gcp-inspec') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_license` resource:


  * `name`: Name of the resource. The name is 1-63 characters long and complies with RFC1035.

  * `charges_use_fee`: If true, the customer will be charged license fee for running software that contains this license on an instance.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
