+++
title = "google_iam_service_account resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_iam_service_account"
identifier = "inspec/resources/gcp/google_iam_service_account resource"
parent = "inspec/resources/gcp"
+++

Use the `google_iam_service_account` InSpec audit resource to to test a Google Cloud ServiceAccount resource.

## Examples

```ruby
describe google_service_account(project: 'chef-gcp-inspec', name: "display-name@project-id.iam.gserviceaccount.com") do
  it { should exist }
  its('display_name') { should cmp '' }
end

describe google_service_account(project: 'chef-gcp-inspec', name: "nonexistent@project-id.iam.gserviceaccount.com") do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_service_account` resource:


  * `name`: The name of the service account.

  * `project_id`: Id of the project that owns the service account.

  * `unique_id`: Unique and stable id of the service account

  * `email`: Email address of the service account.

  * `display_name`: User specified description of service account.

  * `oauth2_client_id`: OAuth2 client id for the service account.


## GCP permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
