+++
title = "google_iam_service_accounts resource"

draft = false


[menu.gcp]
title = "google_iam_service_accounts"
identifier = "inspec/resources/gcp/google_iam_service_accounts resource"
parent = "inspec/resources/gcp"
+++

Use the `google_iam_service_accounts` InSpec audit resource to to test a Google Cloud ServiceAccount resource.

## Examples

```ruby
describe google_iam_service_accounts(project: 'chef-gcp-inspec', name: "display-name@project-id.iam.gserviceaccount.com") do
  its('service_account_emails') { should include "display-name@project-id.iam.gserviceaccount.com" }
  its('count') { should be <= 1000 }
end
```

## Properties

Properties that can be accessed from the `google_iam_service_accounts` resource:

See [google_iam_service_account](google_iam_service_account) for more detailed information.

  * `service_account_names`: an array of `google_iam_service_account` name
  * `project_ids`: an array of `google_iam_service_account` project_id
  * `service_account_ids`: an array of `google_iam_service_account` unique_id
  * `service_account_emails`: an array of `google_iam_service_account` email
  * `service_account_display_names`: an array of `google_iam_service_account` display_name
  * `oauth2_client_ids`: an array of `google_iam_service_account` oauth2_client_id

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the current project.
