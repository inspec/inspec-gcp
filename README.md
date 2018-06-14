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
```

```yaml
name: my-profile
title: My own Oneview profile
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

- [google_project_iam_custom_role](docs/resources/google_project_iam_custom_role.md)
- [google_compute_instance](docs/resources/google_compute_instance.md)
- [google_service_account](docs/resources/google_service_account.md)
- [google_container_cluster](docs/resources/google_container_cluster.md)
- [google_compute_firewalls](docs/resources/google_compute_firewalls.md)
- [google_project](docs/resources/google_project.md)
- [google_compute_address](docs/resources/google_compute_address.md)
- [google_compute_firewall](docs/resources/google_compute_firewall.md)
- [google_compute_image](docs/resources/google_compute_image.md)
- [google_compute_instance_group](docs/resources/google_compute_instance_group.md)
- [google_compute_zones](docs/resources/google_compute_zones.md)
- [google_compute_zone](docs/resources/google_compute_zone.md)
- [google_compute_instances](docs/resources/google_compute_instances.md)
- [google_storage_bucket](docs/resources/google_storage_bucket.md)
- [google_container_node_pool](docs/resources/google_container_node_pool.md)

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