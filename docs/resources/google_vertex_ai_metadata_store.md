+++
title = "google_vertex_ai_metadata_store resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_metadata_store"
identifier = "inspec/resources/gcp/google_vertex_ai_metadata_store Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_metadata_store` is used to test a Google MetadataStore resource

## Examples
```
describe google_vertex_ai_metadata_store(name: "projects/#{gcp_project_id}/locations/#{metadata_store['region']}/metadataStores/#{metadata_store['name']}", region: ' value_region') do
	it { should exist }
	its('description') { should cmp 'value_description' }
	its('create_time') { should cmp 'value_createtime' }
	its('update_time') { should cmp 'value_updatetime' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_metadata_store(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_metadata_store` resource:


  * `description`: Description of the MetadataStore.

  * `create_time`: Output only. Timestamp when this MetadataStore was created.

  * `update_time`: Output only. Timestamp when this MetadataStore was last updated.

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `state`: Represents state information for a MetadataStore.

    * `disk_utilization_bytes`: The disk utilization of the MetadataStore in bytes.

  * `name`: Output only. The resource name of the MetadataStore instance.


## GCP Permissions
