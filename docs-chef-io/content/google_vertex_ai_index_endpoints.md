+++
title = "google_vertex_ai_index_endpoints resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_vertex_ai_index_endpoints"
identifier = "inspec/resources/gcp/google_vertex_ai_index_endpoints resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_index_endpoints` InSpec audit resource to to test a Google Cloud IndexEndpoint resource.

## Examples

```ruby
    describe google_vertex_ai_index_endpoints(parent: "projects/#{gcp_project_id}/locations/#{index_endpoint['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_index_endpoints` resource:

See [google_vertex_ai_index_endpoint](google_vertex_ai_index_endpoint) for more detailed information.

  * `deployed_indexes`: an array of `google_vertex_ai_index_endpoint` deployed_indexes
  * `private_service_connect_configs`: an array of `google_vertex_ai_index_endpoint` private_service_connect_config
  * `display_names`: an array of `google_vertex_ai_index_endpoint` display_name
  * `public_endpoint_enableds`: an array of `google_vertex_ai_index_endpoint` public_endpoint_enabled
  * `labels`: an array of `google_vertex_ai_index_endpoint` labels
  * `create_times`: an array of `google_vertex_ai_index_endpoint` create_time
  * `names`: an array of `google_vertex_ai_index_endpoint` name
  * `networks`: an array of `google_vertex_ai_index_endpoint` network
  * `update_times`: an array of `google_vertex_ai_index_endpoint` update_time
  * `public_endpoint_domain_names`: an array of `google_vertex_ai_index_endpoint` public_endpoint_domain_name
  * `enable_private_service_connects`: an array of `google_vertex_ai_index_endpoint` enable_private_service_connect
  * `etags`: an array of `google_vertex_ai_index_endpoint` etag
  * `descriptions`: an array of `google_vertex_ai_index_endpoint` description

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions
