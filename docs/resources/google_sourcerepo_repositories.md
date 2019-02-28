---
title: About the google_sourcerepo_repositories resource
platform: gcp
---

## Syntax
A `google_sourcerepo_repositories` is used to test a Google Repository resource

## Examples
```
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

See [google_sourcerepo_repository.md](google_sourcerepo_repository.md) for more detailed information
  * `names`: an array of `google_sourcerepo_repository` name
  * `urls`: an array of `google_sourcerepo_repository` url
  * `sizes`: an array of `google_sourcerepo_repository` size

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Source Repositories API](https://console.cloud.google.com/apis/library/sourcerepo.googleapis.com/) is enabled for the current project.
