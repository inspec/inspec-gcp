---
title: About the Topic resource
platform: gcp
---


## Syntax
A `google_pubsub_topic` is used to test a Google Topic resource

## Examples
```
describe google_pubsub_topic(project: '', name: 'inspec-gcp-topic') do
  it { should exist }
end

```

## Properties
Properties that can be accessed from the `google_pubsub_topic` resource:

  * `name`: Name of the topic.
