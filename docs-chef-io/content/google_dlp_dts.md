+++
title = "google_dlp_dts resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_dts"
identifier = "inspec/resources/gcp/google_dlp_dts resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_dts` InSpec audit resource to to test a Google Cloud DT resource.

## Examples

```ruby
describe google_dlp_dt(parent: "projects/#{'chef-gcp-inspec'}/locations/#{''}", name: '') do
  it { should exist }
  its('display_name') { should cmp '' }
end

describe google_dlp_dt(parent: "projects/#{'chef-gcp-inspec'}/locations/#{''}", name: 'nonexistent') do
  it { should_not exist }
end

```

## Properties

Properties that can be accessed from the `google_dlp_dts` resource:

See [google_dlp_dt](google_dlp_dt) for more detailed information.

  * `names`: an array of `google_dlp_dt` name
  * `descriptions`: an array of `google_dlp_dt` description
  * `display_names`: an array of `google_dlp_dt` display_name
  * `configs`: an array of `google_dlp_dt` config
  * `parents`: an array of `google_dlp_dt` parent

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
