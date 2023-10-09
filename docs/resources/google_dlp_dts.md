---
title: About the google_dlp_dts resource
platform: gcp
---

## Syntax
A `google_dlp_dts` is used to test a Google DT resource

## Examples
```

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

See [google_dlp_dt.md](google_dlp_dt.md) for more detailed information
  * `names`: an array of `google_dlp_dt` name
  * `descriptions`: an array of `google_dlp_dt` description
  * `display_names`: an array of `google_dlp_dt` display_name
  * `configs`: an array of `google_dlp_dt` config
  * `parents`: an array of `google_dlp_dt` parent

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
