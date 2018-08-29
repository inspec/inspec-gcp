# InSpec GCP (Google Cloud Platform) Resource Pack

This InSpec resource pack uses the native Google Cloud Platform (GCP) support in InSpec and provides the required resources to write tests for GCP.

This implementation was inspired on the ideas by [Martez Reed](https://github.com/martezr/inspec-gcp).

## Prerequisites

1. *Install and configure the Google cloud SDK*

Download the [SDK](https://cloud.google.com/sdk/docs/) and run the installation:
```
./google-cloud-sdk/install.sh
```

2. Create credentials file via:
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
3. Enable the appropriate APIs that you want to use:

- [Enable Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/)
- [Enable Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com)

## Use the resources

Since this is an InSpec resource pack, it only defines InSpec resources. It includes example tests only. To easily use the GCP resources in your tests do the following:

### Create a new profile

```bash
$ inspec init profile my-profile
Create new profile at /Users/skpaterson/my-profile
 * Create directory libraries
 * Create file README.md
 * Create directory controls
 * Create file controls/example.rb
 * Create file inspec.yml
 * Create file libraries/.gitkeep
```

Now update the default `inspec.yml` file to point to the InSpec GCP resource pack:

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

- [google_compute_address](docs/resources/google_compute_address.md)
- [google_compute_firewall](docs/resources/google_compute_firewall.md)
- [google_compute_firewalls](docs/resources/google_compute_firewalls.md)
- [google_compute_image](docs/resources/google_compute_image.md)
- [google_compute_instance](docs/resources/google_compute_instance.md)
- [google_compute_instance_group](docs/resources/google_compute_instance_group.md)
- [google_compute_instance_groups](docs/resources/google_compute_instance_groups.md)
- [google_compute_instances](docs/resources/google_compute_instances.md)
- [google_compute_network](docs/resources/google_compute_network.md)
- [google_compute_networks](docs/resources/google_compute_networks.md)
- [google_compute_region](docs/resources/google_compute_region.md)
- [google_compute_regions](docs/resources/google_compute_regions.md)
- [google_compute_subnetwork](docs/resources/google_compute_subnetwork.md)
- [google_compute_subnetworks](docs/resources/google_compute_subnetworks.md)
- [google_compute_zone](docs/resources/google_compute_zone.md)
- [google_compute_zones](docs/resources/google_compute_zones.md)
- [google_container_cluster](docs/resources/google_container_cluster.md)
- [google_container_clusters](docs/resources/google_container_clusters.md)
- [google_container_node_pool](docs/resources/google_container_node_pool.md)
- [google_container_node_pools](docs/resources/google_container_node_pools.md)
- [google_kms_crypto_key](docs/resources/google_kms_crypto_key.md)
- [google_kms_crypto_key_iam_binding](docs/resources/google_kms_crypto_key_iam_binding.md)
- [google_kms_crypto_key_iam_bindings](docs/resources/google_kms_crypto_key_iam_bindings.md)
- [google_kms_crypto_keys](docs/resources/google_kms_crypto_keys.md)
- [google_kms_key_ring](docs/resources/google_kms_key_ring.md)
- [google_kms_key_ring_iam_binding](docs/resources/google_kms_key_ring_iam_binding.md)
- [google_kms_key_ring_iam_bindings](docs/resources/google_kms_key_ring_iam_bindings.md)
- [google_kms_key_rings](docs/resources/google_kms_key_rings.md)
- [google_logging_project_exclusion](docs/resources/google_logging_project_exclusion.md)
- [google_logging_project_sink](docs/resources/google_logging_project_sink.md)
- [google_project](docs/resources/google_project.md)
- [google_project_iam_binding](docs/resources/google_project_iam_binding.md)
- [google_project_iam_bindings](docs/resources/google_project_iam_bindings.md)
- [google_project_iam_custom_role](docs/resources/google_project_iam_custom_role.md)
- [google_projects](docs/resources/google_projects.md)
- [google_service_account](docs/resources/google_service_account.md)
- [google_service_account_key](docs/resources/google_service_account_key.md)
- [google_service_account_keys](docs/resources/google_service_account_keys.md)
- [google_service_accounts](docs/resources/google_service_accounts.md)
- [google_storage_bucket](docs/resources/google_storage_bucket.md)
- [google_storage_bucket_acl](docs/resources/google_storage_bucket_acl.md)
- [google_storage_bucket_iam_binding](docs/resources/google_storage_bucket_iam_binding.md)
- [google_storage_bucket_iam_bindings](docs/resources/google_storage_bucket_iam_bindings.md)
- [google_storage_bucket_object](docs/resources/google_storage_bucket_object.md)
- [google_storage_buckets](docs/resources/google_storage_buckets.md)
- [google_storage_default_object_acl](docs/resources/google_storage_default_object_acl.md)
- [google_storage_object_acl](docs/resources/google_storage_object_acl.md)


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
3. Ensure the `In-use IP addresses` [quota](https://console.cloud.google.com/iam-admin/quotas) is set to 20 or above

4. Environment variables can be used to specify project details e.g.
```bash
export GCP_PROJECT_NAME=<project-name>
export GCP_PROJECT_NUMBER=<project-number>
export GCP_PROJECT_ID=<project-id>
export GCP_LOCATION=<region, defaults to europe-west2>
export GCP_ZONE=<zone, defaults to europe-west2-a>
```

Some resources require elevated privileges to create in GCP.  These are disabled by default but can be activated via:
```bash
export GCP_ENABLE_PRIVILEGED_RESOURCES=1
```
This takes effect during the "plan" task as described in the next section.  Affected terraform resources are included/excluded and associated inspec tests enabled/disabled accordingly.

4. Run the integration tests via:

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