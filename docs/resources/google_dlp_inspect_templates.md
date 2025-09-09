+++
title = "google_dlp_inspect_templates resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_inspect_templates"
identifier = "inspec/resources/gcp/google_dlp_inspect_templates Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_inspect_templates` InSpec audit resource to to test a Google Cloud InspectTemplate resource.

## Examples

```ruby


describe google_dlp_inspect_templates(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}") do
it { should exist }
its('names') { should include 'i-inspec-gcp-dlp' }
its('types') { should include 'INSPECT_JOB' }
its('states') { should include 'ACTIVE' }
end

```

## Properties

Properties that can be accessed from the `google_dlp_inspect_templates` resource:

See [google_dlp_inspect_template](google_dlp_inspect_template) for more detailed information.

  * `names`: an array of `google_dlp_inspect_template` name
  * `descriptions`: an array of `google_dlp_inspect_template` description
  * `display_names`: an array of `google_dlp_inspect_template` display_name
  * `inspect_configs`: an array of `google_dlp_inspect_template` inspect_config
  * `parents`: an array of `google_dlp_inspect_template` parent

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
