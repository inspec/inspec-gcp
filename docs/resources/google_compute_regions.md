---
title: About the google_compute_regions resource
platform: gcp
---

## Syntax
A `google_compute_regions` is used to test a Google Region resource

## Examples
```
describe google_compute_regions(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
  its('region_names') { should include "#{gcp_location}" }
  its('region_statuses') { should_not include "DOWN" }
  its('region_ids') { should include gcp_region_id }
end

```
  ### Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_region`
```
  google_compute_regions(project: 'chef-inspec-gcp').region_names.each do |region_name|
    describe google_compute_region(project: 'chef-inspec-gcp',  region: region_name) do
      it { should be_up }
    end
  end
```

  ### Test that there are more than a specified number of regions available for the project
```
  describe google_compute_regions(project: 'chef-inspec-gcp') do
    its('count') { should be >= 10}
  end
```
  ### Test that an expected region is available for the project
```
  describe google_compute_regions(project: 'chef-inspec-gcp') do
    its('region_names') { should include 'europe-west2' }
  end
```
  ### Test whether any regions are in status "DOWN"
```
  describe google_compute_regions(project: 'chef-inspec-gcp') do
    its('region_statuses') { should_not include "DOWN" }
  end
```

  ### Test that a subset of all regions matching "europe*" are "UP"
```
  google_compute_regions(project: gcp_project_id).where(region_name: /^europe/).region_names.each do |region_name|
    describe google_compute_region(project: 'chef-inspec-gcp',  region: region_name) do
      it { should be_up }
    end
  end

```

## Properties
Properties that can be accessed from the `google_compute_regions` resource:

See [google_compute_region.md](google_compute_region.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_region` creation_timestamp
  * `deprecateds`: an array of `google_compute_region` deprecated
  * `descriptions`: an array of `google_compute_region` description
  * `region_ids`: an array of `google_compute_region` id
  * `region_names`: an array of `google_compute_region` name
  * `quotas`: an array of `google_compute_region` quotas
  * `region_statuses`: an array of `google_compute_region` status
  * `zones`: an array of `google_compute_region` zones

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
