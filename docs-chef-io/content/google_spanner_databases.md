+++
title = "google_spanner_databases resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_spanner_databases"
identifier = "inspec/resources/gcp/google_spanner_databases resource"
parent = "inspec/resources/gcp"
+++

Use the `google_spanner_databases` InSpec audit resource to to test a Google Cloud Database resource.

## Examples

```ruby
describe.one do
	google_spanner_databases(project: 'chef-gcp-inspec', instance: 'spinstance').names.each do |name|
	  describe name do
	  	it { should match 'spdatabase' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_spanner_databases` resource:

See [google_spanner_database](google_spanner_database) for more detailed information.

  * `names`: an array of `google_spanner_database` name
  * `instances`: an array of `google_spanner_database` instance

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Spanner API](https://console.cloud.google.com/apis/library/spanner.googleapis.com/) is enabled for the current project.
