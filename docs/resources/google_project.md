---
title: About the google_project Resource
platform: gcp
---

# google\_project

Use the `google_project` InSpec audit resource to test properties of a GCP project.

<br>

## Availability

### Installation

This resource is available in the `inspec-gcp` [resource pack](https://www.inspec.io/docs/reference/glossary/#resource-pack).  To use it, add the following to your `inspec.yml` in your top-level profile:

    depends:
      inspec-gcp:
        git: https://github.com/inspec/inspec-gcp.git

You'll also need to setup your GCP credentials; see the resource pack [README](https://github.com/inspec/inspec-gcp#prerequisites).

### Version

This resource first became available in v0.3.0 of the inspec-gcp resource pack.

## Syntax

A `google_project` resource block declares the tests for a single GCP project by name.

    describe google_project(project: 'chef-inspec-gcp') do
      it { should exist }
      its('name') { should eq 'chef-inspec-gcp'  }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project has the expected project number

    describe google_project(project: 'chef-inspec-gcp') do
      its('project_number') { should eq 12345678 }
    end

### Test that a GCP project has the expected lifecycle state e.g. "ACTIVE"

    describe google_project(project: 'chef-inspec-gcp') do
      its('lifecycle_state') { should eq "ACTIVE" }
    end

<br>

## Properties

*  `create_time`, `lifecycle_state`, `name`, `parent`, `project_id`, `project_number`

<br>


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.