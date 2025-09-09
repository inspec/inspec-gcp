+++
title = "google_resourcemanager_folders resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_resourcemanager_folders"
identifier = "inspec/resources/gcp/google_resourcemanager_folders Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_resourcemanager_folders` InSpec audit resource to to test a Google Cloud Folder resource.

## Examples

```ruby
describe.one do
  google_resourcemanager_folders(parent: 'organizations/12345').display_names.each do |display_name|
    describe display_name do
      it { should eq 'inspec-gcp-folder' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_resourcemanager_folders` resource:

See [google_resourcemanager_folder](google_resourcemanager_folder) for more detailed information.

  * `names`: an array of `google_resourcemanager_folder` name
  * `lifecycle_states`: an array of `google_resourcemanager_folder` lifecycle_state
  * `create_times`: an array of `google_resourcemanager_folder` create_time
  * `parents`: an array of `google_resourcemanager_folder` parent
  * `display_names`: an array of `google_resourcemanager_folder` display_name

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
