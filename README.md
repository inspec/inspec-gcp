# inspec-gcp

Initial prototyping based on inspec-gcp and inspec-azure archived repository.

This builds on work in the following two repos:
* https://github.com/chef/inspec-azure 
* https://github.com/martezr/inspec-gcp

### Prerequisites

1. Install and configure the Google cloud SDK from here:
https://cloud.google.com/sdk/docs/
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
}c
```

### Getting started with inspec-gcp

1. Create GCP project and ensure this is currently set following: https://cloud.google.com/shell/docs/examples
```bash
$ gcloud config set project <project-name>
$ gcloud config list project
```

2. Environment variables can be used to specify project details e.g.
```bash
export GCP_PROJECT_NAME=<project-name>
export GCP_PROJECT_NUMBER=<project-number>
export GCP_PROJECT_ID=<project-id>
export GCP_LOCATION=<region, defaults to europe-west2>
export GCP_ZONE=<zone, defaults to europe-west2-a>
```

3. Run the integration tests via:

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

### Additional notes

#### Quota increase

The terraform templates generate sufficient resources to require an increase to default in_use IP addresses.  Normally new projects have 10, increasing this to 20 or higher should be sufficient.

To find this setting, log in to the GCP web interface and go to **IAM and admin->Quotas** and look for "Compute Engine API In-use IP addresses".  From here you can "Edit quotas" to request more.
```
Changed Quota:
+----------------------+------------------+
| Region: europe-west2 | IN_USE_ADDRESSES |
+----------------------+------------------+
|       Changes        |     8 -> 64      |
+----------------------+------------------+
```

#### Errors on terraform destroy

Sometimes there can be occasional errors when performing the cleanup rake task.  This happens when resources are already deleted and can be ignored.

