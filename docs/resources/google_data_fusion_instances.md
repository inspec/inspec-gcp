+++
title = "google_data_fusion_instances Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_data_fusion_instances"
identifier = "inspec/resources/gcp/google_data_fusion_instances Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_data_fusion_instances` InSpec audit resource to test the properties of a Google Cloud Instance resource.

## Examples

```ruby
  describe google_data_fusion_instances(parent: 'projects/*/locations/*') do
    it { should exist }
  end
```

## Parameters

Parameters that can be accessed from the `google_data_fusion_instances` resource:

See [google_data_fusion_instance](google_data_fusion_instance) for more detailed information.

* `names`: an array of `google_data_fusion_instance` name
* `descriptions`: an array of `google_data_fusion_instance` description
* `types`: an array of `google_data_fusion_instance` type
* `enable_stackdriver_loggings`: an array of `google_data_fusion_instance` enable_stackdriver_logging
* `enable_stackdriver_monitorings`: an array of `google_data_fusion_instance` enable_stackdriver_monitoring
* `private_instances`: an array of `google_data_fusion_instance` private_instance
* `network_configs`: an array of `google_data_fusion_instance` network_config
* `labels`: an array of `google_data_fusion_instance` labels
* `options`: an array of `google_data_fusion_instance` options
* `create_times`: an array of `google_data_fusion_instance` create_time
* `update_times`: an array of `google_data_fusion_instance` update_time
* `states`: an array of `google_data_fusion_instance` state
* `state_messages`: an array of `google_data_fusion_instance` state_message
* `service_endpoints`: an array of `google_data_fusion_instance` service_endpoint
* `zones`: an array of `google_data_fusion_instance` zone
* `versions`: an array of `google_data_fusion_instance` version
* `service_accounts`: an array of `google_data_fusion_instance` service_account
* `display_names`: an array of `google_data_fusion_instance` display_name
* `available_versions`: an array of `google_data_fusion_instance` available_version
* `api_endpoints`: an array of `google_data_fusion_instance` api_endpoint
* `gcs_buckets`: an array of `google_data_fusion_instance` gcs_bucket
* `accelerators`: an array of `google_data_fusion_instance` accelerators
* `p4_service_accounts`: an array of `google_data_fusion_instance` p4_service_account
* `tenant_project_ids`: an array of `google_data_fusion_instance` tenant_project_id
* `dataproc_service_accounts`: an array of `google_data_fusion_instance` dataproc_service_account
* `enable_rbacs`: an array of `google_data_fusion_instance` enable_rbac
* `crypto_key_configs`: an array of `google_data_fusion_instance` crypto_key_config
* `disabled_reasons`: an array of `google_data_fusion_instance` disabled_reason
* `event_publish_configs`: an array of `google_data_fusion_instance` event_publish_config
* `enable_zone_separations`: an array of `google_data_fusion_instance` enable_zone_separation
* `satisfies_pzs`: an array of `google_data_fusion_instance` satisfies_pzs
* `workforce_identity_service_endpoints`: an array of `google_data_fusion_instance` workforce_identity_service_endpoint
* `patch_revisions`: an array of `google_data_fusion_instance` patch_revision
* `dataplex_data_lineage_integration_enableds`: an array of `google_data_fusion_instance` dataplex_data_lineage_integration_enabled
* `maintenance_policies`: an array of `google_data_fusion_instance` maintenance_policy

## Properties

Properties that can be accessed from the `google_data_fusion_instances` resource:

See [google_data_fusion_instance](google_data_fusion_instance) for more detailed information.

* `names`: an array of `google_data_fusion_instance` name
* `descriptions`: an array of `google_data_fusion_instance` description
* `types`: an array of `google_data_fusion_instance` type
* `enable_stackdriver_loggings`: an array of `google_data_fusion_instance` enable_stackdriver_logging
* `enable_stackdriver_monitorings`: an array of `google_data_fusion_instance` enable_stackdriver_monitoring
* `private_instances`: an array of `google_data_fusion_instance` private_instance
* `network_configs`: an array of `google_data_fusion_instance` network_config
* `labels`: an array of `google_data_fusion_instance` labels
* `options`: an array of `google_data_fusion_instance` options
* `create_times`: an array of `google_data_fusion_instance` create_time
* `update_times`: an array of `google_data_fusion_instance` update_time
* `states`: an array of `google_data_fusion_instance` state
* `state_messages`: an array of `google_data_fusion_instance` state_message
* `service_endpoints`: an array of `google_data_fusion_instance` service_endpoint
* `zones`: an array of `google_data_fusion_instance` zone
* `versions`: an array of `google_data_fusion_instance` version
* `service_accounts`: an array of `google_data_fusion_instance` service_account
* `display_names`: an array of `google_data_fusion_instance` display_name
* `available_versions`: an array of `google_data_fusion_instance` available_version
* `api_endpoints`: an array of `google_data_fusion_instance` api_endpoint
* `gcs_buckets`: an array of `google_data_fusion_instance` gcs_bucket
* `accelerators`: an array of `google_data_fusion_instance` accelerators
* `p4_service_accounts`: an array of `google_data_fusion_instance` p4_service_account
* `tenant_project_ids`: an array of `google_data_fusion_instance` tenant_project_id
* `dataproc_service_accounts`: an array of `google_data_fusion_instance` dataproc_service_account
* `enable_rbacs`: an array of `google_data_fusion_instance` enable_rbac
* `crypto_key_configs`: an array of `google_data_fusion_instance` crypto_key_config
* `disabled_reasons`: an array of `google_data_fusion_instance` disabled_reason
* `event_publish_configs`: an array of `google_data_fusion_instance` event_publish_config
* `enable_zone_separations`: an array of `google_data_fusion_instance` enable_zone_separation
* `satisfies_pzs`: an array of `google_data_fusion_instance` satisfies_pzs
* `workforce_identity_service_endpoints`: an array of `google_data_fusion_instance` workforce_identity_service_endpoint
* `patch_revisions`: an array of `google_data_fusion_instance` patch_revision
* `dataplex_data_lineage_integration_enableds`: an array of `google_data_fusion_instance` dataplex_data_lineage_integration_enabled
* `maintenance_policies`: an array of `google_data_fusion_instance` maintenance_policy

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Data Fusion API](https://console.cloud.google.com/apis/library/datafusion.googleapis.com) is enabled for the current project.
