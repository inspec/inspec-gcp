+++
title = "google_vertex_ai_datasets_annotation_spec resource"

draft = false


[menu.gcp]
title = "google_vertex_ai_datasets_annotation_spec"
identifier = "inspec/resources/gcp/google_vertex_ai_datasets_annotation_spec resource"
parent = "inspec/resources/gcp"
+++

Use the `google_vertex_ai_datasets_annotation_spec` InSpec audit resource to to test a Google Cloud DatasetsAnnotationSpec resource.

## Examples

```ruby
describe google_vertex_ai_datasets_annotation_spec(name: "projects/#{gcp_project_id}/locations/#{datasets_annotation_spec['region']}/datasets/#{datasets_annotation_spec['dataset']}/annotationSpecs/#{datasets_annotation_spec['name']}", region: ' value_region') do
	it { should exist }
	its('display_name') { should cmp 'value_displayname' }
	its('name') { should cmp 'value_name' }
	its('etag') { should cmp 'value_etag' }
	its('create_time') { should cmp 'value_createtime' }
	its('update_time') { should cmp 'value_updatetime' }

end

describe google_vertex_ai_datasets_annotation_spec(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_vertex_ai_datasets_annotation_spec` resource:


  * `display_name`: Required. The user-defined name of the AnnotationSpec. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `name`: Output only. Resource name of the AnnotationSpec.

  * `etag`: Optional. Used to perform consistent read-modify-write updates. If not set, a blind "overwrite" update happens.

  * `create_time`: Output only. Timestamp when this AnnotationSpec was created.

  * `update_time`: Output only. Timestamp when AnnotationSpec was last updated.


## GCP permissions
