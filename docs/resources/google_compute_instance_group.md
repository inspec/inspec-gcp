---
title: About the google_compute_instance_group Resource
platform: gcp
---

# google\_compute\_instance\_group

Use the `google_compute_instance_group` InSpec audit resource to test properties of a single GCP compute instance group.

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

A `google_compute_instance_group` resource block declares the tests for a single GCP compute instance group by project, zone and name.

    describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
      it { should exist }
      its('size') { should eq 2 }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute instance group has the expected size

    describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
      its('size') { should eq 2 }
    end

### Test that a GCP compute instance group has a port with supplied name and value

    describe google_compute_instance_group(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'gcp-inspec-test') do
      its('port_name') { should eq "http" }
      its('port_value') { should eq 80 }
    end

<br>

## Properties

*  `creation_timestamp`, `description`, `fingerprint`, `id`, `kind`, `name`, `named_ports`, `network`, `size`, `subnetwork`, `zone`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.