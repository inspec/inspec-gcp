+++
title = "google_sourcerepo_repositories resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_sourcerepo_repositories"
identifier = "inspec/resources/gcp/google_sourcerepo_repositories Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_sourcerepo_repositories` InSpec audit resource to to test a Google Cloud Repository resource.

## Examples

```ruby
repo_name = 'inspec-gcp-repository'
describe.one do
  google_sourcerepo_repositories(project: 'chef-gcp-inspec').names.each do |name|
    describe name do
      it { should match /\/repos\/#{repo_name}$/ }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_sourcerepo_repositories` resource:

See [google_sourcerepo_repository](google_sourcerepo_repository) for more detailed information.

  * `names`: an array of `google_sourcerepo_repository` name
  * `urls`: an array of `google_sourcerepo_repository` url
  * `sizes`: an array of `google_sourcerepo_repository` size
  * `pubsub_configs`: an array of `google_sourcerepo_repository` pubsub_configs

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Source Repositories API](https://console.cloud.google.com/apis/library/sourcerepo.googleapis.com/) is enabled for the current project.
