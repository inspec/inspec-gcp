---
title: About the google_compute_firewall Resource
platform: gcp
---

# google\_compute\_firewall

Use the `google_compute_firewall` InSpec audit resource to test properties of a single GCP compute compute firewall.

<br>

## Syntax

A `google_compute_firewall` resource block declares the tests for a single GCP compute firewall by project and name.

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      it { should exist }
      its('name') { should eq 'firewall-rule' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP compute firewall allows SSH access on port 22

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('allowed_ssh?')  { should be true }
    end

### Test that a GCP compute firewall does not allow HTTP access on port 80

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('allowed_http?')  { should be false }
    end

### Test that a GCP compute firewall allows HTTPS access on port 443

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('allowed_https?')  { should be true }
    end

### Test the direction of a GCP compute firewall e.g. "INGRESS" or "EGRESS"

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('direction') { should eq "INGRESS" }
    end

### Test the source IP range list for the GCP compute firewall is not open to the world

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('source_ranges') { should_not eq ["0.0.0.0/0"] }
    end

<br>

## Properties

*  `allowed`, `creation_timestamp`, `description`, `direction`, `id`, `kind`, `name`, `network`, `priority`, `source_ranges`, `target_tags`

<br>


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the project where the resource is located.