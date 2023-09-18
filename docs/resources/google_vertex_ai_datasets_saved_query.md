---
title: About the google_vertex_ai_datasets_saved_query resource
platform: gcp
---

## Syntax
A `google_vertex_ai_datasets_saved_query` is used to test a Google DatasetsSavedQuery resource

## Examples
```
describe google_vertex_ai_datasets_saved_query() do
	it { should exist }
	its('update_time') { should cmp 'value_updatetime' }
	its('problem_type') { should cmp 'value_problemtype' }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }
	its('etag') { should cmp 'value_etag' }
	its('display_name') { should cmp 'value_displayname' }
	its('annotation_filter') { should cmp 'value_annotationfilter' }

end

describe google_vertex_ai_datasets_saved_query() do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_datasets_saved_query` resource:


  * `annotation_spec_count`: Output only. Number of AnnotationSpecs in the context of the SavedQuery.

  * `update_time`: Output only. Timestamp when SavedQuery was last updated.

  * `support_automl_training`: Output only. If the Annotations belonging to the SavedQuery can be used for AutoML training.

  * `metadata`: Some additional information about the SavedQuery.

  * `problem_type`: Required. Problem type of the SavedQuery. Allowed values: * IMAGE_CLASSIFICATION_SINGLE_LABEL * IMAGE_CLASSIFICATION_MULTI_LABEL * IMAGE_BOUNDING_POLY * IMAGE_BOUNDING_BOX * TEXT_CLASSIFICATION_SINGLE_LABEL * TEXT_CLASSIFICATION_MULTI_LABEL * TEXT_EXTRACTION * TEXT_SENTIMENT * VIDEO_CLASSIFICATION * VIDEO_OBJECT_TRACKING

  * `name`: Output only. Resource name of the SavedQuery.

  * `create_time`: Output only. Timestamp when this SavedQuery was created.

  * `etag`: Used to perform a consistent read-modify-write update. If not set, a blind "overwrite" update happens.

  * `display_name`: Required. The user-defined name of the SavedQuery. The name can be up to 128 characters long and can consist of any UTF-8 characters.

  * `annotation_filter`: Output only. Filters on the Annotations in the dataset.


## GCP Permissions
