+++
title = "google_organizations resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_organizations"
identifier = "inspec/resources/gcp/google_organizations resource"
parent = "inspec/resources/gcp"
+++

Use the `google_organizations` InSpec audit resource to to test a Google Cloud Organization resource.

## Examples

```ruby
describe google_organizations do
  its('names') { should include "organizations/123456" }
end
```

### Test that there are no more than a specified number of organizations available

    describe google_organizations do
      its('count') { should be <= 100}
    end

### Test that an expected organization name is available

    describe google_organizations do
      its('names') { should include "organization/1234" }
    end

### Test that an expected organization display name is available

    describe google_organizations do
      its('display_names') { should include "google.com" }
    end
    
### Test that all organizations are ACTIVE

    describe google_organizations do
      its('lifecycle_state'){ should eq 'ACTIVE' }
    end    

### Test that a particular subset of ACTIVE organizations with display name 'goog*' exist

    google_organizations.where(display_name: /^goog/, lifecycle_state: 'ACTIVE').names.each do |name|
      describe google_organization(name: name) do
        it { should exist }
      end
    end

## Properties

Properties that can be accessed from the `google_organizations` resource:

See [google_organization](google_organization) for more detailed information.

  * `names`: an array of `google_organization` name
  * `display_names`: an array of `google_organization` display_name
  * `lifecycle_states`: an array of `google_organization` lifecycle_state
  * `creation_times`: an array of `google_organization` creation_time
  * `owners`: an array of `google_organization` owner

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
