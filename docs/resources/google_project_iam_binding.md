---
title: About the google_project_iam_binding Resource
platform: gcp
---

# google\_project\_iam\_binding

Use the `google_project_iam_binding` InSpec audit resource to test properties of a single GCP project IAM binding.

<br>

## Availability

### Installation

This resource is available in the `inspec-gcp` [resource pack](https://www.inspec.io/docs/reference/glossary/#resource-pack).  To use it, add the following to your `inspec.yml` in your top-level profile:

    depends:
      inspec-gcp:
        git: https://github.com/inspec/inspec-gcp.git

You'll also need to setup your GCP credentials; see the resource pack [README](https://github.com/inspec/inspec-gcp#prerequisites).

## Syntax

A `google_project_iam_binding` resource block declares the tests for a single GCP project IAM binding by role.

    describe google_project_iam_binding(project: 'chef-inspec-gcp',  role: 'roles/compute.admin') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project iam_binding exists

    describe google_project_iam_binding(project: 'chef-inspec-gcp',  role: 'roles/compute.admin') do
      it { should exist }
    end

### Test that a GCP project IAM binding role has the desired user included

    describe google_project_iam_binding(project: 'chef-inspec-gcp',  role: 'roles/compute.admin') do
      its('members') {should include 'user:someuser@domain.com' }
    end

<br>

## Properties

*  `members`

<br>


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.