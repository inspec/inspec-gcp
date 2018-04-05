# chef-inspec-gcp

Initial prototyping based on inspec-gcp and inspec-azure archived repository.

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
3. Create GCP project and ensure this is currently set following: https://cloud.google.com/shell/docs/examples
```bash
$ gcloud config set project <project-name>
$ gcloud config list project
```

4. Environment variables can be used to specify project details e.g.
```bash
export GCP_PROJECT_NAME=<project-name>
export GCP_PROJECT_NUMBER=<project-number>
export GCP_PROJECT_ID=<project-id>
export GCP_LOCATION=<region, defaults to europe-west2>
export GCP_ZONE=<zone, defaults to europe-west2-a>
```

5. Run the integration tests via:

```bash
$ bundle exec rake test:integration
```
