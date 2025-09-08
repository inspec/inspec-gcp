+++

title = "google_compute_region_security_policies Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.inspec]

title = "google_compute_region_security_policies"
identifier = "inspec/resources/gcp/google_compute_region_security_policies Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_security_policies` InSpec audit resource to test the properties of a test a Google RegionSecurityPolicy.

## Syntax
A `google_compute_region_security_policies` is used to test a Google RegionSecurityPolicy resource

## Examples
```
    describe google_compute_region_security_policies(project: 'chef-gcp-inspec', region: ' ') do
    it { should exist }
  end
```

## Parameters
Properties that can be accessed from the `google_compute_region_security_policies` resource:

See [google_compute_region_security_policy.md](google_compute_region_security_policy.md) for more detailed information
* `user_defined_fields`: an array of `google_compute_region_security_policy` user_defined_fields
* `kinds`: an array of `google_compute_region_security_policy` kind
* `ids`: an array of `google_compute_region_security_policy` id
* `creation_timestamps`: an array of `google_compute_region_security_policy` creation_timestamp
* `names`: an array of `google_compute_region_security_policy` name
* `descriptions`: an array of `google_compute_region_security_policy` description
* `rules`: an array of `google_compute_region_security_policy` rules
* `cloud_armor_configs`: an array of `google_compute_region_security_policy` cloud_armor_config
* `adaptive_protection_configs`: an array of `google_compute_region_security_policy` adaptive_protection_config
* `ddos_protection_configs`: an array of `google_compute_region_security_policy` ddos_protection_config
* `advanced_options_configs`: an array of `google_compute_region_security_policy` advanced_options_config
* `recaptcha_options_configs`: an array of `google_compute_region_security_policy` recaptcha_options_config
* `fingerprints`: an array of `google_compute_region_security_policy` fingerprint
* `self_links`: an array of `google_compute_region_security_policy` self_link
* `self_link_with_ids`: an array of `google_compute_region_security_policy` self_link_with_id
* `types`: an array of `google_compute_region_security_policy` type
* `associations`: an array of `google_compute_region_security_policy` associations
* `labels`: an array of `google_compute_region_security_policy` labels
* `label_fingerprints`: an array of `google_compute_region_security_policy` label_fingerprint
* `rule_tuple_counts`: an array of `google_compute_region_security_policy` rule_tuple_count
* `display_names`: an array of `google_compute_region_security_policy` display_name
* `parents`: an array of `google_compute_region_security_policy` parent
* `regions`: an array of `google_compute_region_security_policy` region
## Properties
Properties that can be accessed from the `google_compute_region_security_policies` resource:

See [google_compute_region_security_policy.md](google_compute_region_security_policy.md) for more detailed information
* `user_defined_fields`: an array of `google_compute_region_security_policy` user_defined_fields
* `kinds`: an array of `google_compute_region_security_policy` kind
* `ids`: an array of `google_compute_region_security_policy` id
* `creation_timestamps`: an array of `google_compute_region_security_policy` creation_timestamp
* `names`: an array of `google_compute_region_security_policy` name
* `descriptions`: an array of `google_compute_region_security_policy` description
* `rules`: an array of `google_compute_region_security_policy` rules
* `cloud_armor_configs`: an array of `google_compute_region_security_policy` cloud_armor_config
* `adaptive_protection_configs`: an array of `google_compute_region_security_policy` adaptive_protection_config
* `ddos_protection_configs`: an array of `google_compute_region_security_policy` ddos_protection_config
* `advanced_options_configs`: an array of `google_compute_region_security_policy` advanced_options_config
* `recaptcha_options_configs`: an array of `google_compute_region_security_policy` recaptcha_options_config
* `fingerprints`: an array of `google_compute_region_security_policy` fingerprint
* `self_links`: an array of `google_compute_region_security_policy` self_link
* `self_link_with_ids`: an array of `google_compute_region_security_policy` self_link_with_id
* `types`: an array of `google_compute_region_security_policy` type
* `associations`: an array of `google_compute_region_security_policy` associations
* `labels`: an array of `google_compute_region_security_policy` labels
* `label_fingerprints`: an array of `google_compute_region_security_policy` label_fingerprint
* `rule_tuple_counts`: an array of `google_compute_region_security_policy` rule_tuple_count
* `display_names`: an array of `google_compute_region_security_policy` display_name
* `parents`: an array of `google_compute_region_security_policy` parent
* `regions`: an array of `google_compute_region_security_policy` region

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
