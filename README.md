# InSpec GCP (Google Cloud Platform) Resource Pack

* **Project State-: Maintained**

For more information on project states and SLAs, see [this documentation](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md).

This InSpec resource pack uses the native Google Cloud Platform (GCP) support in InSpec and provides the required resources to write tests for GCP.

This implementation was inspired on the ideas by [Martez Reed](https://github.com/martezr/inspec-gcp).

## Prerequisites

### Install and configure the Google cloud SDK*

Download the [SDK](https://cloud.google.com/sdk/docs/) and run the installation:

```
./google-cloud-sdk/install.sh
```

### Create credentials file via:

```bash
gcloud auth application-default login
```
If successful, this should be similar to:
```bash
$ cat ~/.config/gcloud/application_default_credentials.json

{
  "client_id": "764086051850-6qr4p6gpi6hn50asdr.apps.googleusercontent.com",
  "client_secret": "d-fasdfasdfasdfaweroi23jknrmfs;f8sh",
  "refresh_token": "1/asdfjlklwna;ldkna'dfmk-lCkju3-yQmjr20xVZonrfkE48L",
  "type": "authorized_user"
}
```

While InSpec can use user accounts for authentication, [Google Cloud documentation](https://cloud.google.com/docs/authentication/) recommends using service accounts.

### Create Service Accounts
1. Go to `Console` in the Google Cloud.
2. Click on `Service Accounts`.
3. Click on `Create Service Accounts` and give the required details.
4. Click on `Done`.
5. Now Click on `Keys` Tab.
6. Click on `Add Key`.
7. Click on `Create New Key`.
8. Select the Key type as `JSON`.
9. Click on `Create`.
10. The Service Account Key will be downloaded. For example: `myproject-1-feb7993e8660.jsonmyproject-1-feb7993e8660.json`
11. Move the key to the `~/.config/gcloud` folder. If the file gets downloaded in the `Downloads` folder, use the below command.
```bash
mv ~/Downloads/myproject-1-feb7993e8660.json ~/.config/gcloud/
```
12. The json credential file for a service account looks like this:
```bash
$ cat ~/.config/gcloud/myproject-1-feb7993e8660.json
{
  "type": "service_account",
  "project_id": "myproject-1",
  "private_key_id": "eb45b2fc0c33ea9b6fa212aaa08b1ed814bf8660",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADAN3662...fke9n6LAf268E/4EWhIzg==\n-----END PRIVATE KEY-----\n",
  "client_email": "auto-testing@myproject-1.iam.gserviceaccount.com",
  "client_id": "112144174133171863632",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/auto-testing%40myproject-1.iam.gserviceaccount.com"
}
```
13. Now Setup the environmental variable for the 'GOOGLE_APPLICATION_CREDENTIALS'. And InSpec can be instructed to use it by setting this ENV variable prior to running `inspec exec`:
```bash
$ export GOOGLE_APPLICATION_CREDENTIALS='~/.config/gcloud/myproject-1-feb7993e8660.json'
```

#### NOTE:
If still error comes, please check your IAM roles and permissions.

### Enable the appropriate APIs that you want to use:

- [Enable Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/)
- [Enable Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com)

## Use the resources

Since this is an InSpec resource pack, it only defines InSpec resources. It includes example tests only. To easily use the GCP resources in your tests do the following:

###  Create a new profile for GCP

```bash
$ inspec init profile --platform gcp my-gcp-profile

Create new profile at /Users/spaterson/my-gcp-profile
 * Create directory libraries
 * Create file README.md
 * Create directory controls
 * Create file controls/example.rb
 * Create file inspec.yml
 * Create file attributes.yml
 * Create file libraries/.gitkeep
```

### Update `inputs.yml` to point to your project

```yml
gcp_project_id: 'my-gcp-project'
```

The generated `inspec.yml` file automatically points to the InSpec GCP resource pack:

```yaml
name: my-gcp-profile
title: My GCP InSpec Profile
version: 0.1.0
inspec_version: '>= 4'
inputs:
  - name: gcp_project_id
    required: true
    description: 'The GCP project identifier.'
depends:
  - name: inspec-gcp
    url: https://github.com/inspec/inspec-gcp/archive/x.tar.gz
supports:
  - platform: gcp
```

(For available inspec-gcp versions, see this list of [inspec-gcp versions](https://github.com/inspec/inspec-gcp/releases).)

## Run the tests

```bash
$ cd my-gcp-profile/
$ inspec exec . -t gcp:// --input-file inputs.yml

Profile: GCP InSpec Profile (my-profile)
Version: 0.1.0
Target:  gcp://local-service-account@my-gcp-project.iam.gserviceaccount.com
Target ID: 8123456-12a3-1234-123a-a12s5c5abcx1

  ✔  gcp-single-region-1.0: Ensure single region has the correct properties.
     ✔  Region europe-west2 zone_names should include "europe-west2-a"
  ✔  gcp-regions-loop-1.0: Ensure regions have the correct properties in bulk.
     ✔  Region asia-east1 is expected to be up
     ✔  Region asia-east2 is expected to be up
     ✔  Region asia-northeast1 is expected to be up
     ✔  Region asia-northeast2 is expected to be up
     ✔  Region asia-northeast3 is expected to be up
     ✔  Region asia-south1 is expected to be up
     ✔  Region asia-south2 is expected to be up
     ✔  Region asia-southeast1 is expected to be up
     ✔  Region asia-southeast2 is expected to be up
     ✔  Region australia-southeast1 is expected to be up
     ✔  Region australia-southeast2 is expected to be up
     ✔  Region europe-central2 is expected to be up
     ✔  Region europe-north1 is expected to be up
     ✔  Region europe-southwest1 is expected to be up
     ✔  Region europe-west1 is expected to be up
     ✔  Region europe-west2 is expected to be up
     ✔  Region europe-west3 is expected to be up
     ✔  Region europe-west4 is expected to be up
     ✔  Region europe-west6 is expected to be up
     ✔  Region europe-west8 is expected to be up
     ✔  Region europe-west9 is expected to be up
     ✔  Region me-west1 is expected to be up
     ✔  Region northamerica-northeast1 is expected to be up
     ✔  Region northamerica-northeast2 is expected to be up
     ✔  Region southamerica-east1 is expected to be up
     ✔  Region southamerica-west1 is expected to be up
     ✔  Region us-central1 is expected to be up
     ✔  Region us-east1 is expected to be up
     ✔  Region us-east4 is expected to be up
     ✔  Region us-east5 is expected to be up
     ✔  Region us-south1 is expected to be up
     ✔  Region us-west1 is expected to be up
     ✔  Region us-west2 is expected to be up
     ✔  Region us-west3 is expected to be up
     ✔  Region us-west4 is expected to be up


Profile:   Google Cloud Platform Resource Pack (inspec-gcp)
Version:   1.10.37
Target:    gcp://local-service-account@my-gcp-project.iam.gserviceaccount.com
Target ID: 8123456-12a3-1234-123a-a12s5c5abcx1

     No tests executed.

Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary:  36 successful, 0 failures, 0 skipped
```

## Resource documentation

The following resources are available in the InSpec GCP Profile
| InSpec GCP Supported Resources                                                                                       | [https://www.inspec.io/docs/reference/resources/#gcp-resources](https://www.inspec.io/docs/reference/resources/#gcp-resources) |
|:---------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------|
| Singular Resource                                                                                                    | Plural Resource                                                                                                                |
| [google_access_context_manager_access_level](docs/resources/google_access_context_manager_access_level.md)           | [google_access_context_manager_access_levels](docs/resources/google_access_context_manager_access_levels.md)                   |
| [google_access_context_manager_access_policy](docs/resources/google_access_context_manager_access_policy.md)         | [google_access_context_manager_access_policies](docs/resources/google_access_context_manager_access_policies.md)               |
| [google_access_context_manager_service_perimeter](docs/resources/google_access_context_manager_service_perimeter.md) | [google_access_context_manager_service_perimeters](docs/resources/google_access_context_manager_service_perimeters.md)         |
| [google_apigeegoogle_apigee_organization_envgroup](docs/resources/google_apigee_organization_envgroup.md)            | [google_apigee_organization_envgroups](docs/resources/google_apigee_organization_envgroups.md)                     |
| [google_apigee_organization_envgroup_attachment](docs/resources/google_apigee_organization_envgroup_attachment.md)   | [google_apigee_organization_envgroup_attachments](docs/resources/google_apigee_organization_envgroup_attachments.md)           |
| [google_appengine_standard_app_version](docs/resources/google_appengine_standard_app_version.md)                     | [google_appengine_standard_app_versions](docs/resources/google_appengine_standard_app_versions.md)                             |
| [google_bigquery_dataset](docs/resources/google_bigquery_dataset.md)                                                 | [google_bigquery_datasets](docs/resources/google_bigquery_datasets.md)                                                         |
| [google_bigquery_table](docs/resources/google_bigquery_table.md)                                                     | [google_bigquery_tables](docs/resources/google_bigquery_tables.md)                                                             |
| [google_billing_project_billing_info](docs/resources/google_billing_project_billing_info.md)                         | No Plural Resource                                                                                                             |
| [google_cloud_scheduler_job](docs/resources/google_cloud_scheduler_job.md)                                           | [google_cloud_scheduler_jobs](docs/resources/google_cloud_scheduler_jobs.md)                                                   |
| [google_cloudbuild_trigger](docs/resources/google_cloudbuild_trigger.md)                                             | [google_cloudbuild_triggers](docs/resources/google_cloudbuild_triggers.md)                                                     |
| [google_cloudfunctions_cloud_function](docs/resources/google_cloudfunctions_cloud_function.md)                       | [google_cloudfunctions_cloud_functions](docs/resources/google_cloudfunctions_cloud_functions.md)                               |
| [google_composer_project_location_environment](docs/resources/google_composer_project_location_environment.md)                           | [google_composer_project_location_environments](docs/resources/google_composer_project_location_environments.md)             |
| [google_compute_address](docs/resources/google_compute_address.md)                                                   | [google_compute_addresses](docs/resources/google_compute_addresses.md)                                                         |
| [google_compute_autoscaler](docs/resources/google_compute_autoscaler.md)                                             | [google_compute_autoscalers](docs/resources/google_compute_autoscalergoogle_compute_autoscaler.md)                             |
| [google_compute_backend_bucket](docs/resources/google_compute_backend_bucket.md)                                     | No Plural Resource                                                                                                             |
| [google_compute_backend_service](docs/resources/google_compute_backend_service.md)                                   | [google_compute_backend_services](docs/resources/google_compute_backend_services.md)                                           |
| [google_compute_disk](docs/resources/google_compute_disk.md)                                                         | [google_compute_disks](docs/resources/google_compute_disks.md)                                                                 |
| [google_compute_disk_type](docs/resources/google_compute_disk_type.md)                                               | [google_compute_disk_types](docs/resources/google_compute_disk_types.md)                                                       |
| [google_data_loss_prevention_inspect_template](docs/resources/google_data_loss_prevention_inspect_template.md)                                               | [google_data_loss_prevention_inspect_templates](docs/resources/google_data_loss_prevention_inspect_templates.md)                                                       |
| [google_compute_external_vpn_gateway](docs/resources/google_compute_external_vpn_gateway.md)                         | [google_compute_external_vpn_gateways](docs/resources/google_compute_external_vpn_gateways.md)                                 |
| [google_compute_firewall](docs/resources/google_compute_firewall.md)                                                 | [google_compute_firewalls](docs/resources/google_compute_firewalls.md)                                                         |
| [google_compute_forwarding_rule](docs/resources/google_compute_forwarding_rule.md)                                   | [google_compute_forwarding_rules](docs/resources/google_compute_forwarding_rules.md)                                           |
| [google_compute_global_address](docs/resources/google_compute_global_address.md)                                     | [google_compute_global_addresses](docs/resources/google_compute_global_addresses.md)                                           |
| [google_compute_global_forwarding_rule](docs/resources/google_compute_global_forwarding_rule.md)                     | [google_compute_global_forwarding_rules](docs/resources/google_compute_global_forwarding_rules.md)                             |
| [google_compute_global_network_endpoint_group](docs/resources/google_compute_global_network_endpoint_group.md)                                 | [google_compute_global_network_endpoint_groups](docs/resources/google_compute_global_network_endpoint_groups.md)
| [google_compute_global_operation](docs/resources/google_compute_global_operation.md)                                 | [google_compute_global_operations](docs/resources/google_compute_global_operations.md)                                         |
| [google_compute_health_check](docs/resources/google_compute_health_check.md)                                         | [google_compute_health_checks](docs/resources/google_compute_health_checks.md)                                                 |
| [google_compute_health_check_service](docs/resources/google_compute_health_check_service.md)                         | [google_compute_health_check_services](docs/resources/google_compute_health_check_services.md)                                 |
| [google_compute_http_health_check](docs/resources/google_compute_http_health_check.md)                               | [google_compute_http_health_checks](docs/resources/google_compute_http_health_checks.md)                                       |
| [google_compute_https_health_check](docs/resources/google_compute_https_health_check.md)                             | [google_compute_https_health_checks](docs/resources/google_compute_https_health_checks.md)                                     |
| [google_compute_image_family_view](docs/resources/google_compute_image_family_view.md)                                                       | No Plural Resource                                                                                                             |
| [google_compute_image](docs/resources/google_compute_image.md)                                                       | No Plural Resource                                                                                                             |
| [google_compute_instance](docs/resources/google_compute_instance.md)                                                 | [google_compute_instances](docs/resources/google_compute_instances.md)                                                         |
| [google_compute_instance_group](docs/resources/google_compute_instance_group.md)                                     | [google_compute_instance_groups](docs/resources/google_compute_instance_groups.md)                                             |
| [google_compute_instance_group_manager](docs/resources/google_compute_instance_group_manager.md)                     | [google_compute_instance_group_managers](docs/resources/google_compute_instance_group_managers.md)                             |
| [google_compute_instance_template](docs/resources/google_compute_instance_template.md)                               | [google_compute_instance_templates](docs/resources/google_compute_instance_templates.md)                                       |
| [google_compute_interconnect](docs/resources/google_compute_interconnect.md)                                         | [google_compute_interconnects](docs/resources/google_compute_interconnects.md)                                                 |
| [google_compute_interconnect_location](docs/resources/google_compute_interconnect_location.md)                       | [google_compute_interconnect_locations](docs/resources/google_compute_interconnect_locations.md)                               |
| [google_compute_license_code](docs/resources/google_compute_license_code.md)                                         | No Plural Resource                                                                                                             |
| [google_compute_license](docs/resources/google_compute_license.md)                                                   | [google_compute_licenses](docs/resources/google_compute_licenses.md)                                                           |
| [google_compute_machine_image](docs/resources/google_compute_machine_image.md)                                                   | [google_compute_machine_images](docs/resources/google_compute_machine_images.md)                                                           |
| [google_compute_machine_type](docs/resources/google_compute_machine_type.md)                                                   | [google_compute_machine_types](docs/resources/google_compute_machine_types.md)                                                           |
| [google_compute_network_attachment](docs/resources/google_compute_network_attachment.md)                                                   | [google_compute_network_attachments](docs/resources/google_compute_network_attachments.md)                                                           |
| [google_compute_network_edge_security_service](docs/resources/google_compute_network_edge_security_service.md)                                         | No Plural Resource                                                                                                             |
| [google_compute_network](docs/resources/google_compute_network.md)                                                   | [google_compute_networks](docs/resources/google_compute_networks.md)                                                           |
| [google_compute_network_endpoint_group](docs/resources/google_compute_network_endpoint_group.md)                     | [google_compute_network_endpoint_groups](docs/resources/google_compute_network_endpoint_groups.md)                             |
| [google_compute_network_firewall_policy](docs/resources/google_compute_network_firewall_policy.md)                     | [google_compute_network_firewall_policies](docs/resources/google_compute_network_firewall_policies.md)                             |
| [google_compute_node_group](docs/resources/google_compute_node_group.md)                                             | [google_compute_node_groups](docs/resources/google_compute_node_groups.md)                                                     |
| [google_compute_node_template](docs/resources/google_compute_node_template.md)                                       | [google_compute_node_templates](docs/resources/google_compute_node_templates.md)                                               |
| [google_compute_node_type](docs/resources/google_compute_node_type.md)                           | [google_compute_node_types](docs/resources/google_compute_node_types.md)             |
| [google_compute_packet_mirroring](docs/resources/google_compute_packet_mirroring.md)                           | [google_compute_packet_mirrorings](docs/resources/google_compute_packet_mirrorings.md)             |
| [google_compute_project_info](docs/resources/google_compute_project_info.md)                                         | No Plural Resource                                                                                                             |
| [google_compute_public_delegated_prefix](docs/resources/google_compute_public_delegated_prefix.md)                   | [google_compute_public_delegated_prefixes](docs/resources/google_compute_public_delegated_prefixes.md)                         |
| [google_compute_region](docs/resources/google_compute_region.md)                                                     | [google_compute_regions](docs/resources/google_compute_regions.md)                                                             |
| [google_compute_region_backend_service](docs/resources/google_compute_region_backend_service.md)                     | [google_compute_region_backend_services](docs/resources/google_compute_region_backend_services.md)                             |
| [google_compute_region_health_check](docs/resources/google_compute_region_health_check.md)                           | [google_compute_region_health_checks](docs/resources/google_compute_region_health_checks.md)                                   |
| [google_compute_region_instance_group](docs/resources/google_compute_region_instance_group.md)                       | [google_compute_region_instance_groups](docs/resources/google_compute_region_instance_groups.md)                               |
| [google_compute_region_instance_group_manager](docs/resources/google_compute_region_instance_group_manager.md)       | [google_compute_region_instance_group_managers](docs/resources/google_compute_region_instance_group_managers.md)               |
| [google_compute_region_operation](docs/resources/google_compute_region_operation.md)                                 | [google_compute_region_operations](docs/resources/google_compute_region_operations.md)                                         |
| [google_compute_regional_disk](docs/resources/google_compute_regional_disk.md)                                       | [google_compute_regional_disks](docs/resources/google_compute_regional_disks.md)                                               |
| [google_compute_route](docs/resources/google_compute_route.md)                                                       | [google_compute_routes](docs/resources/google_compute_routes.md)                                                               |
| [google_compute_router](docs/resources/google_compute_router.md)                                                     | [google_compute_routers](docs/resources/google_compute_routers.md)                                                             |
| [google_compute_router_nat](docs/resources/google_compute_router_nat.md)                                             | [google_compute_router_nats](docs/resources/google_compute_router_nats.md)                                                     |
| [google_compute_security_policy](docs/resources/google_compute_security_policy.md)                                   | [google_compute_security_policies](docs/resources/google_compute_security_policies.md)                                         |
| [google_compute_snapshot](docs/resources/google_compute_snapshot.md)                                                 | [google_compute_snapshots](docs/resources/google_compute_snapshots.md)                                                         |
| [google_compute_ssl_certificate](docs/resources/google_compute_ssl_certificate.md)                                   | [google_compute_ssl_certificates](docs/resources/google_compute_ssl_certificates.md)                                           |
| [google_compute_ssl_policy](docs/resources/google_compute_ssl_policy.md)                                             | [google_compute_ssl_policies](docs/resources/google_compute_ssl_policies.md)                                                   |
| [google_compute_service_attachment](docs/resources/google_compute_service_attachment.md)                           | [google_compute_service_attachments](docs/resources/google_compute_service_attachments.md)             |
| [google_compute_subnetwork](docs/resources/google_compute_subnetwork.md)                                             | [google_compute_subnetworks](docs/resources/google_compute_subnetworks.md)                                                     |
| [google_compute_subnetwork_iam_binding](docs/resources/google_compute_subnetwork_iam_binding.md)                     | No Plural Resource                                                                                                             |
| [google_compute_subnetwork_iam_policy](docs/resources/google_compute_subnetwork_iam_policy.md)                       | No Plural Resource                                                                                                             |
| [google_compute_target_http_proxy](docs/resources/google_compute_target_http_proxy.md)                               | [google_compute_target_http_proxies](docs/resources/google_compute_target_http_proxies.md)                                     |
| [google_compute_target_https_proxy](docs/resources/google_compute_target_https_proxy.md)                             | [google_compute_target_https_proxies](docs/resources/google_compute_target_https_proxies.md)                                   |
| [google_compute_target_pool](docs/resources/google_compute_target_pool.md)                                           | [google_compute_target_pools](docs/resources/google_compute_target_pools.md)                                                   |
| [google_compute_target_tcp_proxy](docs/resources/google_compute_target_tcp_proxy.md)                                 | [google_compute_target_tcp_proxies](docs/resources/google_compute_target_tcp_proxies.md)                                       |
| [google_compute_url_map](docs/resources/google_compute_url_map.md)                                                   | [google_compute_url_maps](docs/resources/google_compute_url_maps.md)                                                           |
| [google_compute_vpn_tunnel](docs/resources/google_compute_vpn_tunnel.md)                                             | [google_compute_vpn_tunnels](docs/resources/google_compute_vpn_tunnels.md)                                                     |
| No Singular Resource                                           | [google_compute_xpn_resources](docs/resources/google_compute_xpn_resources.md)                                                     |
| [google_compute_zone](docs/resources/google_compute_zone.md)                                                         | [google_compute_zones](docs/resources/google_compute_zones.md)                                                                 |
| [google_compute_zone_operation](docs/resources/google_compute_zone_operation.md)                                     | [google_compute_zone_operations](docs/resources/google_compute_zone_operations.md)                                             |
| [google_container_cluster](docs/resources/google_container_cluster.md)                                               | [google_container_clusters](docs/resources/google_container_clusters.md)                                                       |
| [google_container_node_pool](docs/resources/google_container_node_pool.md)                                           | [google_container_node_pools](docs/resources/google_container_node_pools.md)                                                   |
| [google_container_server_config](docs/resources/google_container_server_config.md)                                   | No Plural Resource                                                                                                             |
| [google_dataflow_project_location_job](docs/resources/google_dataflow_project_location_job.md)                                                 | [google_dataflow_project_location_jobs](docs/resources/google_dataflow_project_location_jobs.md)                                                         |
| [google_dataproc_cluster](docs/resources/google_dataproc_cluster.md)                                                 | [google_dataproc_clusters](docs/resources/google_dataproc_clusters.md)                                                         |
| [google_dns_managed_zone](docs/resources/google_dns_managed_zone.md)                                                 | [google_dns_managed_zones](docs/resources/google_dns_managed_zones.md)                                                         |
| [google_dns_resource_record_set](docs/resources/google_dns_resource_record_set.md)                                   | [google_dns_resource_record_sets](docs/resources/google_dns_resource_record_sets.md)                                           |
| [google_dlp_dt](docs/resources/google_dlp_dt.md)                                                                     | [google_dlp_dts](docs/resources/google_dlp_dts.md)
| [google_dlp_inspect_template](docs/resources/google_dlp_inspect_template.md)                                | [google_dlp_inspect_templates](docs/resources/google_dlp_inspect_templates.md)                     |
| [google_dlp_job_trigger](docs/resources/google_dlp_job_trigger.md)                                   | [google_dlp_job_triggers](docs/resources/google_dlp_job_triggers.md)                         |
| [google_dlp_job](docs/resources/google_dlp_job.md)                                                                    | [google_dlp_jobs](docs/resources/google_dlp_jobs.md)                                 |
| [google_dlp_stored_info_type](docs/resources/google_dlp_stored_info_types.md)                         | [google_dlp_stored_info_types](docs/resources/google_dlp_stored_info_types.md)                         |
| [google_filestore_instance](docs/resources/google_filestore_instance.md)                                             | [google_filestore_instances](docs/resources/google_filestore_instances.md)                                                     |
| [google_iam_organization_custom_role](docs/resources/google_iam_organization_custom_role.md)                         | [google_iam_organization_custom_roles](docs/resources/google_iam_organization_custom_roles.md)                                 |
| [google_kms_crypto_key](docs/resources/google_kms_crypto_key.md)                                                     | [google_kms_crypto_keys](docs/resources/google_kms_crypto_keys.md)                                                             |
| [google_kms_crypto_key_iam_binding](docs/resources/google_kms_crypto_key_iam_binding.md)                             | [google_kms_crypto_key_iam_bindings](docs/resources/google_kms_crypto_key_iam_bindings.md)                                     |
| [google_kms_crypto_key_iam_policy](docs/resources/google_kms_crypto_key_iam_policy.md)                               | No Plural Resource                                                                                                             |
| [google_kms_crypto_key_version](docs/resources/google_kms_crypto_key_version.md)                             | [google_kms_crypto_key_versions](docs/resources/google_kms_crypto_key_versions.md)                                     |
| [google_kms_ekm_connection](docs/resources/google_kms_ekm_connection.md)                                             | [google_kms_ekm_connections](docs/resources/google_kms_ekm_connections.md)                                                     |
| [google_kms_key_ring](docs/resources/google_kms_key_ring.md)                                                         | [google_kms_key_rings](docs/resources/google_kms_key_rings.md)                                                                 |
| [google_kms_key_ring_iam_binding](docs/resources/google_kms_key_ring_iam_binding.md)                                 | [google_kms_key_ring_iam_bindings](docs/resources/google_kms_key_ring_iam_bindings.md)                                         |
| [google_kms_key_ring_iam_policy](docs/resources/google_kms_key_ring_iam_policy.md)                                   | No Plural Resource                                                                                                             |
| [google_kms_key_ring_import_job](docs/resources/google_kms_key_ring_import_job.md)                                   | [google_kms_key_ring_import_jobs](docs/resources/google_kms_key_ring_import_jobs.md)                                           |
| [google_kms_location](docs/resources/google_kms_location.md)                                                         | [google_kms_locations](docs/resources/google_kms_locations.md)                                                                 |
| [google_logging_folder_exclusion](docs/resources/google_logging_folder_exclusion.md)                                 | [google_logging_folder_exclusions](docs/resources/google_logging_folder_exclusions.md)                                         |
| [google_logging_folder_log_sink](docs/resources/google_logging_folder_log_sink.md)                                   | [google_logging_folder_log_sinks](docs/resources/google_logging_folder_log_sinks.md)                                           |
| [google_logging_organization_log_sink](docs/resources/google_logging_organization_log_sink.md)                       | [google_logging_organization_log_sinks](docs/resources/google_logging_organization_log_sinks.md)                               |
| [google_logging_project_exclusion](docs/resources/google_logging_project_exclusion.md)                               | [google_logging_project_exclusions](docs/resources/google_logging_project_exclusions.md)                                       |
| [google_logging_project_sink](docs/resources/google_logging_project_sink.md)                                         | [google_logging_project_sinks](docs/resources/google_logging_project_sinks.md)                                                 |
| [google_memcache_instance](docs/resources/google_memcache_instance.md)                                               | [google_memcache_instances](docs/resources/google_memcache_instances.md)                                                       |
| [google_ml_engine_model](docs/resources/google_ml_engine_model.md)                                                   | [google_ml_engine_models](docs/resources/google_ml_engine_models.md)                                                           |
| [google_organization](docs/resources/google_organization.md)                                                         | [google_organizations](docs/resources/google_organizations.md)                                                                 |
| [google_organization_iam_binding](docs/resources/google_organization_iam_binding.md)                                 | No Plural Resource                                                                                                             |
| [google_organization_iam_policy](docs/resources/google_organization_iam_policy.md)                                   | No Plural Resource                                                                                                             |
| [google_organization_policy](docs/resources/google_organization_policy.md)                                           | No Plural Resource                                                                                                             |
| [google_project](docs/resources/google_project.md)                                                                   | [google_projects](docs/resources/google_projects.md)                                                                           |
| [google_project_alert_policy](docs/resources/google_project_alert_policy.md)                                         | [google_project_alert_policies](docs/resources/google_project_alert_policies.md)                                               |
| [google_project_alert_policy_condition](docs/resources/google_project_alert_policy_condition.md)                     | No Plural Resource                                                                                                             |
| [google_project_iam_binding](docs/resources/google_project_iam_binding.md)                                           | [google_project_iam_bindings](docs/resources/google_project_iam_bindings.md)                                                   |
| [google_project_iam_custom_role](docs/resources/google_project_iam_custom_role.md)                                   | [google_project_iam_custom_roles](docs/resources/google_project_iam_custom_roles.md)                                           |
| [google_project_iam_policy](docs/resources/google_project_iam_policy.md)                                             | No Plural Resource                                                                                                             |
| [google_project_logging_audit_config](docs/resources/google_project_logging_audit_config.md)                         | No Plural Resource                                                                                                             |
| [google_project_metric](docs/resources/google_project_metric.md)                                                     | [google_project_metrics](docs/resources/google_project_metrics.md)                                                             |
| [google_project_service](docs/resources/google_project_service.md)                                                   | [google_project_services](docs/resources/google_project_services.md)                                                           |
| [google_pubsub_subscription](docs/resources/google_pubsub_subscription.md)                                           | [google_pubsub_subscriptions](docs/resources/google_pubsub_subscriptions.md)                                                   |
| [google_pubsub_subscription_iam_binding](docs/resources/google_pubsub_subscription_iam_binding.md)                   | No Plural Resource                                                                                                             |
| [google_pubsub_subscription_iam_policy](docs/resources/google_pubsub_subscription_iam_policy.md)                     | No Plural Resource                                                                                                             |
| [google_pubsub_topic](docs/resources/google_pubsub_topic.md)                                                         | [google_pubsub_topics](docs/resources/google_pubsub_topics.md)                                                                 |
| [google_pubsub_topic_iam_binding](docs/resources/google_pubsub_topic_iam_binding.md)                                 | No Plural Resource                                                                                                             |
| [google_pubsub_topic_iam_policy](docs/resources/google_pubsub_topic_iam_policy.md)                                   | No Plural Resource                                                                                                             |
| [google_redis_instance](docs/resources/google_redis_instance.md)                                                     | [google_redis_instances](docs/resources/google_redis_instances.md)                                                             |
| [google_resourcemanager_folder](docs/resources/google_resourcemanager_folder.md)                                     | [google_resourcemanager_folders](docs/resources/google_resourcemanager_folders.md)                                             |
| [google_resourcemanager_folder_iam_binding](docs/resources/google_resourcemanager_folder_iam_binding.md)             | No Plural Resource                                                                                                             |
| [google_resourcemanager_folder_iam_policy](docs/resources/google_resourcemanager_folder_iam_policy.md)               | No Plural Resource                                                                                                             |
| [google_runtime_config_config](docs/resources/google_runtime_config_config.md)                                       | [google_runtime_config_configs](docs/resources/google_runtime_config_configs.md)                                               |
| [google_runtime_config_config_iam_binding](docs/resources/google_runtime_config_config_iam_binding.md)               | No Plural Resource                                                                                                             |
| [google_runtime_config_config_iam_policy](docs/resources/google_runtime_config_config_iam_policy.md)                 | No Plural Resource                                                                                                             |
| [google_runtime_config_variable](docs/resources/google_runtime_config_variable.md)                                   | [google_runtime_config_variables](docs/resources/google_runtime_config_variables.md)                                           |
| [google_secret_manager_secret](docs/resources/google_secret_manager_secret.md)                           | [google_secret_manager_secrets](docs/resources/google_secret_manager_secrets.md)             |
| [google_service_account](docs/resources/google_service_account.md)                                                   | [google_service_accounts](docs/resources/google_service_accounts.md)                                                           |
| No Singular Resource                                                    | [google_service_networking_service_connections](docs/resources/google_service_networking_service_connections.md)                                                           |
| [google_service_account_key](docs/resources/google_service_account_key.md)                                           | [google_service_account_keys](docs/resources/google_service_account_keys.md)                                                   |
| [google_sourcerepo_repository](docs/resources/google_sourcerepo_repository.md)                                       | [google_sourcerepo_repositories](docs/resources/google_sourcerepo_repositories.md)                                             |
| [google_spanner_database](docs/resources/google_spanner_database.md)                                                 | [google_spanner_databases](docs/resources/google_spanner_databases.md)                                                         |
| [google_spanner_instance](docs/resources/google_spanner_instance.md)                                                 | [google_spanner_instances](docs/resources/google_spanner_instances.md)                                                         |
| [google_spanner_instance_iam_binding](docs/resources/google_spanner_instance_iam_binding.md)                         | No Plural Resource                                                                                                             |
| [google_spanner_instance_iam_policy](docs/resources/google_spanner_instance_iam_policy.md)                           | No Plural Resource                                                                                                             |
| [google_sql_connect](docs/resources/google_sql_connect.md)                                                           | No Plural Resource                                                                                                             |
| [google_sql_database](docs/resources/google_sql_database.md)                                                         | [google_sql_databases](docs/resources/google_sql_databases.md)                                                                 |
| [google_sql_database_instance](docs/resources/google_sql_database_instance.md)                                       | [google_sql_database_instances](docs/resources/google_sql_database_instances.md)                                               |
| No Singular Resource                                                                                                 | [google_sql_flags](docs/resources/google_sql_flags.md)                                                                         |
| [google_sql_operation](docs/resources/google_sql_operation.md)                                                       | [google_sql_operations](docs/resources/google_sql_operations.md)                                                               |
| [google_sql_ssl_cert](docs/resources/google_sql_ssl_cert.md)                                                         | [google_sql_ssl_certs](docs/resources/google_sql_ssl_certs.md)                                                                 |
| [google_sql_user](docs/resources/google_sql_user.md)                                                                 | [google_sql_users](docs/resources/google_sql_users.md)                                                                         |
| [google_storage_bucket](docs/resources/google_storage_bucket.md)                                                     | [google_storage_buckets](docs/resources/google_storage_buckets.md)                                                             |
| [google_storage_bucket_acl](docs/resources/google_storage_bucket_acl.md)                                             | No Plural Resource                                                                                                             |
| [google_storage_bucket_iam_binding](docs/resources/google_storage_bucket_iam_binding.md)                             | [google_storage_bucket_iam_bindings](docs/resources/google_storage_bucket_iam_bindings.md)                                     |
| [google_storage_bucket_iam_policy](docs/resources/google_storage_bucket_iam_policy.md)                               | No Plural Resource                                                                                                             |
| [google_storage_bucket_object](docs/resources/google_storage_bucket_object.md)                                       | [google_storage_bucket_objects](docs/resources/google_storage_bucket_objects.md)                                               |
| [google_storage_default_object_acl](docs/resources/google_storage_default_object_acl.md)                             | No Plural Resource                                                                                                             |
| [google_storage_object_acl](docs/resources/google_storage_object_acl.md)                                             | No Plural Resource                                                                                                             |
| [google_user](docs/resources/google_user.md)                                                                         | [google_users](docs/resources/google_users.md)                                                                                 |
| [google_vertex_ai_batch_prediction_job](docs/resources/google_vertex_ai_batch_prediction_job.md)                     | [google_vertex_ai_batch_prediction_jobs](docs/resources/google_vertex_ai_batch_prediction_jobs.md)                             |
| [google_vertex_ai_custom_job](docs/resources/google_vertex_ai_custom_job.md)                                         | [google_vertex_ai_custom_jobs](docs/resources/google_vertex_ai_custom_jobs.md)                                                 |
| [google_vertex_ai_dataset](docs/resources/google_vertex_ai_dataset.md)                                               | [google_vertex_ai_datasets](docs/resources/google_vertex_ai_datasets.md)                                                       |
| [google_vertex_ai_datasets_annotation_spec](docs/resources/google_vertex_ai_datasets_annotation_spec.md)                                               | No Plural Resource                                                      |
| No Singular Resource                                              | [google_vertex_ai_datasets_data_items](docs/resources/google_vertex_ai_datasets_data_items.md)                                                       |
| No Singular Resource                                              | [google_vertex_ai_datasets_saved_queries](docs/resources/google_vertex_ai_datasets_saved_queries.md)                                                       |
| [google_vertex_ai_endpoint](docs/resources/google_vertex_ai_endpoint.md)                                             | [google_vertex_ai_endpoints](docs/resources/google_vertex_ai_endpoints.md)                                                     |
| [google_vertex_ai_featurestore](docs/resources/google_vertex_ai_featurestore.md)                           | [google_vertex_ai_featurestores](docs/resources/google_vertex_ai_featurestores.md)             |
| [google_vertex_ai_featurestores_entity_type](docs/resources/google_vertex_ai_featurestores_entity_type.md)                           | [google_vertex_ai_featurestores_entity_types](docs/resources/google_vertex_ai_featurestores_entity_types.md)             |
| [google_vertex_ai_featurestore_entity_type_feature](docs/resources/google_vertex_ai_featurestore_entity_type_feature.md)                           | [google_vertex_ai_featurestore_entity_type_features](docs/resources/google_vertex_ai_featurestore_entity_type_features.md)             |
| [google_vertex_ai_hyperparameter_tuning_job](docs/resources/google_vertex_ai_hyperparameter_tuning_job.md)                                               | [google_vertex_ai_hyperparameter_tuning_jobs](docs/resources/google_vertex_ai_hyperparameter_tuning_jobs.md)                                                       |
| [google_vertex_ai_index_endpoint](docs/resources/google_vertex_ai_index_endpoint.md)                                             | [google_vertex_ai_index_endpoints](docs/resources/google_vertex_ai_index_endpoints.md)                                                     |
| [google_vertex_ai_index](docs/resources/google_vertex_ai_index.md)                                             | [google_vertex_ai_indices](docs/resources/google_vertex_ai_indices.md)                                                     |
| [google_vertex_ai_metadata_store](docs/resources/google_vertex_ai_metadata_store.md)                                             | [google_vertex_ai_metadata_stores](docs/resources/google_vertex_ai_metadata_stores.md)                                                     |
| [google_vertex_ai_metadata_stores_artifact](docs/resources/google_vertex_ai_metadata_stores_artifact.md)                                             | [google_vertex_ai_metadata_stores_artifacts](docs/resources/google_vertex_ai_metadata_stores_artifacts.md)                                                     |
| [google_vertex_ai_metadata_stores_context](docs/resources/google_vertex_ai_metadata_stores_context.md)                                             | [google_vertex_ai_metadata_stores_contexts](docs/resources/google_vertex_ai_metadata_stores_contexts.md)                                                     |
| [google_vertex_ai_metadata_stores_execution](docs/resources/google_vertex_ai_metadata_stores_execution.md)                                             | [google_vertex_ai_metadata_stores_executions](docs/resources/google_vertex_ai_metadata_stores_executions.md)                                                     |
| [google_vertex_ai_metadata_stores_metadata_schema](docs/resources/google_vertex_ai_metadata_stores_metadata_schema.md)                                             | [google_vertex_ai_metadata_stores_metadata_schemas](docs/resources/google_vertex_ai_metadata_stores_metadata_schemas.md)                                                     |
| [google_vertex_ai_model_deployment_monitoring_job](docs/resources/google_vertex_ai_model_deployment_monitoring_job.md)                           | [google_vertex_ai_model_deployment_monitoring_jobs](docs/resources/google_vertex_ai_model_deployment_monitoring_jobs.md)             |
| [google_vertex_ai_model](docs/resources/google_vertex_ai_model.md)                                                                         | [google_vertex_ai_models](docs/resources/google_vertex_ai_models.md)                                                                                 |
| [google_vertex_ai_models_evaluation](docs/resources/google_vertex_ai_models_evaluation.md)                           | [google_vertex_ai_models_evaluations](docs/resources/google_vertex_ai_models_evaluations.md)             |
| [google_vertex_ai_models_evaluation_slice](docs/resources/google_vertex_ai_model_evaluation_slice.md)                           | [google_vertex_ai_models_evaluation_slices](docs/resources/google_vertex_ai_model_evaluation_slices.md)             |
| [google_vertex_ai_nas_job](docs/resources/google_vertex_ai_nas_job.md)                                               | [google_vertex_ai_nas_jobs](docs/resources/google_vertex_ai_nas_jobs.md)                                                       |
| [google_vertex_ai_nas_jobs_nas_trial_detail](docs/resources/google_vertex_ai_nas_jobs_nas_trial_detail.md)                                               | [google_vertex_ai_nas_jobs_nas_trial_details](docs/resources/google_vertex_ai_nas_jobs_nas_trial_details.md)                                                       |
| [google_vertex_ai_pipeline_job](docs/resources/google_vertex_ai_pipeline_job.md)                                     | [google_vertex_ai_pipeline_jobs](docs/resources/google_vertex_ai_pipeline_jobs.md)                                   |
| [google_vertex_ai_schedule](docs/resources/google_vertex_ai_schedule.md)                                             | [google_vertex_ai_schedules](docs/resources/google_vertex_ai_schedules.md)                                   |
| [google_vertex_ai_study](docs/resources/google_vertex_ai_study.md)                           | [google_vertex_ai_studies](docs/resources/google_vertex_ai_studies.md)             |
| [google_vertex_ai_studies_trial](docs/resources/google_vertex_ai_studies_trial.md)                           | [google_vertex_ai_studies_trials](docs/resources/google_vertex_ai_studies_trials.md)             |
| [google_vertex_ai_tensorboard](docs/resources/google_vertex_ai_tensorboard.md)                                       | [google_vertex_ai_tensorboards](docs/resources/google_vertex_ai_tensorboards.md)                                   |
| [google_vertex_ai_tensorboards_experiment](docs/resources/google_vertex_ai_tensorboards_experiment.md)                                       | [google_vertex_ai_tensorboards_experiments](docs/resources/google_vertex_ai_tensorboards_experiments.md)                                   |
| [google_vertex_ai_tensorboard_experiment_run](docs/resources/google_vertex_ai_tensorboard_experiment_run.md)                                       | [google_vertex_ai_tensorboard_experiment_runs](docs/resources/google_vertex_ai_tensorboard_experiment_runs.md)                                   |
| [google_vertex_ai_tensorboard_experiment_run_time_series_resource](docs/resources/google_vertex_ai_tensorboard_experiment_run_time_series_resource.md)                                       | [google_vertex_ai_tensorboard_experiment_run_time_series_resources](docs/resources/google_vertex_ai_tensorboard_experiment_run_time_series_resources.md)                                   |
| [google_vertex_ai_training_pipeline](docs/resources/google_vertex_ai_training_pipeline.md)                           | [google_vertex_ai_training_pipelines](docs/resources/google_vertex_ai_training_pipelines.md)             |

## Examples

### Check SSH is Disabled for INGRESS across all GCP Projects

We use several plural resources for this example that loops across all projects and firewall rules.  Making use of a plural resource property, we filter firewall rules for direction 'INGRESS' :

```
title 'Loop over all GCP projects and look at firewalls in INGRESS direction'

control 'gcp-projects-firewalls-loop-1.0' do

  impact 1.0
  title 'Ensure INGRESS firewalls in all projects have the correct properties using google_compute_firewall for detail.'

  google_projects.project_names.each do |project_name|
    google_compute_firewalls(project: project_name).where(firewall_direction: 'INGRESS').firewall_names.each do |firewall_name|
      describe google_compute_firewall(project: project_name, name: firewall_name) do
        its('allowed_ssh?')  { should be false }
      end
    end
  end
end
```

This example assumes there are sufficient privileges to list all GCP projects.

### Check that a particular label exists on all VMs across all projects and zones

This check ensures that VMs have label `must_be_there` for each project:
```
title 'Loop over all GCP projects and ensure all VMs have a particular label'

control 'gcp-projects-zones-vm-label-loop-1.0' do

  impact 1.0
  title 'Ensure all VMs have must_be_there label key set'

  google_projects.project_names.each do |project_name|
    google_compute_zones(project: project_name).zone_names.each do |zone_name|
      google_compute_instances(project: project_name, zone: zone_name).instance_names.each do |instance_name|
        describe google_compute_instance(project: project_name, zone: zone_name, name: instance_name) do
          its('labels_keys') { should include 'must_be_there' }
        end
      end
    end
  end
end
```
This example verifies there are sufficient privileges to list all regions.

```
next unless google_compute_regions(project: gcp_project_id).resource_failed?
google_compute_regions(project: gcp_project_id).region_names.each do |region_name|
  describe google_compute_region(project: gcp_project_id,  region: region_name) do
    it { should be_up }
  end
end

if google_compute_regions(project: gcp_project_id).resource_failed?
  puts google_compute_regions(project: gcp_project_id).resource_exception_message
  puts google_compute_regions(project: gcp_project_id,name: region_name).pretty_inspect
end
```



This example assumes there are sufficient privileges to list all GCP projects.


## Test inspec-gcp resources

1. Create a new GCP project
2. Ensure this is currently set following: https://cloud.google.com/shell/docs/examples
```bash
$ gcloud config set project <project-name>
$ gcloud config list project
```
3. Enable billing for your new project
4. Enable various services necessary to run the tests:
```bash
$ gcloud services enable compute.googleapis.com \
    sourcerepo.googleapis.com \
    dns.googleapis.com \
    container.googleapis.com \
    cloudkms.googleapis.com \
    cloudbuild.googleapis.com
```

5. Environment variables can be used to specify project details e.g.
```bash
export GCP_PROJECT_NAME=<project-name>
export GCP_PROJECT_NUMBER=<project-number>
export GCP_PROJECT_ID=<project-id>
```

Some resources require elevated privileges to create in GCP.  These are disabled by default but can be activated via:
```bash
export GCP_ENABLE_PRIVILEGED_RESOURCES=1
```
This takes effect during the "plan" task as described in the next section.  Affected terraform resources are included/excluded and associated inspec tests enabled/disabled accordingly.

The resource pack defaults to region `europe-west2`.  If a different region is desired e.g. `us-central1`, the following variables should be set:
```bash
export GCP_LOCATION="us-central1"
export GCP_ZONE="us-central1-a"
export GCP_LB_REGION="us-central1"
export GCP_LB_ZONE="us-central1-a"
export GCP_LB_ZONE_MIG2="us-central1-b"
export GCP_LB_ZONE_MIG3="us-central1-c"
export GCP_KUBE_CLUSTER_ZONE="us-central1-a"
export GCP_KUBE_CLUSTER_ZONE_EXTRA1="us-central1-b"
export GCP_KUBE_CLUSTER_ZONE_EXTRA2="us-central1-c"
export GCP_CLOUD_FUNCTION_REGION="us-central1"
```

Other regions can be targeted by updating the above.  For example, see [https://cloud.google.com/compute/docs/regions-zones/](https://cloud.google.com/compute/docs/regions-zones/) for suitable values.

6. Ensure the `In-use IP addresses` [quota](https://console.cloud.google.com/iam-admin/quotas) is set to 20 or above for chosen region

7. Run the integration tests via:
```bash
bundle install && bundle exec rake test:integration
```

Alternatively, finer grained rake tasks are also available.  Executing these in order is the same as the above command:
* Initialize local workspace (terraform init)
``` bash
bundle exec rake test:init_workspace
```
* Plan integration tests - ensures variables are set for Inspec and Terraform, runs "terraform plan"
``` bash
bundle exec rake test:plan_integration_tests
```
* Set up integration tests - actually creates the resources in GCP (terraform apply)
``` bash
bundle exec rake test:setup_integration_tests
```
* Run integration tests - runs the tests (inspec exec)
``` bash
bundle exec rake test:run_integration_tests
```
* Clean up integration tests - removes GCP resources (terraform destroy)
``` bash
bundle exec rake test:cleanup_integration_tests
```

## Further Reading

* [Introduction to InSpec GCP](https://lollyrock.com/articles/inspec-cloud-gcp-setup/)
* [InSpec GCP Deep Dive](https://www.chef.io/blog/inspec-gcp-deep-dive)

## FAQ

### Failure running "inspec exec" on my GCP profile

If an error such as the below occurs when running "inspec exec" on a newly created GCP profile:
```
libraries/google_compute_instance.rb:26:in `block in initialize': undefined method `gcp_compute_client' for #<Train::Transports::Local::Connection:0x00007fcasdf1a532d0> (NoMethodError)
```
Check that the GCP transport is being specified as below:
```
$ inspec exec . -t gcp://
```
This tells the underlying transport layer (train) to use GCP.

### `access not configured` error

InSpec relies on the GCP API's to verify the settings. Therefore, it requires access to the API. If you try to access an API via an InSpec resource that is not enabled in your account, then you see an error like:

```
googleapi: Error 403: Access Not Configured. Compute Engine API has not been used in project 41111111111 before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/compute.googleapis.com/overview then retry.
```

### Quota increase

The terraform templates generate sufficient resources to require an increase to default in_use IP addresses. Normally new projects have 10, increasing this to 20 or higher should be sufficient.

To find this setting, log in to the GCP web interface and go to **IAM and admin->Quotas** and look for "Compute Engine API In-use IP addresses".  From here you can "Edit quotas" to request more.
```
Changed Quota:
+----------------------+------------------+
| Region: europe-west2 | IN_USE_ADDRESSES |
+----------------------+------------------+
|       Changes        |     8 -> 64      |
+----------------------+------------------+
```

### Errors on terraform destroy

Sometimes there can be occasional errors when performing the cleanup rake task. This happens when resources are already deleted and can be ignored.

## Upgrading to version 1.0

A guide on upgrading to version 1.0 can be found [here](docs/version_1_upgrade.md)

## Support

The InSpec GCP resources are community supported. For bugs and features, please open a github issue and label it appropriately.

## Kudos

This implementation is inspired by [inspec-azure](https://github.com/chef/inspec-azure) and [inspec-gcp](https://github.com/martezr/inspec-gcp)
