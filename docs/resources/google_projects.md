---
title: About the google_projects Resource
platform: gcp
---

# google\_projects

Use the `google_projects` InSpec audit resource to test properties of all, or a filtered group of, GCP projects in a particular organisation.

<br>

## Syntax

A `google_projects` resource block collects GCP projects then tests that group.

    describe google_projects do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_project`.

    google_projects.project_names.each do |project_name|
      describe google_project(project: project_name) do
        it { should exist }
        its('lifecycle_state') { should eq "ACTIVE" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of projects available for the project

    describe google_projects do
      its('count') { should be <= 100}
    end

### Test that an expected named project is available

    describe google_projects do
      its('project_names'){ should include "gcp_project_id" }
    end

### Test that an expected project number is available

    describe google_projects do
      its('project_ids'){ should include "gcp_project_name" }
    end
    
### Test that an expected project id is available

    describe google_projects do
      its('project_numbers'){ should include 1122334455 }
    end    

### Test that a particular subset of projects with id 'prod*' are in ACTIVE lifecycle state

    google_projects.where(project_id: /^prod/).project_ids.each do |gcp_project_id|
      describe google_project(project: gcp_project_id) do
        it { should exist }
        its('lifecycle_state') { should eq "ACTIVE" }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `project_id`; `project_name` and `project_number`. Anyy of these may be used with `where`, as a block or as a method.

## Properties

*  `project_ids` - an array of google_compute_project identifier strings
*  `project_names` - an array of google_compute_project name strings
*  `project_numbers`- an array of google_compute_project number identifier integers

<br>


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.