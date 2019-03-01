---
title: About the google_pubsub_topic resource
platform: gcp
---

## Syntax
A `google_pubsub_topic` is used to test a Google Topic resource

## Examples
```
describe google_pubsub_topic(project: 'chef-gcp-inspec', name: 'inspec-gcp-topic') do
  it { should exist }
end

describe google_pubsub_topic(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_pubsub_topic` resource:

  * `name`: Name of the topic.

  * `labels`: A set of key/value label pairs to assign to this Topic.



## GCP Permissions

Ensure the [Cloud Pub/Sub API](https://console.cloud.google.com/apis/library/pubsub.googleapis.com/) is enabled for the current project.
