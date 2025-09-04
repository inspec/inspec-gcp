+++
title = "google_compute_security_policies resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_security_policies"
identifier = "inspec/resources/gcp/google_compute_security_policies Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_security_policies` is used to test a Google SecurityPolicy resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_compute_security_policies(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('names') { should include 'sec-policy' }
end
```

## Properties
Properties that can be accessed from the `google_compute_security_policies` resource:

See [google_compute_security_policy.md](google_compute_security_policy.md) for more detailed information
  * `names`: an array of `google_compute_security_policy` name
  * `ids`: an array of `google_compute_security_policy` id
  * `rules`: an array of `google_compute_security_policy` rules

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
