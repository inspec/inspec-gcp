+++
title = "google_vertex_ai_tensorboards resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_tensorboards"
identifier = "inspec/resources/gcp/google_vertex_ai_tensorboards resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_tensorboards` InSpec audit resource to to test a Google Cloud Tensorboard resource.

## Examples

```ruby
    describe google_vertex_ai_tensorboards(parent: "projects/#{gcp_project_id}/locations/#{tensorboard['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_tensorboards` resource:

See [google_vertex_ai_tensorboard](google_vertex_ai_tensorboard) for more detailed information.

  * `names`: an array of `google_vertex_ai_tensorboard` name
  * `is_defaults`: an array of `google_vertex_ai_tensorboard` is_default
  * `update_times`: an array of `google_vertex_ai_tensorboard` update_time
  * `labels`: an array of `google_vertex_ai_tensorboard` labels
  * `blob_storage_path_prefixes`: an array of `google_vertex_ai_tensorboard` blob_storage_path_prefix
  * `etags`: an array of `google_vertex_ai_tensorboard` etag
  * `create_times`: an array of `google_vertex_ai_tensorboard` create_time
  * `run_counts`: an array of `google_vertex_ai_tensorboard` run_count
  * `encryption_specs`: an array of `google_vertex_ai_tensorboard` encryption_spec
  * `display_names`: an array of `google_vertex_ai_tensorboard` display_name
  * `descriptions`: an array of `google_vertex_ai_tensorboard` description

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
