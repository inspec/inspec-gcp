+++
title = "google_compute_region_health_checks resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_region_health_checks"
identifier = "inspec/resources/gcp/google_compute_region_health_checks Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_region_health_checks` is used to test a Google RegionHealthCheck resource

## Examples
```

describe google_compute_region_health_checks(project: 'chef-gcp-inspec', region: '') do
  its('types') { should include "TCP" }
end

```
  ### Use this InSpec resource to enumerate IDs then test in-depth using `google_compute_region`
```
  google_compute_region_health_checks(project: 'chef-inspec-gcp',  region: 'europe-west2').region_names.each do |region_name|
    describe google_compute_region(project: 'chef-inspec-gcp',  region: region_name) do
      it { should exist }
    end
  end
```

  ### Test that there are more than a specified number of regions available for the project
```
  describe google_compute_region_health_checks(project: 'chef-inspec-gcp',  region: 'europe-west2') do
    its('unhealthy_thresholds') { should eq 2}
  end
```
  ### Test that an expected region is available for the project
```
  describe google_compute_region_health_checks(project: 'chef-inspec-gcp',  region: 'europe-west2') do
    its('healthy_thresholds') { should include 2 }
  end
```
  ### Test whether any regions are in status "DOWN"
```
  describe google_compute_region_health_checks(project: 'chef-inspec-gcp',  region: 'europe-west2') do
    its('check_interval_secs') { should_not include 5 }
  end
```

```

## Properties
Properties that can be accessed from the `google_compute_region_health_checks` resource:

See [google_compute_region_health_check.md](google_compute_region_health_check.md) for more detailed information
  * `check_interval_secs`: an array of `google_compute_region_health_check` check_interval_sec
  * `creation_timestamps`: an array of `google_compute_region_health_check` creation_timestamp
  * `descriptions`: an array of `google_compute_region_health_check` description
  * `healthy_thresholds`: an array of `google_compute_region_health_check` healthy_threshold
  * `ids`: an array of `google_compute_region_health_check` id
  * `names`: an array of `google_compute_region_health_check` name
  * `unhealthy_thresholds`: an array of `google_compute_region_health_check` unhealthy_threshold
  * `timeout_secs`: an array of `google_compute_region_health_check` timeout_sec
  * `types`: an array of `google_compute_region_health_check` type
  * `http_health_checks`: an array of `google_compute_region_health_check` http_health_check
  * `https_health_checks`: an array of `google_compute_region_health_check` https_health_check
  * `tcp_health_checks`: an array of `google_compute_region_health_check` tcp_health_check
  * `ssl_health_checks`: an array of `google_compute_region_health_check` ssl_health_check
  * `http2_health_checks`: an array of `google_compute_region_health_check` http2_health_check
  * `grpc_health_checks`: an array of `google_compute_region_health_check` grpc_health_check
  * `log_configs`: an array of `google_compute_region_health_check` log_config
  * `regions`: an array of `google_compute_region_health_check` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
