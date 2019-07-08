# InSpec GCP (Google Cloud Platform) Resource Pack

* **Project State: Maintained**

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
$ gcloud auth application-default login
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

The json credential file for a service account looks like this:
```bash
$ cat /Users/john/.config/gcloud/myproject-1-feb7993e8660.json
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

And InSpec can be instructed to use it by setting this ENV variable prior to running `inspec exec`:
```bash
$ export GOOGLE_APPLICATION_CREDENTIALS='/Users/john/.config/gcloud/myproject-1-feb7993e8660.json'
```

### Enable the appropriate APIs that you want to use:

- [Enable Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/)
- [Enable Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com)

## Use the resources

Since this is an InSpec resource pack, it only defines InSpec resources. It includes example tests only. To easily use the GCP resources in your tests do the following:

###  Create a new profile for GCP

```bash
$ inspec init profile --platform gcp my-profile
Create new profile at /Users/spaterson/my-profile
 * Create directory libraries
 * Create file README.md
 * Create directory controls
 * Create file controls/example.rb
 * Create file inspec.yml
 * Create file attributes.yml
 * Create file libraries/.gitkeep 
 
```

### Update `attributes.yml` to point to your project

```
gcp_project_id: 'my-gcp-project'
```

## Run the tests

```
$ cd my-profile/
$ inspec exec . -t gcp:// --attrs attributes.yml

Profile: GCP InSpec Profile (my-profile)
Version: 0.1.0
Target:  gcp://local-service-account@my-gcp-project.iam.gserviceaccount.com

  ✔  gcp-single-region-1.0: Ensure single region has the correct properties.
     ✔  Region europe-west2 zone_names should include "europe-west2-a"
  ✔  gcp-regions-loop-1.0: Ensure regions have the correct properties in bulk.
     ✔  Region asia-east1 should be up
     ✔  Region asia-northeast1 should be up
     ✔  Region asia-south1 should be up
     ✔  Region asia-southeast1 should be up
     ✔  Region australia-southeast1 should be up
     ✔  Region europe-north1 should be up
     ✔  Region europe-west1 should be up
     ✔  Region europe-west2 should be up
     ✔  Region europe-west3 should be up
     ✔  Region europe-west4 should be up
     ✔  Region northamerica-northeast1 should be up
     ✔  Region southamerica-east1 should be up
     ✔  Region us-central1 should be up
     ✔  Region us-east1 should be up
     ✔  Region us-east4 should be up
     ✔  Region us-west1 should be up
     ✔  Region us-west2 should be up


Profile: Google Cloud Platform Resource Pack (inspec-gcp)
Version: 0.5.0
Target:  gcp://local-service-account@my-gcp-project.iam.gserviceaccount.com

     No tests executed.

Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 18 successful, 0 failures, 0 skipped
```

The generated `inspec.yml` file automatically points to the InSpec GCP resource pack:

```yaml
name: my-profile
title: My GCP InSpec Profile
version: 0.1.0
inspec_version: '>= 2.2.10'
depends:
  - name: inspec-gcp
    url: https://github.com/inspec/inspec-gcp/archive/master.tar.gz
supports:
  - platform: gcp
```


## Resource documentation

The following resources are available in the InSpec GCP Profile

| InSpec GCP Supported Resources| [https://www.inspec.io/docs/reference/resources/#gcp-resources](https://www.inspec.io/docs/reference/resources/#gcp-resources) |
|:---|:---|
| [google_bigquery_dataset](docs/resources/google_bigquery_dataset.md) |  [google_bigquery_datasets](docs/resources/google_bigquery_datasets.md) |
| [google_bigquery_table](docs/resources/google_bigquery_table.md) |  [google_bigquery_tables](docs/resources/google_bigquery_tables.md) |
| [google_cloudbuild_trigger](docs/resources/google_cloudbuild_trigger.md) |  [google_cloudbuild_triggers](docs/resources/google_cloudbuild_triggers.md) |
| [google_compute_address](docs/resources/google_compute_address.md) |  [google_compute_autoscaler](docs/resources/google_compute_autoscaler.md) |
| [google_compute_autoscalers](docs/resources/google_compute_autoscalers.md) |  [google_compute_backend_service](docs/resources/google_compute_backend_service.md) |
| [google_compute_backend_services](docs/resources/google_compute_backend_services.md) |  [google_compute_disk](docs/resources/google_compute_disk.md) |
| [google_compute_disks](docs/resources/google_compute_disks.md) |  [google_compute_firewall](docs/resources/google_compute_firewall.md) |
| [google_compute_firewalls](docs/resources/google_compute_firewalls.md) |  [google_compute_forwarding_rule](docs/resources/google_compute_forwarding_rule.md) |
| [google_compute_forwarding_rules](docs/resources/google_compute_forwarding_rules.md) |  [google_compute_global_address](docs/resources/google_compute_global_address.md) |
| [google_compute_global_addresses](docs/resources/google_compute_global_addresses.md) |  [google_compute_global_forwarding_rule](docs/resources/google_compute_global_forwarding_rule.md) |
| [google_compute_global_forwarding_rules](docs/resources/google_compute_global_forwarding_rules.md) |  [google_compute_health_check](docs/resources/google_compute_health_check.md) |
| [google_compute_health_checks](docs/resources/google_compute_health_checks.md) |  [google_compute_http_health_check](docs/resources/google_compute_http_health_check.md) |
| [google_compute_http_health_checks](docs/resources/google_compute_http_health_checks.md) |  [google_compute_https_health_check](docs/resources/google_compute_https_health_check.md) |
| [google_compute_https_health_checks](docs/resources/google_compute_https_health_checks.md) |  [google_compute_image](docs/resources/google_compute_image.md) |
| [google_compute_instance](docs/resources/google_compute_instance.md) |  [google_compute_instance_group](docs/resources/google_compute_instance_group.md) |
| [google_compute_instance_group_manager](docs/resources/google_compute_instance_group_manager.md) |  [google_compute_instance_group_managers](docs/resources/google_compute_instance_group_managers.md) |
| [google_compute_instance_groups](docs/resources/google_compute_instance_groups.md) |  [google_compute_instance_template](docs/resources/google_compute_instance_template.md) |
| [google_compute_instance_templates](docs/resources/google_compute_instance_templates.md) |  [google_compute_instances](docs/resources/google_compute_instances.md) |
| [google_compute_network](docs/resources/google_compute_network.md) |  [google_compute_networks](docs/resources/google_compute_networks.md) |
| [google_compute_project_info](docs/resources/google_compute_project_info.md) |  [google_compute_region](docs/resources/google_compute_region.md) |
| [google_compute_region_instance_group_manager](docs/resources/google_compute_region_instance_group_manager.md) |  [google_compute_region_instance_group_managers](docs/resources/google_compute_region_instance_group_managers.md) |
| [google_compute_regions](docs/resources/google_compute_regions.md) |  [google_compute_route](docs/resources/google_compute_route.md) |
| [google_compute_router](docs/resources/google_compute_router.md) |  [google_compute_routers](docs/resources/google_compute_routers.md) |
| [google_compute_routes](docs/resources/google_compute_routes.md) |  [google_compute_snapshot](docs/resources/google_compute_snapshot.md) |
| [google_compute_snapshots](docs/resources/google_compute_snapshots.md) |  [google_compute_ssl_certificate](docs/resources/google_compute_ssl_certificate.md) |
| [google_compute_ssl_certificates](docs/resources/google_compute_ssl_certificates.md) |  [google_compute_ssl_policies](docs/resources/google_compute_ssl_policies.md) |
| [google_compute_ssl_policy](docs/resources/google_compute_ssl_policy.md) |  [google_compute_subnetwork](docs/resources/google_compute_subnetwork.md) |
| [google_compute_subnetworks](docs/resources/google_compute_subnetworks.md) |  [google_compute_target_http_proxies](docs/resources/google_compute_target_http_proxies.md) |
| [google_compute_target_http_proxy](docs/resources/google_compute_target_http_proxy.md) |  [google_compute_target_https_proxies](docs/resources/google_compute_target_https_proxies.md) |
| [google_compute_target_https_proxy](docs/resources/google_compute_target_https_proxy.md) |  [google_compute_target_pool](docs/resources/google_compute_target_pool.md) |
| [google_compute_target_pools](docs/resources/google_compute_target_pools.md) |  [google_compute_target_tcp_proxies](docs/resources/google_compute_target_tcp_proxies.md) |
| [google_compute_target_tcp_proxy](docs/resources/google_compute_target_tcp_proxy.md) |  [google_compute_url_map](docs/resources/google_compute_url_map.md) |
| [google_compute_url_maps](docs/resources/google_compute_url_maps.md) |  [google_compute_vpn_tunnel](docs/resources/google_compute_vpn_tunnel.md) |
| [google_compute_vpn_tunnels](docs/resources/google_compute_vpn_tunnels.md) |  [google_compute_zone](docs/resources/google_compute_zone.md) |
| [google_compute_zones](docs/resources/google_compute_zones.md) |  [google_container_cluster](docs/resources/google_container_cluster.md) |
| [google_container_clusters](docs/resources/google_container_clusters.md) |  [google_container_node_pool](docs/resources/google_container_node_pool.md) |
| [google_container_node_pools](docs/resources/google_container_node_pools.md) |  [google_container_regional_cluster](docs/resources/google_container_regional_cluster.md) |
| [google_container_regional_clusters](docs/resources/google_container_regional_clusters.md) |  [google_dns_managed_zone](docs/resources/google_dns_managed_zone.md) |
| [google_dns_managed_zones](docs/resources/google_dns_managed_zones.md) |  [google_dns_resource_record_set](docs/resources/google_dns_resource_record_set.md) |
| [google_dns_resource_record_sets](docs/resources/google_dns_resource_record_sets.md) |  [google_kms_crypto_key](docs/resources/google_kms_crypto_key.md) |
| [google_kms_crypto_key_iam_binding](docs/resources/google_kms_crypto_key_iam_binding.md) |  [google_kms_crypto_key_iam_bindings](docs/resources/google_kms_crypto_key_iam_bindings.md) |
| [google_kms_crypto_keys](docs/resources/google_kms_crypto_keys.md) |  [google_kms_key_ring](docs/resources/google_kms_key_ring.md) |
| [google_kms_key_ring_iam_binding](docs/resources/google_kms_key_ring_iam_binding.md) |  [google_kms_key_ring_iam_bindings](docs/resources/google_kms_key_ring_iam_bindings.md) |
| [google_kms_key_rings](docs/resources/google_kms_key_rings.md) |  [google_logging_project_exclusion](docs/resources/google_logging_project_exclusion.md) |
| [google_logging_project_sink](docs/resources/google_logging_project_sink.md) |  [google_logging_project_sinks](docs/resources/google_logging_project_sinks.md) |
| [google_organization](docs/resources/google_organization.md) |  [google_organizations](docs/resources/google_organizations.md) |
| [google_project](docs/resources/google_project.md) |  [google_project_alert_policies](docs/resources/google_project_alert_policies.md) |
| [google_project_alert_policy](docs/resources/google_project_alert_policy.md) |  [google_project_alert_policy_condition](docs/resources/google_project_alert_policy_condition.md) |
| [google_project_iam_binding](docs/resources/google_project_iam_binding.md) |  [google_project_iam_bindings](docs/resources/google_project_iam_bindings.md) |
| [google_project_iam_custom_role](docs/resources/google_project_iam_custom_role.md) |  [google_project_logging_audit_config](docs/resources/google_project_logging_audit_config.md) |
| [google_project_metric](docs/resources/google_project_metric.md) |  [google_project_metrics](docs/resources/google_project_metrics.md) |
| [google_projects](docs/resources/google_projects.md) |  [google_pubsub_subscription](docs/resources/google_pubsub_subscription.md) |
| [google_pubsub_subscriptions](docs/resources/google_pubsub_subscriptions.md) |  [google_pubsub_topic](docs/resources/google_pubsub_topic.md) |
| [google_pubsub_topics](docs/resources/google_pubsub_topics.md) |  [google_service_account](docs/resources/google_service_account.md) |
| [google_service_account_key](docs/resources/google_service_account_key.md) |  [google_service_account_keys](docs/resources/google_service_account_keys.md) |
| [google_service_accounts](docs/resources/google_service_accounts.md) |  [google_sourcerepo_repositories](docs/resources/google_sourcerepo_repositories.md) |
| [google_sourcerepo_repository](docs/resources/google_sourcerepo_repository.md) |  [google_sql_database_instance](docs/resources/google_sql_database_instance.md) |
| [google_sql_database_instances](docs/resources/google_sql_database_instances.md) |  [google_sql_users](docs/resources/google_sql_users.md) |
| [google_storage_bucket](docs/resources/google_storage_bucket.md) |  [google_storage_bucket_acl](docs/resources/google_storage_bucket_acl.md) |
| [google_storage_bucket_iam_binding](docs/resources/google_storage_bucket_iam_binding.md) |  [google_storage_bucket_iam_bindings](docs/resources/google_storage_bucket_iam_bindings.md) |
| [google_storage_bucket_object](docs/resources/google_storage_bucket_object.md) |  [google_storage_bucket_objects](docs/resources/google_storage_bucket_objects.md) |
| [google_storage_buckets](docs/resources/google_storage_buckets.md) |  [google_storage_default_object_acl](docs/resources/google_storage_default_object_acl.md) |
| [google_storage_object_acl](docs/resources/google_storage_object_acl.md) |  [google_user](docs/resources/google_user.md) |
| [google_users](docs/resources/google_users.md) |   |

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
$ bundle install
$ bundle exec rake test:integration
```

Alternatively, finer grained rake tasks are also available.  Executing these in order is the same as the above command:
  * Initialize local workspace (terraform init)
``` bash
$ bundle exec rake test:init_workspace
```
  * Plan integration tests - ensures variables are set for Inspec and Terraform, runs "terraform plan"
``` bash
$ bundle exec rake test:plan_integration_tests
```
  * Set up integration tests - actually creates the resources in GCP (terraform apply)
``` bash
$ bundle exec rake test:setup_integration_tests
```
  * Run integration tests - runs the tests (inspec exec)
``` bash
$ bundle exec rake test:run_integration_tests
```   
  * Clean up integration tests - removes GCP resources (terraform destroy)
``` bash
$ bundle exec rake test:cleanup_integration_tests
```

## Further Reading

* [Introduction to InSpec GCP](https://lollyrock.com/articles/inspec-cloud-gcp-setup/)
* [InSpec GCP Deep Dive](https://blog.chef.io/2018/06/19/inspec-gcp-deep-dive/)

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

## Support

The InSpec GCP resources are community supported. For bugs and features, please open a github issue and label it appropriately.

## Kudos

This implementation is inspired by [inspec-azure](https://github.com/chef/inspec-azure) and [inspec-gcp](https://github.com/martezr/inspec-gcp)
