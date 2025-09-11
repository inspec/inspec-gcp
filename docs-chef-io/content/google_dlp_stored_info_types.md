+++
title = "google_dlp_stored_info_types resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_stored_info_types"
identifier = "inspec/resources/gcp/google_dlp_stored_info_types resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_stored_info_types` InSpec audit resource to to test a Google Cloud StoredInfoType resource.

## Examples

```ruby


describe google_dlp_stored_info_types(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}") do
it { should exist }
its('names') { should include 'i-inspec-gcp-dlp' }
end

```

## Properties

Properties that can be accessed from the `google_dlp_stored_info_types` resource:

See [google_dlp_stored_info_type](google_dlp_stored_info_type) for more detailed information.

  * `names`: an array of `google_dlp_stored_info_type` name
  * `descriptions`: an array of `google_dlp_stored_info_type` description
  * `display_names`: an array of `google_dlp_stored_info_type` display_name
  * `regexes`: an array of `google_dlp_stored_info_type` regex
  * `dictionaries`: an array of `google_dlp_stored_info_type` dictionary
  * `large_custom_dictionaries`: an array of `google_dlp_stored_info_type` large_custom_dictionary
  * `parents`: an array of `google_dlp_stored_info_type` parent

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
