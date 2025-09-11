+++
title = "google_sourcerepo_repository resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_sourcerepo_repository"
identifier = "inspec/resources/gcp/google_sourcerepo_repository resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sourcerepo_repository` InSpec audit resource to to test a Google Cloud Repository resource.

## Examples

```ruby
describe google_sourcerepo_repository(project: 'chef-gcp-inspec', name: 'inspec-gcp-repository') do
  it { should exist }
end

describe google_sourcerepo_repository(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_sourcerepo_repository` resource:


  * `name`: Resource name of the repository, of the form projects/{{project}}/repos/{{repo}}. The repo name may contain slashes. eg, projects/myproject/repos/name/with/slash

  * `url`: URL to clone the repository from Google Cloud Source Repositories.

  * `size`: The disk usage of the repo, in bytes.

  * `pubsub_configs`: How this repository publishes a change in the repository through Cloud Pub/Sub.  Keyed by the topic names.


## GCP permissions

Ensure the [Cloud Source Repositories API](https://console.cloud.google.com/apis/library/sourcerepo.googleapis.com/) is enabled for the current project.
